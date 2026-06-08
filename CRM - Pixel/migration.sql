-- ============================================================
-- CRM Pixel Rain — Migração de Dados
-- ============================================================
-- PRÉ-REQUISITO: schema.sql já executado com sucesso.
--
-- Tabelas de destino (nomes reais no Supabase):
--   leads            ← leads do funil
--   lead_history     ← histórico de contatos / eventos
--   lead_notes       ← notas internas
--   lead_activities  ← tarefas agendadas
--   lead_checklists  ← progresso dos checklists
--
-- COMO USAR:
--   1. No CRM, clique no menu superior → "Exportar / Backup"
--   2. Salve o arquivo JSON gerado
--   3. Abra o JSON, copie o conteúdo COMPLETO (tudo entre { e })
--   4. Neste arquivo, localize o bloco marcado com:
--          <<< COLE O JSON AQUI >>>
--      e substitua (incluindo os delimitadores <<<...>>>) pelo JSON
--   5. Cole o script inteiro no Supabase SQL Editor e execute
--
-- O script é transacional: se qualquer INSERT falhar,
-- TUDO é revertido automaticamente — sem dados parciais.
--
-- TIMEZONE: BRT (UTC-3) — fixo, sem DST desde 2019.
-- Ajuste a constante tz_offset abaixo se necessário.
-- ============================================================


DO $$
DECLARE
  -- ============================================================
  -- CONFIGURAÇÃO
  -- ============================================================
  tz_offset    TEXT    := '-03:00';   -- BRT = UTC-3
  json_text    TEXT;
  raw_data     JSONB;

  -- Cursores de iteração
  lead_json    JSONB;
  hist_json    JSONB;
  note_json    JSONB;
  act_json     JSONB;
  chk_rec      RECORD;

  -- IDs gerados
  new_lead_id  UUID;

  -- Contadores para o relatório final
  ct_leads     INTEGER := 0;
  ct_history   INTEGER := 0;
  ct_notes     INTEGER := 0;
  ct_acts      INTEGER := 0;
  ct_chk       INTEGER := 0;

BEGIN

  -- ============================================================
  -- PASSO 1 — JSON EXPORTADO
  -- Substitua o bloco abaixo pelo conteúdo do arquivo exportado.
  -- ============================================================
  json_text := $JSON$
<<< COLE O JSON AQUI >>>
  $JSON$;

  raw_data := json_text::JSONB;

  -- Valida que o JSON tem o campo 'leads'
  IF raw_data->'leads' IS NULL THEN
    RAISE EXCEPTION 'JSON inválido: campo "leads" não encontrado. Verifique o conteúdo exportado.';
  END IF;

  RAISE NOTICE 'JSON carregado. Leads encontrados: %', jsonb_array_length(raw_data->'leads');


  -- ============================================================
  -- PASSO 2 — TABELA TEMPORÁRIA DE MAPEAMENTO DE IDs
  -- old_id (string do JS)  →  new_id (UUID Postgres)
  -- ============================================================
  CREATE TEMP TABLE _id_map (
    old_id  TEXT PRIMARY KEY,
    new_id  UUID NOT NULL DEFAULT gen_random_uuid()
  ) ON COMMIT DROP;

  -- Pré-gera um UUID para cada lead
  INSERT INTO _id_map (old_id)
  SELECT DISTINCT lead_json_item->>'id'
  FROM jsonb_array_elements(raw_data->'leads') AS lead_json_item
  WHERE lead_json_item->>'id' IS NOT NULL;

  RAISE NOTICE 'UUIDs gerados para % leads.', (SELECT COUNT(*) FROM _id_map);


  -- ============================================================
  -- PASSO 3 — INSERÇÃO DOS DADOS
  -- Ordem: leads → lead_history → lead_notes
  --        → lead_activities → lead_checklists
  -- ============================================================

  FOR lead_json IN
    SELECT * FROM jsonb_array_elements(raw_data->'leads')
  LOOP

    -- Resolve o UUID para este lead
    SELECT new_id INTO new_lead_id
    FROM _id_map
    WHERE old_id = lead_json->>'id';

    -- ----------------------------------------------------------
    -- 3A. INSERT em leads
    -- ----------------------------------------------------------
    INSERT INTO leads (
      id,
      name,               city,             empresa,
      cargo,              site,             instagram,
      whatsapp,           email,            obs,
      segment,            ticket,           stage,
      score,              hot,              indication,
      no_shows,           lost_reason,
      next_touch,         first_contact_date, stage_date,
      score_budget,       score_urgencia,   score_consciencia,
      score_estrutura,    score_abertura,
      created_at,         updated_at
    )
    VALUES (
      new_lead_id,

      -- Identificação (name e city são obrigatórios)
      lead_json->>'name',
      lead_json->>'city',
      NULLIF(TRIM(COALESCE(lead_json->>'empresa', '')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'cargo',   '')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'site',     '')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'instagram','')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'whatsapp', '')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'email',    '')), ''),
      NULLIF(TRIM(COALESCE(lead_json->>'obs',      '')), ''),

      -- Classificação
      COALESCE(lead_json->>'segment', 'solo'),
      COALESCE(lead_json->>'ticket',  'N1'),
      COALESCE(lead_json->>'stage',   'E1'),

      -- Qualificação
      COALESCE((lead_json->>'score')::SMALLINT,     0),
      COALESCE((lead_json->>'hot')::BOOLEAN,        FALSE),
      COALESCE((lead_json->>'indication')::BOOLEAN, FALSE),
      COALESCE((lead_json->>'noShows')::SMALLINT,   0),
      NULLIF(TRIM(COALESCE(lead_json->>'lostReason', '')), ''),

      -- Datas de controle
      NULLIF(TRIM(COALESCE(lead_json->>'nextTouch',        '')), '')::DATE,
      NULLIF(TRIM(COALESCE(lead_json->>'firstContactDate', '')), '')::DATE,
      NULLIF(TRIM(COALESCE(lead_json->>'stageDate',        '')), '')::DATE,

      -- Score detalhado (5 dimensões)
      COALESCE((lead_json->'scoreData'->>'budget')::SMALLINT,      0),
      COALESCE((lead_json->'scoreData'->>'urgencia')::SMALLINT,    0),
      COALESCE((lead_json->'scoreData'->>'consciencia')::SMALLINT, 0),
      COALESCE((lead_json->'scoreData'->>'estrutura')::SMALLINT,   0),
      COALESCE((lead_json->'scoreData'->>'abertura')::SMALLINT,    0),

      -- Auditoria
      NOW(),
      NOW()
    );

    ct_leads := ct_leads + 1;


    -- ----------------------------------------------------------
    -- 3B. INSERT em lead_history
    -- Formato de data no JSON: "YYYY-MM-DD HH:mm"
    -- Conversão: "2026-06-01 09:15" → "2026-06-01T09:15:00-03:00"
    -- ----------------------------------------------------------
    FOR hist_json IN
      SELECT * FROM jsonb_array_elements(
        COALESCE(lead_json->'history', '[]'::JSONB)
      )
    LOOP
      INSERT INTO lead_history (
        lead_id,
        channel,
        status,
        text,
        event_date,
        remark_date
      )
      VALUES (
        new_lead_id,
        hist_json->>'channel',
        hist_json->>'status',
        NULLIF(TRIM(COALESCE(hist_json->>'text', '')), ''),
        -- Converte "YYYY-MM-DD HH:mm" → TIMESTAMPTZ
        (REPLACE(hist_json->>'date', ' ', 'T') || ':00' || tz_offset)::TIMESTAMPTZ,
        -- remarkDate só existe em eventos noshow/remarcou
        NULLIF(TRIM(COALESCE(hist_json->>'remarkDate', '')), '')::DATE
      );

      ct_history := ct_history + 1;
    END LOOP;


    -- ----------------------------------------------------------
    -- 3C. INSERT em lead_notes
    -- ----------------------------------------------------------
    FOR note_json IN
      SELECT * FROM jsonb_array_elements(
        COALESCE(lead_json->'notes', '[]'::JSONB)
      )
    LOOP
      INSERT INTO lead_notes (
        lead_id,
        text,
        autor,
        created_at
      )
      VALUES (
        new_lead_id,
        note_json->>'text',
        COALESCE(NULLIF(TRIM(COALESCE(note_json->>'autor', '')), ''), 'Nil'),
        -- Preserva a data original da nota
        (REPLACE(note_json->>'date', ' ', 'T') || ':00' || tz_offset)::TIMESTAMPTZ
      );

      ct_notes := ct_notes + 1;
    END LOOP;


    -- ----------------------------------------------------------
    -- 3D. INSERT em lead_activities
    -- Campo de data no JSON: "data" (não "date"), formato YYYY-MM-DD
    -- Campo de hora no JSON: "hora", formato HH:mm
    -- ----------------------------------------------------------
    FOR act_json IN
      SELECT * FROM jsonb_array_elements(
        COALESCE(lead_json->'activities', '[]'::JSONB)
      )
    LOOP
      INSERT INTO lead_activities (
        lead_id,
        tipo,
        due_date,
        due_time,
        responsavel,
        feito
      )
      VALUES (
        new_lead_id,
        act_json->>'tipo',
        (act_json->>'data')::DATE,
        NULLIF(TRIM(COALESCE(act_json->>'hora', '')), ''),
        COALESCE(NULLIF(TRIM(COALESCE(act_json->>'responsavel', '')), ''), 'Nil'),
        COALESCE((act_json->>'feito')::BOOLEAN, FALSE)
      );

      ct_acts := ct_acts + 1;
    END LOOP;


    -- ----------------------------------------------------------
    -- 3E. INSERT em lead_checklists
    -- JSON: { "chk_d1": true, "chk_f2": false }
    -- Só insere itens que existem no JSON (tocados pelo usuário).
    -- Itens ausentes = nunca marcados = não precisam existir no banco.
    -- ----------------------------------------------------------
    FOR chk_rec IN
      SELECT key AS item_id, value::BOOLEAN AS done
      FROM jsonb_each_text(
        COALESCE(lead_json->'checklists', '{}'::JSONB)
      )
    LOOP
      INSERT INTO lead_checklists (lead_id, item_id, done)
      VALUES (new_lead_id, chk_rec.item_id, chk_rec.done)
      ON CONFLICT (lead_id, item_id)
      DO UPDATE SET done = EXCLUDED.done, updated_at = NOW();

      ct_chk := ct_chk + 1;
    END LOOP;

  END LOOP;  -- fim do loop de leads


  -- ============================================================
  -- PASSO 4 — RELATÓRIO DE MIGRAÇÃO
  -- ============================================================
  RAISE NOTICE '==============================================';
  RAISE NOTICE 'MIGRAÇÃO CONCLUÍDA';
  RAISE NOTICE '----------------------------------------------';
  RAISE NOTICE '  leads           : %', ct_leads;
  RAISE NOTICE '  lead_history    : %', ct_history;
  RAISE NOTICE '  lead_notes      : %', ct_notes;
  RAISE NOTICE '  lead_activities : %', ct_acts;
  RAISE NOTICE '  lead_checklists : %', ct_chk;
  RAISE NOTICE '==============================================';

END $$;


-- ============================================================
-- VERIFICAÇÃO PÓS-MIGRAÇÃO
-- Execute estas queries para confirmar os totais.
-- Compare com os números exibidos nos RAISE NOTICE acima.
-- ============================================================
SELECT 'leads'           AS tabela, COUNT(*) AS registros FROM leads
UNION ALL
SELECT 'lead_history',              COUNT(*)               FROM lead_history
UNION ALL
SELECT 'lead_notes',                COUNT(*)               FROM lead_notes
UNION ALL
SELECT 'lead_activities',           COUNT(*)               FROM lead_activities
UNION ALL
SELECT 'lead_checklists',           COUNT(*)               FROM lead_checklists
ORDER BY tabela;
