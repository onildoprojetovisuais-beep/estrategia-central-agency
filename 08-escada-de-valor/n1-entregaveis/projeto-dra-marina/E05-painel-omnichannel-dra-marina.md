# E05 — Implementação do Painel Omnichannel — Dra. Marina Albuquerque
**N1 — Fase de Atração | Pixel Rain Agency**
**Cliente:** Instituto Infantil Aurora | Campinas/SP
**Classificação:** Processo Aplicado — Cliente Ativo

---

## Contexto do cliente neste entregável

O atendimento digital do Instituto Infantil Aurora está hoje concentrado no número pessoal da Dra. Marina. Não existe automação, não existe padrão documentado de respostas, não há separação entre o pessoal e o profissional, e a Marina responde mensagens de pacientes à noite misturadas com mensagens da vida particular — o que gera inconsistência, risco de perda de leads e ausência de histórico rastreável.

A migração para WhatsApp Business já deve ter sido feita no E02 (Dia 2 do projeto). O E05 parte do pressuposto de que o número da Dra. Marina já está em conta WhatsApp Business.

A Claudinha (Camila Rodrigues Tavares, 31 anos, na clínica desde 2019) é a operadora principal do painel. Ela é leal, experiente com a clínica e competente no atendimento presencial. O problema não é a Claudinha — é a falta de ferramenta e processo. Ela nunca usou uma plataforma de atendimento digital centralizado. O treinamento precisa ser gentil, prático e focado em mostrar como a ferramenta facilita o trabalho dela.

**Plataforma escolhida:** Chatguru (recomendação padrão da Pixel Rain Agency).

---

## Configuração do workspace no Chatguru

### Dados do workspace

| Campo | Valor |
|---|---|
| Nome do workspace | Instituto Infantil Aurora |
| Fuso horário | America/Sao_Paulo |
| Idioma | Português brasileiro |
| Horário de funcionamento | Segunda a sexta, 8h às 18h |

### Canais conectados

**WhatsApp Business:**
- Número: WhatsApp Business da Dra. Marina (pós-migração do pessoal)
- Tipo de conexão: WhatsApp Business API via Chatguru
- Verificar status do número antes de conectar: conta Business ativa com perfil profissional configurado

**Instagram Direct:**
- Perfil: @institutoinfantilaurora
- Conexão via Meta Business Suite
- Pré-requisito: conta no Meta Business Manager vinculada ao perfil Instagram (E02)

### Agentes cadastrados

| Agente | Perfil | Nível de acesso |
|---|---|---|
| Claudinha (Camila Rodrigues Tavares) | Agente principal | Acesso total — pode visualizar e responder todas as conversas |
| CS Pixel Rain | Monitoramento | Visualização — não responde como clínica |
| Dra. Marina | Visualizadora | Visualização — acompanha sem precisar intervir pelo pessoal |

**Nota sobre a Dra. Marina:** adicionar a Marina como visualizadora resolve o hábito dela de responder pelo pessoal à noite. Ela pode ver o andamento das conversas sem precisar usar o número pessoal. Apresentar isso como solução, não como restrição.

---

## As 5 respostas rápidas específicas do Instituto Infantil Aurora

Cadastrar no painel com os textos abaixo. Esses textos foram desenvolvidos para o perfil do Instituto: tom acolhedor, linguagem das mães de Campinas, posicionamento do particular como disponibilidade principal (sem dizer que não atende convênio).

**Antes de publicar:** enviar os 5 textos para a Claudinha revisar e ajustar expressões que ela considera inadequadas para o atendimento que ela já conhece. O objetivo é que ela se reconheça no texto.

---

**Resposta Rápida 1 — Agendamento de primeira consulta**

Atalho: `/agendar`

*"Olá! Que bom que você entrou em contato com o Instituto Infantil Aurora. Para agendar a primeira consulta, me informe:*
- *Nome da criança*
- *Data de nascimento*
- *Qual o melhor horário para você*

*Vejo na agenda e te confirmo em breve! 💙"*

---

**Resposta Rápida 2 — Informações sobre convênios aceitos**

Atalho: `/convenio`

*"A Dra. Marina atende principalmente por consulta particular, com disponibilidade de terça a sexta. Para consultas de convênio, temos vagas mais limitadas às segundas e quartas.*

*Posso verificar a disponibilidade para você! Qual é o convênio e qual é a preferência de horário? 😊"*

**Nota operacional para a Claudinha:** essa resposta posiciona o particular como a disponibilidade principal sem dizer "não atendemos convênio" — o que seria agressivo e não é verdadeiro. O objetivo é migrar gradualmente, não excluir.

---

**Resposta Rápida 3 — Localização e horários**

Atalho: `/local`

*"Estamos na Rua Coronel Quirino, 1.204, sala 34, no coração do Cambuí, Campinas. 📍*

*Atendemos de segunda a sexta, das 8h às 18h.*

*Se quiser, pode compartilhar sua localização que eu te ajudo a chegar! 😊"*

**Nota:** confirmar com a Claudinha o ponto de referência mais usado pelas pacientes para chegar ("perto do [X]") e inserir na versão final desta resposta.

---

**Resposta Rápida 4 — Vacinação**

Atalho: `/vacina`

*"Para dúvidas sobre calendário vacinal ou para verificar se as vacinas do seu filho estão em dia, a Dra. Marina faz essa avaliação na consulta de puericultura.*

*Quer agendar uma consulta? Me manda o nome e a data de nascimento da criança e verifico a disponibilidade! 💙"*

---

**Resposta Rápida 5 — Especialização em desenvolvimento infantil**

Atalho: `/desenvolvimento`

*"A Dra. Marina é especializada em Neuropediatria e Desenvolvimento Infantil pela UNICAMP — a única pediatra do Cambuí com essa formação específica.*

*Ela realiza avaliações completas do desenvolvimento neuromotor, da fala, da cognição e do comportamento da criança, com acompanhamento longitudinal.*

*Quer agendar uma avaliação? Me diz o nome e a idade da criança que verifico na agenda! 😊"*

---

## Mensagens automáticas

### Mensagem de boas-vindas (nova conversa)

*"Olá! Bem-vinda ao Instituto Infantil Aurora. 💙*

*Sou a Claudinha, secretária da Dra. Marina. Como posso te ajudar hoje?"*

**Por que identificar a Claudinha pelo nome:** humaniza o atendimento, evita percepção de robô, cria vínculo com quem vai atender. A Claudinha é o rosto do atendimento digital do Instituto.

---

### Mensagem fora do horário (após 18h em dias úteis e fins de semana)

*"Olá! Recebemos sua mensagem e retornaremos assim que abrirmos amanhã de manhã. Atendemos de segunda a sexta, das 8h às 18h. 💙*

*Se for uma emergência pediátrica, por favor procure imediatamente o pronto-socorro mais próximo ou ligue para o SAMU: 192.*

*Até amanhã!"*

**Nota de compliance:** a menção ao SAMU e ao pronto-socorro é obrigatória para clínica pediátrica. Mães de bebês enviam mensagens em momentos de crise — a clínica não pode ser o canal de emergência. Essa mensagem protege a clínica eticamente e orienta corretamente a mãe. Não remover essa instrução mesmo que pareça "desnecessária".

---

### Mensagem de ausência prolongada (sábado, domingo e feriados)

*"Olá! O Instituto Infantil Aurora está fechado no momento. Retornamos na segunda-feira às 8h. 💙*

*Para emergências pediátricas, procure o pronto-socorro mais próximo ou ligue para o SAMU: 192.*

*Até segunda!"*

---

## SLA de atendimento

| Canal | Horário comercial | Fora do horário |
|---|---|---|
| WhatsApp Business | Máximo 1h para primeira resposta | Resposta automática + retorno no próximo dia útil |
| Instagram Direct | Máximo 1h para primeira resposta | Resposta automática + retorno no próximo dia útil |

**Monitoramento do SLA:** CS verifica o painel diariamente nas primeiras 2 semanas para garantir que a Claudinha está respondendo dentro do prazo. Não para cobrar — para apoiar se necessário.

---

## Como lidar com o hábito da Dra. Marina

A Dra. Marina tem o hábito de responder pelo WhatsApp pessoal à noite. Isso é documentado e quase certo de continuar acontecendo nas primeiras semanas após o onboarding.

**Abordagem no kickoff (E01):**
*"Dra. Marina, a partir de agora, todas as mensagens de pacientes sobre agendamento vão passar pelo WhatsApp Business e pelo painel que a Claudinha usa. Quando você responde pelo seu número pessoal — especialmente à noite — a Claudinha não tem esse histórico e pode duplicar o contato ou perder informação importante.*

*Vamos te adicionar como visualizadora no painel: você pode ver todas as conversas em tempo real, sem precisar intervir pelo número pessoal. Funciona para você?"*

**Esse enquadramento:** transforma a restrição em solução. Ela não perde o acesso às conversas — ganha um painel para acompanhar.

**Se a Marina continuar respondendo pelo pessoal nas primeiras semanas:**
- CS não cobra nem critica diretamente
- Na próxima interação, reforça gentilmente: *"Oi Dra. Marina, vi que você respondeu diretamente ontem à noite. Tudo certo. Só lembrando que você pode visualizar todas as conversas pelo painel sem precisar responder — assim a Claudinha tem o histórico completo."*
- Após 3 semanas de hábito persistente: conversa direta na reunião mensal sobre o processo

---

## Treinamento da Claudinha — 2 sessões

### Sessão 1 — Introdução ao painel (30 minutos)

**Formato:** call via WhatsApp (vídeo) ou Zoom com compartilhamento de tela.

**Agenda:**
1. Acesso ao painel (5 min): como entrar, login, navegar nas conversas
2. Como responder (5 min): clicar na conversa, selecionar resposta rápida, personalizar quando necessário
3. Fluxo padrão (10 min): mãe manda mensagem → aparece no painel → Claudinha responde em até 1h → marca status da conversa
4. Situações especiais (5 min):
   - Mãe pede convênio → usar resposta rápida 2 (nunca dizer "não atendemos")
   - Mãe com urgência → orientar pronto-socorro / SAMU, não tentar dar diagnóstico
   - Mãe difícil ou agressiva → não responder na mesma emoção, marcar como pendente e avisar a Dra. Marina via grupo interno
5. Perguntas e dúvidas (5 min)

### Sessão 2 — Revisão e prática (30 minutos)

**Realizar 7-10 dias após a Sessão 1**, quando a Claudinha já tiver usado o painel em situações reais.

**Agenda:**
1. O que funcionou bem? O que gerou dúvida?
2. Situações que aconteceram e não estavam cobertas nas respostas rápidas
3. Ajustes nos textos das respostas rápidas (com base no uso real)
4. Confirmação do SLA: está conseguindo responder em até 1h?
5. Perguntas pendentes

### Entregável para a Claudinha — Guia PDF

Entregar após a Sessão 1. Conteúdo do PDF:

**"Como usar o painel de atendimento — Instituto Infantil Aurora"**

Estrutura:
- Acesso ao painel (link + login)
- As 5 respostas rápidas (atalho + texto completo)
- Fluxo de atendimento ilustrado (screenshot do painel com anotações)
- O que fazer em situações especiais (tabela: situação → ação)
- SLA: máximo 1h de resposta em horário comercial
- Contato do CS para dúvidas: [número do CS]

**Tom do guia:** linguagem simples, direta, sem jargões técnicos. A Claudinha é prática e aprende melhor com exemplos visuais do que com texto corrido.

---

## Dados canônicos do cliente

- **Plataforma:** Chatguru
- **WhatsApp Business:** número da Dra. Marina (pós-migração)
- **Instagram:** @institutoinfantilaurora (Direct conectado)
- **Claudinha:** Camila Rodrigues Tavares, 31 anos, agente principal, na clínica desde 2019
- **Horário de funcionamento:** segunda a sexta, 8h às 18h
- **Emergências:** SAMU (192) — menção obrigatória nas mensagens fora do horário
- **Slogan:** "Cada consulta é um amanhecer" — usar para inspirar o tom das mensagens

---

## Atenções e alertas para este cliente

- **Claudinha pode sentir insegurança com a ferramenta.** Reforçar sempre: "Você vai continuar fazendo exatamente o que já faz — responder as mensagens das pacientes. O painel apenas centraliza tudo num lugar só, com histórico."
- **Dra. Marina vai continuar respondendo à noite pelo pessoal nas primeiras semanas.** Isso é quase certo. Não punir — redirecionar gentilmente para o acesso de visualizadora.
- **Resposta de convênio:** a Claudinha precisa ter clareza de que a resposta não é "não atendemos convênio" (agressivo e pode gerar reclamação) mas sim o texto da resposta rápida 2, que posiciona o particular como disponibilidade principal.
- **Primeira semana:** CS monitora o painel diariamente e entra em contato com a Claudinha se detectar qualquer dificuldade. Objetivo: que ela sinta suporte, não cobrança.
- **Slogan nas mensagens:** o tom "Cada consulta é um amanhecer" deve aparecer nos materiais da clínica, mas não precisa ser usado literalmente em todas as mensagens do atendimento — o tom acolhedor é o suficiente.

---

## Resultado esperado para este cliente

Painel Chatguru configurado com WhatsApp Business e Instagram Direct conectados. 5 respostas rápidas cadastradas e testadas pela Claudinha. Mensagens automáticas ativas (boas-vindas + fora do horário + ausência prolongada). Dra. Marina adicionada como visualizadora. Claudinha treinada (2 sessões) com acesso ativo ao painel. Guia PDF entregue. CS monitorando a operação na primeira semana.

---

## ROTEIRO DE PROTOCOLO OPERACIONAL — Treinamento Chatguru para o Instituto Infantil Aurora

Este roteiro é para o CS responsável pela implementação e treinamento. Seguir em ordem.

**Pré-requisitos antes de configurar:**
- [ ] WhatsApp Business da Dra. Marina ativo (confirmado no E02)
- [ ] Instagram @institutoinfantilaurora conectado ao Meta Business Manager (confirmado no E02)
- [ ] Claudinha informada sobre o onboarding e disponível para as sessões

**Configuração técnica (Dia 8-9):**
- [ ] Criar workspace "Instituto Infantil Aurora" no Chatguru
- [ ] Configurar fuso horário, idioma e horário de funcionamento
- [ ] Conectar WhatsApp Business (número da Dra. Marina)
- [ ] Conectar Instagram Direct (@institutoinfantilaurora)
- [ ] Cadastrar agentes: Claudinha (acesso total), CS Pixel Rain (monitoramento), Dra. Marina (visualizadora)
- [ ] Cadastrar as 5 respostas rápidas com os textos aprovados
- [ ] Configurar mensagem de boas-vindas
- [ ] Configurar mensagem fora do horário (verificar que inclui menção ao SAMU)
- [ ] Configurar mensagem de ausência prolongada
- [ ] Testar o painel: enviar mensagem de teste para o WhatsApp e o Instagram e verificar chegada no painel

**Preparação para a Sessão 1 com a Claudinha:**
- [ ] Preparar o Guia PDF com prints reais do painel configurado para o Instituto
- [ ] Verificar acesso da Claudinha ao painel antes da call (login funcionando)
- [ ] Preparar exemplos de situações reais para demonstração durante o treinamento

**Durante a Sessão 1 com a Claudinha:**
- Tom: parceiro, não professor. "Vou te mostrar como funciona" — não "você precisa aprender isso"
- Se ela travar em alguma etapa: pausar, refazer, não seguir em frente até ela entender
- Perguntar no final: "O que ficou confuso? O que você gostaria de ver de novo?"
- Combinar data da Sessão 2 antes de encerrar a Sessão 1

**Entre Sessão 1 e Sessão 2 (monitoramento ativo):**
- [ ] CS acessa o painel diariamente para verificar se conversas estão sendo respondidas
- [ ] Se detectar conversa sem resposta por mais de 1h30: avisar a Claudinha pelo grupo interno (sem expor no painel)
- [ ] Se detectar a Dra. Marina respondendo pelo pessoal: registrar e endereçar na Sessão 2 ou na reunião mensal

**Sessão 2 com a Claudinha (7-10 dias após a Sessão 1):**
- Perguntar primeiro: "Como foi a semana? Teve alguma situação que te travou?"
- Baseie o conteúdo da Sessão 2 nas dificuldades reais que aconteceram
- Ajustar os textos das respostas rápidas se necessário (com base no uso real)
- Se a Claudinha estiver confortável: a operação está independente. CS reduz monitoramento para 2x por semana.

**Sinal de sucesso:** Claudinha responde em até 1h em horário comercial, usa as respostas rápidas, marca o status das conversas no painel e entra em contato com o CS quando não sabe como lidar com uma situação — em vez de improvisar ou ignorar.

---
*Documento de processo aplicado — Pixel Rain Agency. Cliente: Instituto Infantil Aurora. Versão 2.0 — Maio 2026*
