# localStorage Audit — CRM Pixel Rain
**Data:** 2026-06-08  
**Arquivo auditado:** `crm-pixel-rain.html` (4765 linhas, 258KB)  
**Objetivo:** Mapear todos os pontos de dependência de localStorage antes de migração para Supabase.

---

## 1. Chave e estrutura armazenada

### Chave única
```
pixelrain_crm_v2
```

Todo o estado do CRM é salvo em **um único JSON blob** nessa chave. Não há chaves secundárias.

### Estrutura do objeto `state`
```json
{
  "leads": [ ...array de objetos Lead... ],
  "filters": {
    "search": "",
    "seg": "",
    "score": "",
    "sla": "",
    "ticket": "",
    "city": ""
  }
}
```

---

## 2. Funções centrais de I/O

### `loadState()` — Linha 2734
```js
function loadState() {
  try {
    const saved = localStorage.getItem('pixelrain_crm_v2');
    if (saved) { state = JSON.parse(saved); }
    else { state.leads = getDemoLeads(); saveState(); }
  } catch(e) { state.leads = getDemoLeads(); saveState(); }
}
```
**Comportamento:** Uma chamada única na inicialização (`loadState()` em L4755). Se a chave não existir, carrega dados de demo e persiste imediatamente.

### `saveState()` — Linha 2742
```js
function saveState() {
  localStorage.setItem('pixelrain_crm_v2', JSON.stringify(state));
}
```
**Comportamento:** Serializa o objeto `state` inteiro e substitui a chave. Operação síncrona — bloqueia a thread em payloads grandes.

---

## 3. Mapeamento completo de chamadas a `saveState()`

| Linha | Função chamadora | Operação que dispara |
|---|---|---|
| 2738 | `loadState()` | Primeira carga com dados de demo |
| 2739 | `loadState()` catch | Fallback por JSON corrompido |
| 3031 | `saveLead()` | Novo lead cadastrado |
| 3348 | `toggleChecklist()` | Item de checklist marcado/desmarcado |
| 3448 | `advanceToStage()` | Lead avançado de etapa (via kanban) |
| 3551 | `saveContact()` | Contato/evento registrado no histórico |
| 3578 | `advanceStage()` | Lead avançado de etapa (via modal) |
| 3594 | `moveLead()` | Lead marcado como Perdido |
| 3631 | `saveScore()` | Score atualizado |
| 3675 | `saveEditLead()` | Dados cadastrais do lead editados |
| 3689 | `deleteLead()` | Lead excluído |
| 3716 | `clearFilters()` | Filtros limpos |
| 3775 | `importData()` | JSON importado via arquivo |
| 3787 | `resetDemo()` | Reset para dados de demonstração |
| 3934 | `saveNota()` | Nota adicionada |
| 3944 | `deleteNota()` | Nota excluída |
| 3984 | `saveAtividade()` | Atividade/tarefa criada |
| 3993 | `toggleAtividade()` | Atividade marcada como feita/desfeita |
| 4000 | `deleteAtividade()` | Atividade excluída |
| 4119 | `execToggleAtividade()` | Atividade concluída via view Execução |

**Total: 20 pontos de escrita.**

---

## 4. Entidade `Lead` — mapeamento completo de campos

```
state.leads[]
```

| Campo | Tipo JS | Valores / Exemplo | Observações |
|---|---|---|---|
| `id` | string | `'l1'`, `'id_abc12def'` | Gerado por `uid()`: `'id_' + random + Date.now()` |
| `name` | string | `'Dra. Marina Alves'` | Obrigatório |
| `city` | string | `'Campinas/SP'` | Obrigatório |
| `empresa` | string | `'Consultório Pediátrico Alves'` | |
| `cargo` | string | `'Pediatra Solo'` | |
| `site` | string | `'dramarinaalves.com.br'` | |
| `segment` | enum | `'solo'`, `'clinica'`, `'transicao'`, `'jovem'`, `'veterano'` | |
| `ticket` | enum | `'N1'`, `'N2'`, `'N3'` | N1=R$4k, N2=R$7k, N3=R$8.5k avg |
| `stage` | enum | `'E1'` a `'E10'` | 10 etapas do funil |
| `score` | number | 0–100 | Soma de `scoreData` |
| `hot` | boolean | `true`/`false` | Lead com gatilho ativo |
| `indication` | boolean | `true`/`false` | Veio por indicação |
| `whatsapp` | string | `'(19) 99887-6655'` | Formato livre |
| `email` | string | `'marina@pediatriaalves.com'` | |
| `instagram` | string | `'@drmarinaalves'` | Com @ |
| `obs` | string | texto livre | Observações gerais |
| `nextTouch` | string | `'2026-06-09'` | Data ISO YYYY-MM-DD |
| `firstContactDate` | string | `'2026-06-01'` | Data ISO YYYY-MM-DD |
| `stageDate` | string | `'2026-06-05'` | Data da última mudança de etapa |
| `noShows` | number | 0, 1, 2… | **Atenção:** contador redundante — também derivável de `history` |
| `lostReason` | string? | `'Momento financeiro'` | Só existe se stage=E10 e é perda |
| `scoreData` | object | `{ budget, urgencia, consciencia, estrutura, abertura }` | Cada campo 0-30 |
| `activities` | Activity[] | ver seção 5 | Array aninhado |
| `notes` | Note[] | ver seção 6 | Array aninhado |
| `checklists` | object | `{ chk_d1: true, chk_f1: false }` | Mapa flat de item_id → boolean |
| `history` | HistoryEvent[] | ver seção 7 | Array aninhado |

### Entidade `scoreData` (embedded no lead)
| Campo | Tipo | Max | Descrição |
|---|---|---|---|
| `budget` | number | 30 | Capacidade de pagamento |
| `urgencia` | number | 25 | Urgência do problema |
| `consciencia` | number | 20 | Nível de consciência do problema |
| `estrutura` | number | 15 | Estrutura operacional |
| `abertura` | number | 10 | Abertura para solução |

---

## 5. Entidade `Activity` — aninhada em `lead.activities[]`

| Campo | Tipo | Valores / Exemplo |
|---|---|---|
| `id` | string | `'a1'`, `'id_abc12def'` |
| `tipo` | enum | `'whatsapp'`, `'ligacao'`, `'diagnostico'`, `'proposta'`, `'followup'` |
| `data` | string | `'2026-06-09'` (YYYY-MM-DD) |
| `hora` | string | `'10:00'` (HH:mm) |
| `responsavel` | string | `'Nil'` |
| `feito` | boolean | `true`/`false` |
| `leadId` | string | ID do lead pai — **campo redundante no modelo relacional** |

---

## 6. Entidade `Note` — aninhada em `lead.notes[]`

| Campo | Tipo | Exemplo |
|---|---|---|
| `id` | string | `'n1'`, `'id_abc12def'` |
| `text` | string | `'Gostou da proposta. Pediu para pensar mais 2 dias.'` |
| `date` | string | `'2026-06-05 14:22'` (YYYY-MM-DD HH:mm) |
| `autor` | string | `'Nil'` |

---

## 7. Entidade `HistoryEvent` — aninhada em `lead.history[]`

| Campo | Tipo | Valores / Exemplo |
|---|---|---|
| `id` | string | `'h1'`, `'id_abc12def'` |
| `channel` | enum | `'wpp'`, `'phone'`, `'email'`, `'meet'`, `'system'` |
| `status` | enum | `'enviado'`, `'semresp'`, `'respondeu'`, `'noshow'`, `'remarcou'`, `'etapa'`, `'criado'`, `'perdido'` |
| `text` | string | Conteúdo da mensagem / nota do evento |
| `date` | string | `'2026-06-01 09:15'` (YYYY-MM-DD HH:mm) |
| `remarkDate` | string? | `'2026-06-09'` — só presente quando status=`noshow` ou `remarcou` |

---

## 8. Estado `filters` — aninhado em `state.filters`

```json
{
  "search": "",
  "seg": "",
  "score": "",
  "sla": "",
  "ticket": "",
  "city": ""
}
```

**Observação crítica:** Os filtros são persistidos junto com os leads. Isso significa que ao reabrir o CRM, os filtros ativos da sessão anterior são restaurados. No Supabase, isso provavelmente não deve ser migrado — é estado de UI, não dado de negócio.

---

## 9. Constantes hardcoded (NÃO persistidas)

Estes dados vivem no código e não no localStorage. São referências necessárias para a migração:

| Constante | Tipo | Descrição |
|---|---|---|
| `COLS` | array | 10 etapas do funil (E1-E10) com labels |
| `TICKET_LABELS` / `TICKET_AVG` | object | Tiers de preço N1/N2/N3 |
| `SEG_LABELS` / `SEG_CLASS` | object | Segmentos de leads |
| `CHANNEL_*` | objects | Labels/classes de canais de contato |
| `STATUS_LABELS` | object | Labels de status de histórico |
| `ACT_TIPOS` | object | Tipos de atividade |
| `SLA_DAYS` | object | SLA em dias por etapa |
| `TEMPLATES` | array | 16 scripts de prospecção/venda |
| `CHECKLIST_DIAG` | object | 10 itens do checklist de diagnóstico |
| `CHECKLIST_FOLLOWUP` | object | 5 itens do follow-up pós-proposta |
| `CHECKLIST_FECHAMENTO` | object | 7 itens do checklist de fechamento |

**Decisão necessária:** Templates e checklists ficam como constantes JS ou migram para tabelas (`templates`, `checklist_definitions`)?

---

## 10. Lógica derivada (não armazenada, calculada on-the-fly)

Funções que calculam estado a partir dos dados — precisarão de equivalente em SQL/RPC após migração:

| Função | Linha | Descrição |
|---|---|---|
| `getSlaStatus(lead)` | 2760 | Calcula status do SLA (ok/warn/over) baseado em `stageDate` e `SLA_DAYS` |
| `getScoreClass(score)` | 2771 | Classifica lead em A/B/C/Fora ICP |
| `getNoShowCount(lead)` | 2778 | Conta no-shows em `lead.history` |
| `isNoShowLost(lead)` | 2782 | 3 no-shows em E6 = perdido automático |
| `getLeadHealthAlerts(lead)` | 3456 | Gera alertas críticos/warning — 8 regras de negócio |
| `renderStats()` | 2808 | Calcula 7 métricas de funil em tempo real |
| `renderDashboard()` | 4494 | KPIs, MRR, conversão, top 5 por score |

---

## 11. Tamanho estimado de payload

| Cenário | Leads | Tamanho estimado |
|---|---|---|
| Demo atual | 12 leads | ~60 KB |
| Uso real leve | 50 leads | ~200 KB |
| Uso real médio | 150 leads | ~600 KB |
| Uso real intenso (1 ano) | 300 leads + histórico denso | ~1.5–2 MB |

**Limite localStorage:** 5MB por origem. Com 300 leads ricos, a aproximação do limite é real.

---

## 12. Anomalias e redundâncias identificadas

| Problema | Detalhe | Impacto |
|---|---|---|
| Campo `noShows` redundante | Armazenado no lead E derivado de `history.filter(h => h.status === 'noshow')` — dois fontes da verdade | Pode derivar em count incorreto se history for editado |
| `activities[].leadId` redundante | Já está implícito pela posição aninhada | No modelo relacional, isso é a FK — não é problema, mas precisa atenção na migração |
| IDs não são UUID | Formato `'l1'`, `'l2'` (demo) e `'id_abc12def'` (gerados) — incompatíveis com `gen_random_uuid()` do Postgres | Precisam de remapeamento na migração |
| `date` como string `'YYYY-MM-DD HH:mm'` | Formato não-padrão ISO 8601 completo | Precisa de parsing para `TIMESTAMPTZ` |
| `filters` persistidos | Estado de UI salvo junto com dados de negócio | Não deve ser migrado para Supabase — tratar como `sessionStorage` ou estado local |
| Checklists como objeto flat | `{ chk_d1: true }` — chave é o ID do item hardcoded | Requer tabela separada `lead_checklists` com (lead_id, item_id, done) |
| `stageDate` vs histórico | `stageDate` é o campo canônico, mas também existe no history como eventos `status='etapa'` | Redundância menor — na migração `stageDate` pode ser recalculado do history |
| Sem `updated_at` nos leads | Não há timestamp de última modificação | Supabase precisará adicionar esse campo |
| Sem `user_id` / multi-user | Dados são de uso individual, sem conceito de usuário | Auth precisará ser introduzido como pré-requisito |
