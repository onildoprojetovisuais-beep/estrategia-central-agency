# Design Refinement — CRM Pixel Rain
**Data:** 2026-06-08  
**Baseline:** Auditoria DESIGN-SYSTEM-AUDIT.md  
**Referências:** Attio, Linear, Notion, Stripe Dashboard

---

## O Princípio

> "A hierarquia visual deve refletir a frequência e importância das ações. O usuário de CRM lê 50 cards por dia — lê um único número de KPI uma vez. Mas aquele número resume o dia inteiro."

---

## Decisões de Design

### 1. Sidebar — Agrupamento Semântico

**Antes:** 7 itens em lista plana — usuário deve memorizar contexto  
**Depois:** 3 grupos nomeados com labels uppercase 10px

```
VENDAS          → Pipeline, Agenda, Inbox
ANÁLISE         → Timeline, Dashboard
OPERAÇÃO        → Comunicação, Execução
```

**Referência Linear:** A sidebar do Linear usa labels de grupo ("My Issues", "Teams", "Projects") em 10–11px uppercase. Isso cria orientação espacial sem adicionar elementos decorativos.

**Por quê funciona:** O cérebro humano usa agrupamento perceptivo (Gestalt) — items próximos com label comum são percebidos como sistema único, não lista. Reduz carga cognitiva.

---

### 2. KPI Strip — Números com Presença

**Antes:** `font-size: 16px` — menor que alguns títulos de modal  
**Depois:** `font-size: clamp(22px, 2.2vw, 28px)` + `letter-spacing: -0.5px`

**Referência Stripe Dashboard:** Os números financeiros no Stripe usam ~32px com tracking negativo. São a primeira coisa que o olho encontra — isso é intencional.

**Por quê funciona:** O usuário acessa o CRM para responder "como estão as coisas?" — essa resposta está nos KPIs. Se os números forem menores que o texto dos cards, o usuário tem que PROCURAR a informação que deveria SALTAR na tela.

---

### 3. Botão "Novo Lead" — Redução de Destaque

**Antes:** Background `#56D4D8` (full accent) + texto preto — o elemento visualmente mais dominante da sidebar  
**Depois:** Background `var(--bg4)` + borda sutil `var(--border2)` + texto normal

**Referência Attio:** O botão "+ New Record" do Attio é outlined, não filled. O Linear usa um ícone + texto muted. Cadastrar um registro novo é ação ocasional — não deve competir com a leitura do pipeline.

**Por quê funciona:** O botão Novo Lead era usado como affordance — "isso é clicável". Mas em um CRM operacional, a maioria das sessões não inclui cadastro. O destaque constante é ruído visual.

---

### 4. Colunas — Largura Generosa

**Antes:** `clamp(240px, 22vw, 290px)` — colunas apertadas, cards densos  
**Depois:** `clamp(280px, 24vw, 320px)` — +40px mínimo, +30px máximo

**Referência Attio:** As colunas do Attio Kanban são ~300–340px dependendo da tela. O breathing room interno dos cards é um sinal de qualidade percebida.

**Por quê funciona:** Espaço não é desperdício — é hierarquia. Um card com padding generoso parece mais importante que o mesmo card comprimido. A informação tem mais clareza para ser lida rapidamente.

---

### 5. Cards — Hierarquia Explícita

**Antes:** Nome em 13px, tags em 11px — diferença mínima percebida  
**Depois:** Nome em 14px + weight 600, tags em 12px + muted

```
Nome do Lead (14px, 600, --text)           ← O QUE importa
São Paulo · R$8k/mês (12px, 400, --text3)  ← Contexto rápido
Score 82 (11px, 700, accent)               ← Qualificação
▪ 4d · Enviar proposta (11px, --text3)     ← Próxima ação
```

**Referência Attio:** Cards do Attio têm hierarquia clara de 3–4 níveis. Nunca mais de 2px de diferença entre níveis adjacentes — mas somam para uma hierarquia percebida clara.

---

### 6. Escala de Espaçamento — Grade 4px

**Antes:** Valores arbitrários: 9px, 11px, 13px, 10px  
**Depois:** Tokens CSS: `--ds-1: 4px` até `--ds-16: 64px`

Todos os paddings, gaps e margins agora usam múltiplos de 4px.

**Por quê funciona:** Espaçamento consistente cria ritmo visual. O olho percebe inconsistência mesmo quando o cérebro não identifica a causa — e interpreta como "descuido" vs "polish".

---

## Comparação Visual

### Pipeline View

```
ANTES                              DEPOIS
┌────────────────────────┐         ┌──────────────────────────────┐
│Pipeline  Agenda  Inbox │         │ VENDAS                       │
│Timeline  Dashboard     │         │   ▣ Pipeline                 │
│Comunicação  Execução   │         │   📅 Agenda                  │
│                        │         │   📥 Inbox                   │
│ [NOVO LEAD ██████████] │         │ ANÁLISE                      │
└────────────────────────┘         │   ⏱ Timeline                 │
                                   │   📊 Dashboard               │
KPIs:  23  |  4  |  R$120k        │ OPERAÇÃO                     │
      (16px small)                 │   💬 Comunicação             │
                                   │   ⚡ Execução                │
                                   │                              │
                                   │ [ + Novo Lead          ]     │
                                   └──────────────────────────────┘

                                   KPIs:  23    4    R$120k
                                         (28px prominent)
```

### Card Visual

```
ANTES                              DEPOIS
┌─────────────────────┐            ┌──────────────────────────────┐
│ Dr. Fernanda  [82]  │            │ Dr. Fernanda Silva      [82] │
│ SP · R$8k           │            │ São Paulo · R$8.000/mês      │
│ ▪ 4d · Proposta     │            │                              │
│ [WhatsApp][Histó]   │            │ ▪ 4d  Enviar proposta        │
└─────────────────────┘            │ [WA] [📋]                    │
                                   └──────────────────────────────┘
```

---

## Tokens Aplicados

```css
/* Spacing */
--ds-1: 4px   --ds-2: 8px   --ds-3: 12px  --ds-4: 16px
--ds-6: 24px  --ds-8: 32px  --ds-12: 48px --ds-16: 64px

/* Typography */
--type-2xs: 10px   --type-xs: 11px    --type-sm: 12px
--type-base: 13px  --type-md: 14px    --type-lg: 16px
--type-xl: 20px    --type-2xl: 24px   --type-kpi: clamp(22px, 2.2vw, 28px)

/* Layout */
--col-w: clamp(280px, 24vw, 320px)   ← was clamp(240px, 22vw, 290px)
```

---

## O Que NÃO Foi Alterado

- Nenhuma função JavaScript
- Nenhuma estrutura de dados de leads
- Nenhuma view ou tela nova
- Nenhuma lógica de negócio
- Toda responsividade existente (8 media queries)

Todas as mudanças são exclusivamente CSS (tokens + overrides) e HTML estrutural (labels de grupo no sidebar).
