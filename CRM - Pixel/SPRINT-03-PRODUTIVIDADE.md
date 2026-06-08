# Sprint 03 — Produtividade Comercial
## CRM Pixel Rain Agency

### Objetivo
Transformar o CRM em uma central de execução do processo comercial baseada no Playbook, reduzindo o tempo de decisão em cada etapa e eliminando esquecimentos.

---

### 1. Biblioteca de Scripts

**Fonte:** Cadência de 5 toques definida no processo de prospecção + novos roteiros criados para cada etapa crítica do funil.

**Scripts existentes mantidos:**
- Toque 1-A a 1-D (E2): 4 variações por gancho (parou de postar, conteúdo sem alcance, Google sem resposta, concorrente novo)
- Toque 2-5 (E3): cadência de 5 toques completa até email de encerramento
- Pós-proposta Dia 1, 3, 7 (E8)

**Novos scripts adicionados (6):**
| ID | Nome | Canal | Etapa |
|---|---|---|---|
| triagem | Triagem — Abertura 15min | Ligação | E4 |
| conf_diag | Confirmação de Diagnóstico | WhatsApp | E5 |
| conf_24h | Confirmação 24h Antes | WhatsApp | E6 |
| envio_prop | Envio da Proposta | WhatsApp | E7 |
| negociacao | Negociação — Desbloqueio | Ligação | E9 |
| reativacao | Reativação — 90 dias | WhatsApp | E10 |

**Mapeamento por etapa (STAGE_SCRIPTS):**
- E1: nenhum (ainda em research)
- E2: t1a, t1b, t1c, t1d
- E3: t2, t3, t4, t5
- E4: triagem
- E5: conf_diag
- E6: conf_24h
- E7: envio_prop
- E8: pp1, pp3, pp7
- E9: negociacao
- E10: reativacao

**Como usar:** A aba "📝 Scripts" exibe primeiro os scripts relevantes para a etapa atual do lead. Em seguida, lista todos os scripts disponíveis. Cada script tem dois botões: "📋 Copiar" (copia o texto processado com [Nome] e [Cidade] substituídos para a área de transferência) e "Usar" (insere no campo de mensagem da aba Registrar).

---

### 2. Botão Copiar

**Implementação:** Função `copyScript(templateId, leadId)` que:
1. Busca o lead pelo ID para substituir placeholders
2. Aplica `applyLeadTemplates()` para substituir [Nome] e [Cidade]
3. Usa `navigator.clipboard.writeText()` com fallback para `document.execCommand('copy')` em browsers mais antigos
4. Exibe toast de confirmação

---

### 3. Checklist do Diagnóstico

**Fonte:** Processo de Diagnóstico Comercial (45-60 min) — 10 perguntas reveladoras do Playbook.

**Quando aparece:** Etapas E5, E6, E7.

**Itens:**
1. Qual a relação atual entre convênio e particular? (%)
2. Como pacientes novos te encontram hoje?
3. Já tentou marketing antes? Como foi?
4. Se pudesse mudar uma coisa no consultório agora, qual seria?
5. Qual sua meta de faturamento particular nos próximos 6 meses?
6. Sua secretária sabe converter ligação em consulta agendada?
7. Quanto tempo por semana você consegue dedicar ao processo?
8. Como você vê a relação entre marketing e sua reputação médica?
9. Qual sua expectativa de resultado nos primeiros 90 dias?
10. Quem mais precisa concordar para você fechar?

**IDs de persistência:** chk_d1 a chk_d10 (campo `lead.checklists`)

---

### 4. Checklist de Follow-up

**Fonte:** Processo de Follow-up Pós-Proposta (14 dias).

**Quando aparece:** Etapas E8, E9.

**Itens:**
1. Dia 1 — Confirmação de recebimento da proposta (chk_f1)
2. Dia 3 — Ângulo adicional (novo dado ou oportunidade) (chk_f2)
3. Dia 7 — Ligação para desbloquear objeção principal (chk_f3)
4. Dia 10 — "Precisamos resolver o que está em aberto" (chk_f4)
5. Dia 14+ — Urgência real + decisão final (chk_f5)

---

### 5. Checklist de Fechamento

**Fonte:** Processo de Fechamento — condições inegociáveis e etapas operacionais.

**Quando aparece:** Apenas E9.

**Itens:**
1. Objeção principal identificada e trabalhada (chk_c1)
2. Reunião de negociação realizada (chk_c2)
3. Contrato de 12 meses confirmado (inegociável) (chk_c3)
4. Ajuste de escopo validado com fundador (se Cliente C) (chk_c4)
5. Contrato enviado para assinatura (chk_c5)
6. Primeira mensalidade confirmada (chk_c6)
7. Data de onboarding definida (máx 5 dias após assinatura) (chk_c7)

**Persistência:** Os estados são salvos no campo `lead.checklists` (objeto com IDs como chaves e boolean como valores). Retrocompatível — leads sem o campo usam `{}`.

---

### 6. Sugestão de Próxima Ação

**Aparece em:** Drawer lateral (painel esquerdo), na primeira seção, logo ao abrir o card do lead.

**Mapeamento E1 → E10:**

| Etapa | Emoji | Ação Sugerida | Botão |
|---|---|---|---|
| E1 | 🔍 | Fazer Research Completo | Avançar para Pesquisado |
| E2 | 💬 | Enviar Toque 1 no WhatsApp | Abrir Scripts |
| E3 | ⏰ | Acompanhar Cadência de 5 Toques | Ver Scripts |
| E4 | 📋 | Realizar Triagem de 15 Minutos | Ver Script Triagem |
| E5 | 📅 | Agendar Diagnóstico (45-60 min) | Ver Checklist |
| E6 | 🩺 | Confirmar e Realizar Diagnóstico | Ver Checklist |
| E7 | 📄 | Elaborar e Enviar Proposta (48h) | Script de Envio |
| E8 | 🔄 | Iniciar Follow-up Pós-Proposta | Ver Checklist Follow-up |
| E9 | 🤝 | Conduzir Negociação e Fechamento | Ver Checklist Fechamento |
| E10 | 🔁/🎉 | Reativar em 90 dias / Iniciar Onboarding | Script Reativação / Registrar |

**Botão de ação:** Abre o modal de histórico do lead diretamente na aba relevante (Scripts ou Checklists) via `openHistoryAndTab()`.

---

### 7. Painel de Saúde

**Aparece em:** Drawer lateral, segunda seção (abaixo de Próxima Ação).

**Alertas implementados (8 condições):**

| # | Condição | Nível | Ícone |
|---|---|---|---|
| 1 | Sem contato há 7+ dias | critical | ⚠️ |
| 2 | Último contato há 4-6 dias | warning | 🕐 |
| 3 | Nenhum contato registrado (E3+) | warning | 📭 |
| 4 | Atividade(s) atrasada(s) | critical | 🔴 |
| 5 | Diagnóstico em E6 não confirmado (2+ dias) | warning | 🩺 |
| 6 | Proposta em E8 sem retorno há 3+ dias | critical | 📄 |
| 7 | Score abaixo de 40 (E2-E9) | warning | 🎯 |
| 8 | 1 no-show | warning | ⚠️ |
| 9 | 2+ no-shows | critical | 🚫 |
| 10 | SLA da etapa vencido | critical | ⏰ |
| 11 | 5 toques sem resposta em E3 | critical | 📵 |

**Visual:** Badges coloridos — verde (saudável), amarelo (warning), vermelho (critical).

---

### Como usar diariamente (guia rápido para o Nil)

**Rotina de manhã (10 min):**
1. Abra o CRM e acesse "📋 Execução Diária" para ver atividades atrasadas e de hoje
2. Para cada lead com atividade pendente, clique no card para abrir o drawer
3. Leia a sugestão de "💡 Próxima Ação" e verifique os alertas de "🔍 Saúde"
4. Execute a ação: copie o script relevante e envie pelo canal indicado

**Ao realizar um contato:**
1. Abra o histórico do lead (botão "📋 Ver Histórico Completo" no drawer)
2. Vá na aba "✏️ Registrar" e registre o contato com canal, status e texto
3. Se avançou de etapa, selecione a nova etapa e clique "Avançar"

**Antes de um diagnóstico:**
1. Abra a aba "✅ Checklists" do lead
2. Use as 10 perguntas do Checklist de Diagnóstico como roteiro
3. Marque cada pergunta respondida durante a conversa

**Ao enviar proposta:**
1. Copie o script "Envio da Proposta" da aba "📝 Scripts" (com [Nome] e [Cidade] já preenchidos)
2. Avance o lead para E8 após envio
3. Acompanhe o Checklist de Follow-up nos 14 dias seguintes
