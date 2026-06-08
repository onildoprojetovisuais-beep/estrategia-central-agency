-- ============================================================
-- CRM Pixel Rain — Schema
-- ============================================================
-- Execute este arquivo no Supabase SQL Editor (ou via CLI)
-- antes de rodar migration.sql.
--
-- Tabelas criadas:
--   leads            → leads do funil
--   lead_history     → histórico de contatos / eventos de etapa
--   lead_notes       → notas internas
--   lead_activities  → tarefas agendadas
--   lead_checklists  → progresso dos checklists por lead
--
-- Sem auth, sem RLS, sem user_id — single workspace.
-- ============================================================


-- ============================================================
-- RESET (descomente só se quiser recriar do zero)
-- ATENÇÃO: apaga todos os dados existentes.
-- ============================================================
-- DROP TABLE IF EXISTS lead_checklists  CASCADE;
-- DROP TABLE IF EXISTS lead_activities  CASCADE;
-- DROP TABLE IF EXISTS lead_notes       CASCADE;
-- DROP TABLE IF EXISTS lead_history     CASCADE;
-- DROP TABLE IF EXISTS leads            CASCADE;
-- DROP FUNCTION IF EXISTS trigger_set_updated_at CASCADE;


-- ============================================================
-- FUNÇÃO: atualiza updated_at automaticamente
-- ============================================================
CREATE OR REPLACE FUNCTION trigger_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- ============================================================
-- TABELA: leads
-- ============================================================
CREATE TABLE IF NOT EXISTS leads (
  id                  UUID        PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Identificação
  name                TEXT        NOT NULL,
  city                TEXT        NOT NULL,
  empresa             TEXT,
  cargo               TEXT,
  site                TEXT,
  instagram           TEXT,
  whatsapp            TEXT,
  email               TEXT,
  obs                 TEXT,

  -- Classificação
  segment             TEXT        NOT NULL
                        CHECK (segment IN ('solo','clinica','transicao','jovem','veterano')),
  ticket              TEXT        NOT NULL
                        CHECK (ticket IN ('N1','N2','N3')),
  stage               TEXT        NOT NULL DEFAULT 'E1'
                        CHECK (stage IN ('E1','E2','E3','E4','E5','E6','E7','E8','E9','E10')),

  -- Qualificação
  score               SMALLINT    NOT NULL DEFAULT 0
                        CHECK (score >= 0 AND score <= 100),
  hot                 BOOLEAN     NOT NULL DEFAULT FALSE,
  indication          BOOLEAN     NOT NULL DEFAULT FALSE,
  no_shows            SMALLINT    NOT NULL DEFAULT 0,
  lost_reason         TEXT,                    -- NULL quando não é perda

  -- Datas de controle do funil
  next_touch          DATE,
  first_contact_date  DATE,
  stage_date          DATE,

  -- Score detalhado — 5 dimensões (soma = score)
  score_budget        SMALLINT    NOT NULL DEFAULT 0,   -- max 30
  score_urgencia      SMALLINT    NOT NULL DEFAULT 0,   -- max 25
  score_consciencia   SMALLINT    NOT NULL DEFAULT 0,   -- max 20
  score_estrutura     SMALLINT    NOT NULL DEFAULT 0,   -- max 15
  score_abertura      SMALLINT    NOT NULL DEFAULT 0,   -- max 10

  -- Auditoria
  created_at          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_leads_stage
  ON leads (stage);

CREATE INDEX IF NOT EXISTS idx_leads_next_touch
  ON leads (next_touch)
  WHERE next_touch IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_leads_score
  ON leads (score DESC);

CREATE INDEX IF NOT EXISTS idx_leads_updated
  ON leads (updated_at DESC);

-- Trigger updated_at
DROP TRIGGER IF EXISTS set_leads_updated_at ON leads;
CREATE TRIGGER set_leads_updated_at
  BEFORE UPDATE ON leads
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();


-- ============================================================
-- TABELA: lead_history
-- Histórico de contatos + eventos de sistema (criado, etapa, perdido)
-- ============================================================
CREATE TABLE IF NOT EXISTS lead_history (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID        NOT NULL REFERENCES leads (id) ON DELETE CASCADE,

  channel     TEXT        NOT NULL
                CHECK (channel IN ('wpp','phone','email','meet','system')),
  status      TEXT        NOT NULL
                CHECK (status IN ('enviado','semresp','respondeu','noshow',
                                  'remarcou','etapa','criado','perdido')),
  text        TEXT,
  event_date  TIMESTAMPTZ NOT NULL,
  remark_date DATE,                -- preenchido quando status = 'noshow' ou 'remarcou'

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_history_lead_id
  ON lead_history (lead_id);

CREATE INDEX IF NOT EXISTS idx_history_event_date
  ON lead_history (event_date DESC);

CREATE INDEX IF NOT EXISTS idx_history_status
  ON lead_history (status);


-- ============================================================
-- TABELA: lead_notes
-- Notas internas (não são mensagens ao lead)
-- ============================================================
CREATE TABLE IF NOT EXISTS lead_notes (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID        NOT NULL REFERENCES leads (id) ON DELETE CASCADE,

  text        TEXT        NOT NULL,
  autor       TEXT        NOT NULL DEFAULT 'Nil',

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
  -- Sem updated_at: notas são imutáveis (só inserção/exclusão)
);

CREATE INDEX IF NOT EXISTS idx_notes_lead_id
  ON lead_notes (lead_id);

CREATE INDEX IF NOT EXISTS idx_notes_created
  ON lead_notes (created_at DESC);


-- ============================================================
-- TABELA: lead_activities
-- Tarefas agendadas por lead
-- ============================================================
CREATE TABLE IF NOT EXISTS lead_activities (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID        NOT NULL REFERENCES leads (id) ON DELETE CASCADE,

  tipo        TEXT        NOT NULL
                CHECK (tipo IN ('whatsapp','ligacao','diagnostico','proposta','followup')),
  due_date    DATE        NOT NULL,
  due_time    TEXT,                -- HH:mm (texto livre; NULL = sem horário fixo)
  responsavel TEXT        NOT NULL DEFAULT 'Nil',
  feito       BOOLEAN     NOT NULL DEFAULT FALSE,

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_activities_lead_id
  ON lead_activities (lead_id);

CREATE INDEX IF NOT EXISTS idx_activities_due_date
  ON lead_activities (due_date);

-- Índice parcial: só atividades pendentes — usado pelas views Inbox e Execução
CREATE INDEX IF NOT EXISTS idx_activities_pending
  ON lead_activities (due_date)
  WHERE feito = FALSE;

-- Trigger updated_at
DROP TRIGGER IF EXISTS set_activities_updated_at ON lead_activities;
CREATE TRIGGER set_activities_updated_at
  BEFORE UPDATE ON lead_activities
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();


-- ============================================================
-- TABELA: lead_checklists
-- Progresso dos checklists por lead
-- (itens definidos como constantes no JS: chk_d1-d10, chk_f1-f5, chk_c1-c7)
-- ============================================================
CREATE TABLE IF NOT EXISTS lead_checklists (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID        NOT NULL REFERENCES leads (id) ON DELETE CASCADE,

  item_id     TEXT        NOT NULL,   -- ex: 'chk_d1', 'chk_f3', 'chk_c5'
  done        BOOLEAN     NOT NULL DEFAULT FALSE,

  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  CONSTRAINT uq_checklist_lead_item UNIQUE (lead_id, item_id)
);

CREATE INDEX IF NOT EXISTS idx_checklists_lead_id
  ON lead_checklists (lead_id);

-- Trigger updated_at
DROP TRIGGER IF EXISTS set_checklists_updated_at ON lead_checklists;
CREATE TRIGGER set_checklists_updated_at
  BEFORE UPDATE ON lead_checklists
  FOR EACH ROW EXECUTE FUNCTION trigger_set_updated_at();


-- ============================================================
-- VERIFICAÇÃO FINAL
-- Execute após rodar este script para confirmar a criação.
-- ============================================================
SELECT
  table_name,
  (SELECT COUNT(*) FROM information_schema.columns
   WHERE table_name = t.table_name AND table_schema = 'public') AS colunas
FROM information_schema.tables t
WHERE table_schema = 'public'
  AND table_name IN ('leads','lead_history','lead_notes','lead_activities','lead_checklists')
ORDER BY table_name;
