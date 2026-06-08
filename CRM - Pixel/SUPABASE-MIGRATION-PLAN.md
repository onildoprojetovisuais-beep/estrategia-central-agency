# Supabase Migration Plan — CRM Pixel Rain
**Data:** 2026-06-08  
**Baseado em:** LOCALSTORAGE-AUDIT.md  
**Status:** Aguardando aprovação — NENHUM código alterado

---

## Visão geral da estratégia

**De:** Single HTML file + localStorage (single-user, offline, ~5MB limit)  
**Para:** HTML file (mantido) + Supabase (Postgres + Auth + Realtime)

A estratégia escolhida é **mínima fricção**: manter o HTML como está, substituir apenas `loadState()` / `saveState()` por chamadas assíncronas ao Supabase JS SDK via CDN. Não exige rebuild para React/Next.js.

---

## Estrutura proposta do banco de dados

### Tabela `leads`

```sql
CREATE TABLE leads (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID REFERENCES auth.users(id) ON DELETE CASCADE,

  -- Identificação
  name            TEXT NOT NULL,
  city            TEXT NOT NULL,
  empresa         TEXT,
  cargo           TEXT,
  site            TEXT,
  instagram       TEXT,
  whatsapp        TEXT,
  email           TEXT,
  obs             TEXT,

  -- Classificação
  segment         TEXT CHECK (segment IN ('solo','clinica','transicao','jovem','veterano')),
  ticket          TEXT CHECK (ticket IN ('N1','N2','N3')),
  stage           TEXT NOT NULL DEFAULT 'E1'
                    CHECK (stage IN ('E1','E2','E3','E4','E5','E6','E7','E8','E9','E10')),

  -- Qualificação
  score           INTEGER NOT NULL DEFAULT 0 CHECK (score >= 0 AND score <= 100),
  hot             BOOLEAN NOT NULL DEFAULT FALSE,
  indication      BOOLEAN NOT NULL DEFAULT FALSE,
  no_shows        INTEGER NOT NULL DEFAULT 0,
  lost_reason     TEXT,          -- NULL se não perdido

  -- Datas de controle
  next_touch      DATE,
  first_contact_date DATE,
  stage_date      DATE,

  -- Score detalhado (5 dimensões)
  score_budget        INTEGER NOT NULL DEFAULT 0,
  score_urgencia      INTEGER NOT NULL DEFAULT 0,
  score_consciencia   INTEGER NOT NULL DEFAULT 0,
  score_estrutura     INTEGER NOT NULL DEFAULT 0,
  score_abertura      INTEGER NOT NULL DEFAULT 0,

  -- Auditoria
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Atualiza updated_at automaticamente
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER leads_updated_at
  BEFORE UPDATE ON leads
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
```

### Tabela `lead_history`

```sql
CREATE TABLE lead_history (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID NOT NULL REFERENCES leads(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES auth.users(id),

  channel     TEXT NOT NULL
                CHECK (channel IN ('wpp','phone','email','meet','system')),
  status      TEXT NOT NULL
                CHECK (status IN ('enviado','semresp','respondeu','noshow',
                                  'remarcou','etapa','criado','perdido')),
  text        TEXT,
  event_date  TIMESTAMPTZ NOT NULL,   -- era: "2026-06-01 09:15"
  remark_date DATE,                   -- era: "2026-06-09" (só noshow/remarcou)

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_lead_history_lead_id ON lead_history(lead_id);
CREATE INDEX idx_lead_history_event_date ON lead_history(event_date DESC);
```

### Tabela `lead_notes`

```sql
CREATE TABLE lead_notes (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID NOT NULL REFERENCES leads(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES auth.users(id),

  text        TEXT NOT NULL,
  autor       TEXT NOT NULL DEFAULT 'Nil',

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_lead_notes_lead_id ON lead_notes(lead_id);
```

### Tabela `lead_activities`

```sql
CREATE TABLE lead_activities (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID NOT NULL REFERENCES leads(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES auth.users(id),

  tipo        TEXT NOT NULL
                CHECK (tipo IN ('whatsapp','ligacao','diagnostico','proposta','followup')),
  due_date    DATE NOT NULL,
  due_time    TEXT,              -- HH:mm como texto (pode ser TIME depois)
  responsavel TEXT NOT NULL DEFAULT 'Nil',
  feito       BOOLEAN NOT NULL DEFAULT FALSE,

  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_lead_activities_lead_id ON lead_activities(lead_id);
CREATE INDEX idx_lead_activities_due_date ON lead_activities(due_date);
CREATE INDEX idx_lead_activities_feito ON lead_activities(feito) WHERE feito = FALSE;
```

### Tabela `lead_checklists`

```sql
CREATE TABLE lead_checklists (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lead_id     UUID NOT NULL REFERENCES leads(id) ON DELETE CASCADE,
  user_id     UUID REFERENCES auth.users(id),

  item_id     TEXT NOT NULL,     -- ex: 'chk_d1', 'chk_f1', 'chk_c3'
  done        BOOLEAN NOT NULL DEFAULT FALSE,

  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  UNIQUE (lead_id, item_id)
);

CREATE INDEX idx_lead_checklists_lead_id ON lead_checklists(lead_id);
```

### (Opcional) Tabela `filters_state`

```sql
-- Somente se quiser persistir filtros por usuário entre sessões
CREATE TABLE user_preferences (
  user_id     UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  filters     JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

> **Recomendação:** Não migrar `filters` para o banco. Usar `sessionStorage` ou estado em memória — os filtros são preferências de UI, não dados de negócio.

---

## Row Level Security (RLS)

```sql
-- Habilitar RLS em todas as tabelas
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_activities ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_checklists ENABLE ROW LEVEL SECURITY;

-- Políticas: cada usuário vê apenas seus próprios dados
CREATE POLICY "leads: owner only"
  ON leads FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- Repetir pattern para as demais tabelas...
-- (lead_history, lead_notes, lead_activities, lead_checklists)
```

---

## Diagrama de entidades

```
auth.users
    │
    ├── leads (1:N via user_id)
    │       │
    │       ├── lead_history    (N:1 via lead_id, CASCADE DELETE)
    │       ├── lead_notes      (N:1 via lead_id, CASCADE DELETE)
    │       ├── lead_activities (N:1 via lead_id, CASCADE DELETE)
    │       └── lead_checklists (N:1 via lead_id, CASCADE DELETE, UNIQUE item_id)
    │
    └── user_preferences (opcional, filtros de UI)
```

---

## Plano de migração em fases

### Fase 0 — Pré-requisitos (1 dia)
- [ ] Criar projeto Supabase
- [ ] Configurar Auth (email + senha é suficiente para 1 usuário)
- [ ] Aplicar DDL das tabelas acima
- [ ] Habilitar RLS e criar políticas
- [ ] Testar conexão com Supabase JS SDK no browser

### Fase 1 — Migração dos dados existentes (meio dia)
- [ ] Abrir CRM atual e usar **Export** para baixar o JSON atual
- [ ] Escrever script de migração (Node.js ou Python) que:
  - Lê o JSON exportado
  - Gera UUID para cada lead, history, note, activity
  - Mantém mapeamento old_id → new_uuid
  - Faz INSERT nas tabelas na ordem correta (leads → children)
  - Converte `"2026-06-01 09:15"` → `"2026-06-01T09:15:00-03:00"`
  - Converte `lead.checklists = { chk_d1: true }` → linhas na tabela `lead_checklists`
- [ ] Validar contagem: leads, history entries, notes, activities, checklist items

### Fase 2 — Adaptar `loadState()` e `saveState()` (1–2 dias)
- [ ] Adicionar `<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js">` ao HTML
- [ ] Inicializar cliente Supabase com `SUPABASE_URL` e `SUPABASE_ANON_KEY`
- [ ] Implementar `loadState()` assíncrona:
  - Busca todos os leads do usuário autenticado
  - Faz JOIN ou queries paralelas para history/notes/activities/checklists
  - Reconstrói o objeto `state.leads[]` no formato existente
- [ ] Implementar `saveState()` substituída por funções granulares:
  - `upsertLead(lead)` — INSERT ou UPDATE na tabela `leads`
  - `insertHistoryEvent(event, leadId)` — INSERT em `lead_history`
  - `upsertNote(note, leadId)` — INSERT/UPDATE em `lead_notes`
  - `upsertActivity(activity, leadId)` — INSERT/UPDATE em `lead_activities`
  - `toggleChecklistItem(leadId, itemId, done)` — UPSERT em `lead_checklists`
  - `deleteLead(leadId)` — DELETE cascateado

### Fase 3 — Auth e tela de login (meio dia)
- [ ] Criar tela de login simples (email + senha) antes do CRM carregar
- [ ] Usar `supabase.auth.signInWithPassword()`
- [ ] Guardar sessão e refresh token via SDK (automático)
- [ ] Adicionar botão de logout

### Fase 4 — Validação e cutover (1 dia)
- [ ] Testar todas as 20 operações de escrita mapeadas na auditoria
- [ ] Verificar que localStorage pode ser desativado sem quebrar nada
- [ ] Manter `localStorage` como cache de leitura inicial (opcional) para UX mais rápida
- [ ] Remover `getDemoLeads()` do código de produção (ou manter como opcional)

---

## Riscos identificados

### Risco 1 — Migração de IDs (ALTO)
**Problema:** IDs atuais são strings como `'l1'`, `'l2'` (demo) e `'id_abc12def3g'` (gerados). O Postgres espera UUIDs.  
**Impacto:** Todos os IDs precisam ser regenerados. Referências cruzadas dentro do JSON (ex: `activities[].leadId`) precisam ser atualizadas.  
**Mitigação:** Script de migração com tabela de mapeamento old_id → new_uuid.

### Risco 2 — `saveState()` é síncrona, Supabase é assíncrono (ALTO)
**Problema:** Atualmente `saveState()` é chamada em 20 pontos, sempre de forma síncrona. Com Supabase, cada operação retorna uma Promise. Todo o código de interação precisará de `async/await`.  
**Impacto:** Refatoração significativa — cada função que chama `saveState()` precisa ser assíncrona.  
**Mitigação:** Wrapper `saveState()` pode ser substituído por um dispatcher que aceita uma operação descritiva e enfileira as chamadas ao Supabase. Mantém a assinatura externa mas torna o internado assíncrono.

### Risco 3 — Sem auth hoje = sem `user_id` nos dados (MÉDIO)
**Problema:** Os dados atuais não têm o conceito de `user_id`. Na migração, todos os dados precisam ser associados ao usuário que será criado.  
**Impacto:** Baixo — é a primeira conta. Mas o schema precisa estar pronto para multi-usuário desde o início.  
**Mitigação:** Criar o usuário no Supabase Auth primeiro, depois inserir todos os dados com o `user_id` desse usuário.

### Risco 4 — Campo `noShows` redundante (BAIXO-MÉDIO)
**Problema:** `lead.noShows` é um contador que também pode ser derivado de `COUNT(lead_history WHERE status='noshow')`. Os dois podem divergir.  
**Impacto:** Nas regras de negócio (ex: `isNoShowLost()` usa `getNoShowCount()` que lê history, não o campo), então a lógica já está correta. O campo `no_shows` na tabela pode ser mantido como cache denormalizado ou calculado via view/trigger.  
**Mitigação:** Criar trigger Postgres que atualiza `leads.no_shows` automaticamente quando um evento de no-show é inserido em `lead_history`.

### Risco 5 — Latência percebida (MÉDIO)
**Problema:** Hoje todos os renders são instantâneos (leitura de memória). Com Supabase, a carga inicial e cada gravação terão latência de rede.  
**Impacto:** O CRM pode parecer mais lento na primeira carga e em operações de escrita.  
**Mitigação:** Manter `state` em memória como cache local. Escrita otimista: atualizar o UI imediatamente no estado local, fazer a chamada Supabase em background. Em caso de erro, reverter e exibir toast de erro.

### Risco 6 — Perda de dados se `saveState()` falhar (MÉDIO)
**Problema:** Hoje `saveState()` nunca falha (a menos que localStorage esteja cheio). Com Supabase, há rede, auth expirada, RLS bloqueando, etc.  
**Impacto:** Uma operação pode parecer bem-sucedida no UI mas não persistir.  
**Mitigação:** Todos os writes devem tratar o retorno `{ data, error }` do Supabase e exibir toast de erro se houver falha.

### Risco 7 — `filters` persistidos junto com dados (BAIXO)
**Problema:** O objeto `state.filters` é salvo no localStorage junto com os leads. Se migrado ao pé da letra para Supabase, geraria uma tabela separada só para filtros.  
**Impacto:** Baixo — filtros não são dados críticos.  
**Mitigação:** Não migrar `filters` para Supabase. Usar `sessionStorage` ou simplesmente inicializar sempre com filtros zerados.

### Risco 8 — Checklists como objeto flat (BAIXO)
**Problema:** `lead.checklists = { chk_d1: true, chk_f2: false }` é um map arbitrário. Os IDs dos itens (`chk_d1`, `chk_f1`, etc.) são hardcoded como constantes JS.  
**Impacto:** Na tabela `lead_checklists`, a coluna `item_id` aceitará qualquer string — não há FK para uma tabela de definições de checklist.  
**Mitigação:** Aceitar a inconsistência no schema (sem FK de item_id) por ora. Se os checklists precisarem de edição futura, criar tabela `checklist_definitions`.

---

## Decisões que precisam de aprovação

| Decisão | Opção A | Opção B | Recomendação |
|---|---|---|---|
| **Abordagem de migração** | Manter HTML, adicionar Supabase JS SDK via CDN | Reescrever em React/Next.js | **Opção A** — menor risco, menor esforço |
| **Auth** | Email + senha (single user) | Magic link (sem senha) | **Opção A** — mais simples para 1 usuário |
| **Filters** | Não persistir (sessionStorage) | Persistir em `user_preferences` | **Não persistir** — é UI state |
| **Templates** | Manter como constante JS | Migrar para tabela `templates` | **Manter no JS** — são conteúdo, não dados |
| **Checklists** | Manter IDs como strings livres | Criar tabela `checklist_definitions` | **Manter strings** — suficiente por ora |
| **noShows campo** | Manter como campo + trigger de sync | Remover e calcular sempre do history | **Manter + trigger** — performance nas views |
| **Cache local** | Sem cache, sempre buscar do Supabase | Estado em memória + writes otimistas | **Escrita otimista** — UX mais fluida |
| **Backup** | Manter botão Export como JSON | Supabase backups automáticos | **Ambos** — redundância é boa |

---

## Estimativa de esforço

| Fase | Esforço estimado |
|---|---|
| Fase 0 — Setup Supabase | 2–3 horas |
| Fase 1 — Script de migração de dados | 3–4 horas |
| Fase 2 — Substituir loadState/saveState | 1–2 dias |
| Fase 3 — Tela de login/auth | 2–3 horas |
| Fase 4 — Teste e validação | 3–4 horas |
| **Total estimado** | **2–3 dias úteis** |

---

## Checklist de aprovação (preencher antes de iniciar)

- [ ] Estratégia geral aprovada (Opção A — manter HTML)
- [ ] Decisões da tabela acima resolvidas
- [ ] Projeto Supabase criado e URL/key disponíveis
- [ ] Backup do localStorage atual exportado antes de qualquer alteração
- [ ] Script de migração de dados revisado antes de executar
