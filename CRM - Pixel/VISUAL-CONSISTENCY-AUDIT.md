# Visual Consistency Audit — CRM Pixel Rain

## 1. Emojis encontrados e localização

### Objeto global `ACT_TIPOS` (L2061–2065)
| Chave | Label | Emoji | Substituição |
|---|---|---|---|
| whatsapp | Enviar WhatsApp | 💬 | MessageSquare SVG |
| ligacao | Fazer Ligação | 📞 | Phone SVG |
| diagnostico | Confirmar Diagnóstico | 🩺 | Activity SVG |
| proposta | Enviar Proposta | 📄 | FileText SVG |
| followup | Follow-up | 🔁 | RefreshCw SVG |

### ACT_MAP local em `renderAgenda` (L3871)
Mesmos emojis de ACT_TIPOS, mais fallback `'📌'` (L3890).
Emoji extra: `'🎯'` no evento nexttouch (L3897).

### ACT_MAP local em `renderInbox` (L3942)
Mesmos emojis de ACT_TIPOS, mais fallback `'📌'` (L3945).

### Array `kpis` em `renderDashboard` (L4147–4154)
| Campo | Emoji |
|---|---|
| Leads Ativos | 👥 |
| Fechados | ✅ |
| Perdidos | ❌ |
| Taxa de Conversão | 📊 |
| MRR Potencial | 💰 |
| MRR Fechado | 💎 |
| Score Médio | 🎯 |
| Alertas Críticos | ⚠️ |

### Painéis do Dashboard — títulos JS (L4163, L4196)
- `'⚠️ Leads com Alertas Críticos (' + count + ')'`
- `'🏆 Top 5 Leads por Score'`

### Seções de `renderExecucao` (L3740–3742)
- `'🔴 Atividades Atrasadas'`
- `'🟡 Atividades de Hoje'`
- `'⚪ Próximas Atividades (7 dias)'`

### Seções de `renderInbox` (L3975–3978)
- `'🔴 Atrasadas'`
- `'🟡 Hoje'`
- `'📆 Esta semana'`
- `'🔮 Mais tarde'`

### Quadrantes de `renderComunicacao` (L4115–4118)
- `'📩 Aguardando Resposta'`
- `'📄 Proposta sem Retorno'`
- `'🚫 No-Show Pendente'`
- `'🔁 Reativar (90 dias)'`

### Timeline `renderTimelineUnificada` (L4032–4039)
- `icon` de `CHANNEL_ICON` (emoji no tl-icon div)
- `'⚠️'` para noshow

### Títulos HTML estáticos (views)
| View | HTML atual | Problema |
|---|---|---|
| Execução | `📋 Execução Diária` | Emoji + classe `.exec-title` diferente do padrão |
| Agenda | `📅 Agenda Comercial` | Emoji |
| Inbox | `📥 Inbox de Tarefas` | Emoji |
| Timeline | `🕐 Timeline Unificada` | Emoji |
| Comunicação | `💬 Central de Comunicação` | Emoji |
| Dashboard | `📈 Dashboard Executivo` | Emoji |

---

## 2. Inconsistências CSS por view

### Agenda
- `.agenda-col` tem `gap:8px` entre colunas → muito espaçado (Pipeline usa 1px separators)
- `.agenda-event-icon` renderiza emoji como font-size:12px, não SVG
- `.agenda-col-header` usa `display:flex; justify-content:space-between` com dois spans separados; no padrão novo usa `.agenda-col-day` + `.agenda-col-date` em coluna

### Inbox
- `.inbox-card` tem `padding:10px 14px` e `margin-bottom:6px` — blocos flutuantes em vez de lista compacta
- `.inbox-card-icon` é `font-size:20px; width:32px; text-align:center` — renderiza emoji, não SVG
- `.inbox-section-title` tem color-classes (`.inbox-sec-red`, etc.) com emojis inline

### Execução
- `.exec-card-icon` não está definido no CSS existente como flex-container SVG-ready
- Seção usa `.exec-badge-atrasado` — OK, mas falta definição no CSS original

### Timeline
- `.tl-icon` usa emoji; estrutura `.tl-top`/`.tl-content`/`.tl-channel` tem cores hardcoded (channel badges coloridos)
- `.timeline::before` — linha vertical absoluta (estilo pesado, não Linear)

### Dashboard
- `.dash-kpi` usa `.dash-kpi-icon` como container de emoji — não está definido formalmente
- Grid inline `style="display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:12px"` em vez de classe

### Comunicação
- `.com-quadrant-header` com `border-left-color` hardcoded (stripe colorida)
- `.com-quadrant-title`/`.com-quadrant-subtitle` como divs separadas, sem classe unificada

---

## 3. Tabela comparativa Pipeline vs. outras views

| Critério | Pipeline (referência) | Outras views |
|---|---|---|
| Ícones | Lucide SVG 15×15 | Emojis |
| Densidade | Cards 1px border-gap, sem margin-bottom | Cards com gap 6–12px, margin-bottom |
| Títulos | `view-title` limpo sem emoji | h2 com emojis prefix |
| Subtítulos | `view-subtitle` discreto em --text3 | Ausentes na maioria |
| Section headers | `font-size:12px; font-weight:600; text-transform:uppercase` | Mistura de cores, emojis, sizes |
| Hover | `background:var(--bg3); border-color:var(--border)` | Algumas views OK, outras ausentes |
| Badges/counts | `bg4 + border + border-radius:10px` | Inline styles ou classes inconsistentes |

---

## 4. Problemas de densidade

| View | Problema |
|---|---|
| Agenda | Colunas com `gap:8px` e `min-height:180px` — muito espaçada para semanas vazias |
| Inbox | `margin-bottom:6px` por card + padding generoso — parecido com cards de produto, não lista |
| Execução | `.exec-card` sem definição formal de padding compacto |
| Dashboard | KPIs em grid com `gap:12px` — OK, mas falta borda de separação 1px (Stripe-style) |
| Comunicação | Quadrantes com `border-left` colorida — pesada visualmente |
| Timeline | Linha vertical `::before` muito presente |

---

## 5. Plano de correção

### Fase A — CSS (antes de `</style>`)
Adicionar bloco `VISUAL CONSISTENCY` com:
- `.inbox-card-icon` e `.exec-card-icon` como flex SVG containers
- `.view-header`, `.view-title`, `.view-subtitle` unificados
- Agenda: grid compacto (gap:1px, sem min-height rígida)
- Inbox: cards compactos (padding:8px, sem margin-bottom)
- Timeline: itens compactos sem linha vertical absoluta
- Dashboard: `.dash-kpis` com grid 1px separator
- Comunicação: `.com-quadrant` sem border-left colorida

### Fase B — JS: substituir emojis por SVG
1. `ACT_TIPOS` global (L2061–2065)
2. `ACT_MAP` em renderAgenda (L3871) + fallback L3890 + nexttouch L3897
3. `ACT_MAP` em renderInbox (L3942) + fallback L3945
4. `kpis` array (L4147–4154): icons por SVG
5. Painéis Dashboard: remover emojis dos títulos (L4163, L4196)
6. Seções renderExecucao: remover emojis dos títulos (L3740–3742)
7. Seções renderInbox: remover emojis dos títulos (L3975–3978)
8. Quadrantes renderComunicacao: remover emojis dos títulos (L4115–4118)

### Fase C — HTML estático: atualizar títulos das views
Substituir h2 com emoji pelo padrão `div.view-header > h1.view-title + p.view-subtitle` em:
- viewExecucao (exec-header diferente — adaptar)
- viewAgenda
- viewInbox
- viewTimeline
- viewComunicacao
- viewDashboard
