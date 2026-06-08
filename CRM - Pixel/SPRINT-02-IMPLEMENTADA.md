# Sprint 02 — CRM Pixel Rain Agency
## Data: 2026-06-08
## Objetivo: Transformar o CRM em ferramenta operacional

---

### P1 — Drawer Lateral do Lead
- Adicionado drawer lateral de 480px que desliza da direita ao clicar em qualquer card (exceto no botão "Ver histórico ›")
- Overlay escuro por trás com clique para fechar; tecla Escape também fecha
- Transição CSS `cubic-bezier` suave de slide-in/out
- Seção **Dados do Lead**: Empresa, Nome, Cargo, Cidade, Instagram (link), WhatsApp, Email (link), Site (link)
- Seção **Qualificação**: Segmento, ICP Score com badge colorido, Potencial (ticket), Etapa atual, Observações
- Seção **Últimos Eventos**: minitimelime com os últimos 3 eventos do histórico (compacta, sem scroll)
- Rodapé com botão "Editar" (abre modal de edição) e "Ver Histórico Completo" (abre modal de histórico)

---

### P2 — Timeline Automática
- Ao criar um lead: evento `{ channel:'system', status:'criado', text:'Lead criado' }` adicionado automaticamente
- Ao avançar etapa via `advanceStage()`: evento `{ channel:'system', status:'etapa', text:'Avançado para EX — Label' }`
- Ao marcar como Perdido via `moveLead('perdido')`: evento `{ channel:'system', status:'perdido', text:'Marcado como Perdido: motivo' }`
- Na timeline, eventos do sistema renderizam com ícone `🔄` (etapa), `✅` (criado), `❌` (perdido)
- CSS `.tl-icon.system` com estilo roxo/accent; `.tl-content.status-criado/etapa/perdido` com cores respectivas
- Mini-timeline no drawer exibe corretamente eventos do sistema

---

### P3 — Módulo de Atividades
- Novo campo `activities: []` adicionado ao schema do lead
- Tipos disponíveis: `whatsapp` (💬), `ligacao` (📞), `diagnostico` (🩺), `proposta` (📄), `followup` (🔁)
- Nova aba **📅 Atividades** no modal de histórico (última aba)
- Lista de atividades ordenada por data com: ícone, tipo label, data/hora, responsável, checkbox feito, botão remover
- Atividades concluídas ficam com opacidade reduzida e texto riscado
- Formulário inline: tipo (select), data (date), hora (time, default 09:00), responsável (text, default "Nil")
- Ao abrir a aba Atividades, a data do formulário é preenchida com hoje automaticamente
- Funções: `saveAtividade()`, `toggleAtividade()`, `deleteAtividade()`

---

### P4 — Execução Diária
- Novo botão **📋 Execução Diária** na topnav (ao lado de Exportar)
- Oculta kanban, stats e filtros e exibe a view `#viewExecucao`; botão muda para "← Voltar ao Kanban"
- 3 seções verticais:
  - **🔴 Atividades Atrasadas** — `feito: false` e `data < hoje`, badge vermelho "ATRASADO"
  - **🟡 Atividades de Hoje** — `feito: false` e `data === hoje`, ordenadas por hora
  - **⚪ Próximas Atividades (7 dias)** — `feito: false`, `data > hoje` e `<= hoje+7`, agrupadas por data
- Cada card exibe: ícone do tipo, label, nome do lead (clicável → abre drawer), cidade, data/hora, responsável
- Botão **✓ Feita** marca `feito: true`, salva estado e re-renderiza a view
- Botão **Abrir** abre o drawer do lead (voltando ao kanban se necessário)
- Estado vazio elegante quando não há atividades em cada seção

---

### P5 — Ações Rápidas no Card
- Linha de botões `<div class="card-actions">` adicionada ao final de cada card
- Visível apenas no hover via CSS `opacity: 0` → `opacity: 1` na transição
- Botões: 💬 WhatsApp (abre `wa.me/55{numero}`), 📸 Instagram (abre `instagram.com/{handle}`), 📧 Email (`mailto:`)
- `event.stopPropagation()` em todos os botões para não disparar abertura do drawer
- Funções: `openWhatsApp(leadId)`, `openInstagram(leadId)`, `openEmail(leadId)`
- CSS: `.card-action-btn` com hover scale e transition

---

### P6 — Sistema de Notas
- Novo campo `notes: []` adicionado ao schema do lead
- Nova aba **📌 Notas** no modal de histórico (entre Dados e Templates)
- Formulário no topo: textarea para o texto, campo autor (default "Nil"), botão "Adicionar Nota"
- Lista de notas em ordem cronológica reversa com: texto, data formatada, autor
- Botão ✕ no canto de cada nota para deletar (sem confirmação)
- Funções: `saveNota()`, `deleteNota(notaId)`

---

### Campos adicionados ao Lead
- `empresa` — nome do consultório/clínica
- `cargo` — cargo/especialização (ex: "Pediatra Solo", "Sócia-diretora")
- `site` — URL do site (opcional)
- `activities` — array de atividades (`{ id, tipo, data, hora, responsavel, feito, leadId }`)
- `notes` — array de notas (`{ id, text, date, autor }`)

**Compatibilidade:** Leads antigos no localStorage sem os novos campos funcionam normalmente via `lead.activities || []` e `lead.notes || []`.

---

### Como usar (guia rápido para o Nil)

**Drawer do Lead:**
- Clique em qualquer card no kanban para abrir o drawer lateral com todos os dados
- O botão "Ver histórico ›" no card continua abrindo o modal completo

**Atividades:**
- No modal de histórico, vá na aba "📅 Atividades" para criar lembretes de ação
- Ex: "Fazer Ligação" em 15/06 às 10:00 — responsável: Nil

**Execução Diária:**
- Clique em "📋 Execução Diária" na barra superior
- Veja todas as atividades do dia agrupadas por prioridade
- Marque como feitas direto desta tela

**Notas:**
- Na aba "📌 Notas" do modal de histórico, registre qualquer observação rápida
- Ex: "Gostou da proposta", "Vai decidir em julho"

**Ações rápidas:**
- Passe o mouse sobre um card para ver os botões 💬 📸 📧 aparecerem
- Clique para abrir WhatsApp, Instagram ou enviar email direto

**Timeline automática:**
- Criação de lead, avanço de etapa e marcação como Perdido são registrados automaticamente no histórico
