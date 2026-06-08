# Design System Audit — CRM Pixel Rain
**Data:** 2026-06-08  
**Arquivo:** crm-pixel-rain.html (~4274 linhas)  
**Objetivo:** Identificar inconsistências antes do refinamento

---

## 1. Escala de Espaçamento

### Valores encontrados no CSS (não padronizados)
| Propriedade | Valores usados | Problema |
|-------------|----------------|---------|
| padding cards | `11px 13px` | Fora da grade 4px (11 não é múltiplo de 4) |
| padding sidebar items | `9px 11px` | Idem — 9 e 11 não são múltiplos de 4 |
| sidebar nav gap | `1px` | Valor arbitrário |
| col-body padding | `8px` | OK (múltiplo de 4) |
| stat-card padding | `13px 20px` | 13 não é múltiplo de 4 |
| sb-nav padding | `10px 8px 4px` | 10 não é múltiplo de 4 |

### Escala ideal (grade 4px)
`4 · 8 · 12 · 16 · 24 · 32 · 48 · 64`

---

## 2. Escala Tipográfica

### Valores encontrados
| Elemento | Tamanho atual | Esperado |
|----------|---------------|---------|
| .sb-brand-sub | 10px | 10px ✓ |
| .sb-brand-name | 12px | 11px (muito próximo de sb items) |
| .sb-action | 11px | 11px ✓ |
| .sb-item | 12px | 12px ✓ |
| .col-code | 9px | 10px (9px é ilegível) |
| .col-count | 10px | 10px ✓ |
| .col-title | 11px | 11px ✓ |
| .card-name | 13px | 14px (merece mais destaque) |
| .card-tag | 11px | 12px |
| .card-days | 10px | 11px |
| .score-badge | 10px | 11px |
| .stat-label | 10px | 10px ✓ |
| .stat-value | 16px | clamp(22px, 2.2vw, 28px) — KPIs merecem mais presença |

### Hierarquia proposta
```
10px — micro (badges, timestamps)
11px — secondary (labels, meta, sidebar actions)
12px — tertiary (sidebar items, col-title, tags)
13px — body (card content)
14px — primary (card name, filtros)
16px — section header
20px — modal title
24px — view title
28–32px — KPI values
```

---

## 3. Hierarquia Visual

### Problemas identificados

**Sidebar — sem agrupamento semântico**
As 7 views estão listadas flat sem contexto:
- Pipeline, Agenda, Inbox → ferramentas de VENDAS
- Timeline, Dashboard → ferramentas de ANÁLISE
- Comunicação, Execução → ferramentas de OPERAÇÃO

Sem labels de grupo, o usuário precisa memorizar para que serve cada view.

**Botão "Novo Lead" — excesso de destaque**
Background `#56D4D8` (accent) + texto preto — é o elemento mais visível da tela inteira, incluindo mais que os KPIs e o nome do lead em foco. Um CRM é usado constantemente; cadastrar lead novo é ação ocasional.

**KPI Strip — números pequenos**
`stat-value` em 16px perde para o card name (13px) em hierarquia visual percebida. Os números chave do negócio deveriam dominar.

**Colunas — largura conservadora**
`clamp(240px, 22vw, 290px)` = muito estreito para o conteúdo real. Card name + badge + score ficam apertados. Attio usa colunas largas com muito breathing room interno.

**Cards — score escondido**
`.card-score-row { display: none }` e `.score-badge` em 10px font-size sem separação visual suficiente. O score 0–100 é o diferencial metodológico da Pixel Rain — precisa de presença.

---

## 4. Alinhamento e Ritmo

### Problemas
- `card-bottom` margin-top: 6px — inconsistente com outros gaps
- `card-top` margin-bottom: 5px — 5 não está na grade
- `card-meta` gap: 0 — tags sem espaçamento
- `card-actions` gap: 4px e margin-top: 6px — mix de 4 e 6
- `sb-new-lead` margin-bottom: 6px — 6 não está na grade
- `sb-badge` min-width: 16px — arbitrário

---

## 5. Densidade

### Estado atual
Cards têm densidade ALTA em colunas ESTREITAS — pior dos dois mundos. O ideal é:
- Colunas mais largas → mais breathing room horizontal
- Cards com padding generoso → mais breathing room vertical
- Hierarquia clara → menos esforço cognitivo por card

---

## 6. Resumo dos Problemas por Severidade

| Severidade | Problema | Impacto |
|------------|---------|---------|
| 🔴 Alto | Sidebar sem agrupamento semântico | Orientação espacial |
| 🔴 Alto | KPI values muito pequenos (16px) | Leitura rápida prejudicada |
| 🔴 Alto | "Novo Lead" domina hierarquia visual | Distração constante |
| 🟡 Médio | Espaçamento fora da grade 4px | Inconsistência visual |
| 🟡 Médio | Colunas estreitas | Densidade excessiva |
| 🟡 Médio | Score não tem presença visual | Diferencial metodológico oculto |
| 🟢 Baixo | Tipografia com gaps (9px vs 10px) | Legibilidade |
| 🟢 Baixo | Col-code em 9px | Micro-ilegibilidade |
