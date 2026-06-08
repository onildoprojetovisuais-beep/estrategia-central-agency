# E05 — Painel Omnichannel
**N1 — Plano de Atração | Pixel Rain Agency**
**Classificacao:** Processo Operacional Interno

---

## O que e este entregavel

A implementacao do Painel Omnichannel configura uma plataforma centralizada de atendimento digital que unifica WhatsApp Business e Instagram Direct em um unico painel gerenciavel. O objetivo e eliminar o gargalo mais comum entre "lead chegando" e "consulta agendada": a falta de processo de resposta.

Um lead gerado por trafego pago que fica 3 horas sem resposta ja perdeu interesse ou foi para o concorrente. Uma mae ansiosa com uma duvida sobre o bebe que recebe apenas uma resposta automatica e nunca um retorno humano nao volta. O painel resolve isso estruturalmente.

**Plataforma preferencial: Chatguru.** Alternativa: Octadesk. A escolha e feita no primeiro dia de implantacao com base no plano ativo da agencia.

A implementacao inclui obrigatoriamente o treinamento da secretaria. Ferramenta sem usuario capacitado e ferramenta que nao funciona.

---

## Quem executa

| Papel | Responsabilidade |
|---|---|
| Gestor de Trafego | Setup tecnico: conexao dos canais, configuracao de filas, automacoes e respostas rapidas |
| CS | Coordenacao do treinamento da secretaria, entrega do guia PDF, acompanhamento na primeira semana |
| Social Media | Suporte na criacao dos textos das respostas rapidas e mensagens automaticas |

---

## Quando acontece

- **Setup tecnico:** Dias 8 a 10
- **Treinamento da secretaria:** ate o Dia 12

---

## Insumos necessarios (o que precisa existir antes)

- WhatsApp Business da clinica confirmado (E02) — precisa ser conta Business, nao pessoal
- Acesso ao Instagram confirmado via Meta Business Suite (E02)
- Numero da secretaria e disponibilidade para a call de treinamento
- Horarios de funcionamento da clinica (E02)
- Informacoes de servicos e convenios (E02)

---

## Plataforma: Chatguru (padrao) ou Octadesk

**Por que Chatguru:** Interface mais simples para o usuario final (secretaria), custo acessivel, suporte em portugues, integracao nativa com WhatsApp Business API e Instagram Direct.

**Quando usar Octadesk:** Se a agencia ja tem conta ativa Octadesk ou se o cliente ja usa a plataforma. Nao migrar plataforma durante o N1 — escolher uma e manter.

**Configuracao inicial da conta:**
- Nome do workspace: [Nome da Clinica]
- Fuso horario: America/Sao_Paulo
- Idioma: Portugues brasileiro
- Logo: da clinica (para personalizacao visual do painel)

---

## Passo a passo detalhado

### Passo 1 — Conexao do WhatsApp Business (Dia 8)

**Metodo padrao (sem API):**
1. No painel do Chatguru, acessar Configuracoes > Canais > WhatsApp
2. Gerar o QR Code de conexao
3. No celular com o numero da clinica: WhatsApp > 3 pontos > Aparelhos conectados > Conectar aparelho
4. Escanear o QR Code
5. Aguardar confirmacao da conexao (geralmente 30 segundos)
6. Testar: enviar uma mensagem de outro numero para o WhatsApp da clinica e verificar se aparece no painel

**Ponto de atencao critico:** O celular com o numero da clinica DEVE permanecer conectado a internet (Wi-Fi ou dados moveis). Se o celular ficar sem bateria ou sem conexao, o painel perde a sincronizacao. Orientar a secretaria sobre isso.

**Se o numero for conta pessoal (nao Business):**
Orientar a migracao para WhatsApp Business antes de conectar. A migracao preserva o numero, os contatos e o historico. Fazer isso em uma chamada rapida de 10 minutos com o cliente.

---

### Passo 2 — Conexao do Instagram Direct (Dias 8-9)

**Pre-requisito:** O Instagram da clinica deve estar conectado a uma Pagina do Facebook no Meta Business Suite. Se nao estiver, configurar primeiro (Configuracoes do Instagram > Contas vinculadas > Facebook).

1. No painel do Chatguru, acessar Configuracoes > Canais > Instagram
2. Clicar em "Conectar com o Facebook"
3. Fazer login com a conta do Meta Business Suite da clinica
4. Selecionar a Pagina do Facebook vinculada ao Instagram
5. Confirmar as permissoes de mensagem (aceitar todas as permissoes solicitadas)
6. Aguardar confirmacao
7. Testar: enviar uma mensagem de Direct de outro perfil para o Instagram da clinica e verificar se aparece no painel

---

### Passo 3 — Configuracao de filas e agentes (Dia 9)

**Estrutura de filas:**

- **Fila principal:** "Atendimento Geral" — todos os novos contatos chegam aqui por padrao
- **Horario da fila:** configurar o horario real de atendimento da clinica (ex: segunda a sexta 8h-18h)

**Agentes:**

| Agente | Papel | Nivel de acesso |
|---|---|---|
| Secretaria | Operacional — responde e gerencia as conversas | Agente |
| CS da Pixel Rain | Monitoramento — acompanha sem responder como clinica | Supervisor (somente visualizacao) |

Criar o login da secretaria (nome + e-mail dela) e enviar o convite de acesso para o e-mail dela.

---

### Passo 4 — Configuracao das 5 respostas rapidas essenciais (Dia 9)

As respostas rapidas sao atalhos de texto que a secretaria aciona com um comando rapido ("/saudacao", "/horarios", etc.). Devem soar humanas e acolhedoras — nao robotizadas.

**Resposta rapida 1 — Saudacao**
*Atalho:* /saudacao

> "Ola! Seja bem-vindo(a) a Clinica [Nome]! Aqui e a [Nome da secretaria]. Como posso te ajudar hoje? 😊"

---

**Resposta rapida 2 — Horarios**
*Atalho:* /horarios

> "Nosso horario de atendimento e:
> Segunda a sexta: [horario de abertura] às [horario de fechamento]
> [Sabado: horario, se aplicavel]
>
> Se quiser, posso ja verificar a disponibilidade para agendar uma consulta! Me passa o nome da crianca e a idade dela."

---

**Resposta rapida 3 — Como agendar**
*Atalho:* /agendar

> "Para agendar uma consulta com a [Dra./Dr. Nome] e bem simples!
>
> Preciso de:
> - Nome da crianca
> - Idade
> - Motivo da consulta (rotina, doenca, primeira vez?)
>
> Com essas informacoes eu ja verifico a agenda e te passo as opcoes disponíveis!"

---

**Resposta rapida 4 — Convenios**
*Atalho:* /convenios

> "[Duas opcoes — usar a correspondente ao cliente:]
>
> OPCAO A (so particular):
> 'Nossa clinica trabalha apenas com atendimento particular. O valor da consulta e R$[valor]. Aceitamos dinheiro, cartao e Pix.'
>
> OPCAO B (tem convenios):
> 'Atendemos pelos seguintes convenios: [lista]. Para verificar sua cobertura, recomendo entrar em contato com a operadora. Tambem atendemos de forma particular — posso te passar o valor se preferir!'"

---

**Resposta rapida 5 — Endereco e como chegar**
*Atalho:* /endereco

> "Estamos localizados em:
> [Endereco completo com numero e complemento]
> Bairro [Bairro], [Cidade]
>
> Referencia: [ponto de referencia relevante — predio, farmacia, escola proxima]
>
> [Se tiver estacionamento:] 'Ha estacionamento disponivel no local.'
> [Se for por transporte publico:] 'O ponto de onibus mais proximo e [nome/linha].'
>
> Precisando de mais informacoes, estou aqui!"

---

### Passo 5 — Configuracao das mensagens automaticas (Dia 9)

**Mensagem de boas-vindas** (dispara quando um novo contato envia a primeira mensagem):

> "Ola! Voce entrou em contato com a Clinica [Nome]. Nossa equipe ja foi notificada e vai te atender em breve!
>
> Horario de atendimento: [dias e horarios]
>
> Se for uma emergencia pediatrica, dirija-se imediatamente ao pronto-socorro mais proximo. 🏥"

**Mensagem fora do horario** (dispara quando o contato envia mensagem fora do horario configurado):

> "Ola! Voce entrou em contato fora do nosso horario de atendimento.
>
> Funcionamos de [dias e horarios]. Nossa equipe vai retornar sua mensagem assim que estivermos de volta!
>
> **Importante:** Se a crianca estiver apresentando sintomas graves ou emergenciais, procure imediatamente o pronto-socorro mais proximo ou ligue para o SAMU (192).
>
> Ate logo! 😊"

**Mensagem de fim de semana / feriado** (configurar separadamente se aplicavel):

> "Ola! Nossa clinica esta fechada [hoje/neste feriado]. Retornamos [dia de retorno] as [horario].
>
> Para emergencias pediatricas: SAMU 192 ou pronto-socorro mais proximo.
>
> Ate [dia de retorno]! 😊"

> **Ponto de atencao:** As mensagens fora do horario para clinicas pediatricas precisam incluir SEMPRE a orientacao sobre emergencias. Maes enviam mensagens as 2h da manha com criancas febris. A mensagem automatica precisa ser um guia de seguranca, nao apenas "voltamos em breve".

---

### Passo 6 — SLA de resposta

O SLA e a regra de ouro do painel omnichannel:

**Maximo 1 hora de resposta em horario comercial.**

Comunicar isso claramente na mensagem de boas-vindas e no treinamento da secretaria. O objetivo e que a secretaria sempre responda antes de 1 hora — nao que ela use a hora inteira.

Como a Pixel Rain monitora:
- CS verifica o painel semanalmente (toda segunda-feira)
- Verifica: tempos de resposta, mensagens sem resposta, conversas abandonadas
- Notifica a secretaria se identificar problema recorrente

---

### Passo 7 — Teste completo do fluxo (Dia 10)

Antes de liberar o painel para uso, testar tudo com numero de teste:

1. Enviar mensagem no WhatsApp da clinica — verificar se aparece no painel
2. Verificar se a mensagem de boas-vindas disparou automaticamente
3. Testar cada resposta rapida (/saudacao, /horarios, /agendar, /convenios, /endereco)
4. Enviar mensagem no Direct do Instagram — verificar se aparece no mesmo painel
5. Desligar o horario de atendimento nas configuracoes e enviar mensagem — verificar se a mensagem fora do horario disparou
6. Reativar o horario de atendimento

Registrar: OK ou Problema em cada item. Corrigir todos os problemas antes do treinamento da secretaria.

---

### Passo 8 — Treinamento da secretaria (ate Dia 12)

**Formato:** Call de 30 minutos (Google Meet, Zoom ou WhatsApp Video).

**Conteudo do treinamento:**

**Bloco 1 — Acesso ao painel (5 min)**
- Como acessar o painel (URL + usuario + senha)
- Como visualizar as conversas no feed
- Como identificar conversas novas / em andamento / resolvidas

**Bloco 2 — Como responder (10 min)**
- Como clicar em uma conversa e responder
- Como usar as respostas rapidas (digitar "/" para abrir o menu)
- Quando usar qual resposta rapida
- Como enviar arquivos e imagens pelo painel

**Bloco 3 — Regras operacionais (10 min)**
- SLA de resposta: maximo 1 hora em horario comercial
- O que ela pode resolver sozinha (duvidas basicas, agendamentos)
- O que ela precisa escalar (reclamacoes, situacoes sensiveis, duvidas medicas)
- Como marcar uma conversa como "resolvida" quando o agendamento for confirmado

**Bloco 4 — Perguntas e duvidas (5 min)**
Espaco livre para a secretaria perguntar. Reforcar: "Qualquer duvida que surgir depois, me chama direto no WhatsApp que eu ajudo."

**Entregavel do treinamento:** Guia PDF simplificado de uso para a secretaria (ver estrutura abaixo).

---

## Guia PDF para a Secretaria — Estrutura

O guia deve ser simples, visual, com prints do painel e linguagem direta. Maximo 8 paginas.

**Pagina 1 — Como acessar o painel**
URL, usuario, senha (ou orientacao para trocar a senha no primeiro acesso). Print da tela de login.

**Pagina 2 — Como responder uma mensagem**
Print do feed de conversas. Seta indicando onde clicar para abrir e responder.

**Pagina 3 — Como usar as respostas rapidas**
Print mostrando o "/" e o menu de respostas rapidas. Lista dos 5 atalhos com o que cada um faz.

**Pagina 4 — Regras de ouro**
Texto curto e objetivo:
- Responder em ate 1 hora em horario comercial
- Nao responder duvidas medicas — encaminhar para a Dra.
- Marcar como resolvida quando o agendamento for confirmado
- Em casos de reclamacao ou insatisfacao: acionar CS da Pixel Rain

**Pagina 5-6 — Scripts das 5 respostas rapidas**
Texto de cada resposta rapida impresso por extenso para referencia.

**Pagina 7 — O que fazer se o painel der problema**
- WhatsApp desconectou: verificar o aparelho, reconectar via QR Code
- Instagram nao esta chegando: verificar se a Pagina do Facebook esta ativa
- Contato de suporte da Pixel Rain: [nome do CS + WhatsApp]

**Pagina 8 — Emergencias pediatricas (mensagem automatica)**
Lembrete do texto da mensagem fora do horario — para que a secretaria entenda a importancia e nao altere sem avisar.

---

## O que a Pixel Rain monitora semanalmente no painel

**Toda segunda-feira, CS verifica:**

| Metrica | O que e considerado OK |
|---|---|
| Tempo medio de resposta | Abaixo de 1 hora em horario comercial |
| Mensagens sem resposta | Zero mensagens sem resposta apos 2 horas |
| Volume de contatos novos | Comparar com semana anterior — tendencia de crescimento |
| Conversas abertas ha mais de 24h sem interacao | Zero — deve ser resolvido ou escalado |

Se identificar problema recorrente, CS notifica a secretaria diretamente com orientacao especifica.

---

## Ferramentas utilizadas

| Ferramenta | Para que |
|---|---|
| Chatguru (principal) ou Octadesk (alternativa) | Plataforma de atendimento omnichannel |
| Meta Business Suite | Conexao do Instagram ao painel |
| WhatsApp Business (app no celular da clinica) | Pareamento com o painel via QR Code |
| Canva ou Google Docs | Criacao do Guia PDF para a secretaria |
| Google Meet / Zoom / WhatsApp Video | Treinamento da secretaria |

---

## Padrao de qualidade (como saber se esta bom)

- [ ] WhatsApp Business conectado e funcionando no painel
- [ ] Instagram Direct conectado e funcionando no painel
- [ ] 5 respostas rapidas cadastradas e testadas
- [ ] Mensagem de boas-vindas configurada e testada
- [ ] Mensagem fora do horario configurada, testada e com orientacao de emergencia
- [ ] Secretaria tem acesso ao painel com seu proprio login
- [ ] Secretaria treinada (call de 30 min realizada)
- [ ] Guia PDF entregue para a secretaria
- [ ] SLA de 1 hora comunicado e confirmado pela secretaria
- [ ] Teste completo realizado pelo Gestor de Trafego antes da liberacao

---

## Entregavel final

Painel omnichannel configurado e operacional, com WhatsApp Business e Instagram Direct conectados. Secretaria treinada com acesso ativo. Guia PDF entregue. Log de configuracao registrado no CRM (data, plataforma escolhida, canais conectados, agentes cadastrados, resultado dos testes).

## Prazo maximo

**Setup tecnico:** Dia 10. **Treinamento da secretaria:** Dia 12.

---

## O que fazer se travar

| Situacao | Acao |
|---|---|
| WhatsApp nao esta em conta Business | Orientar migracao antes de conectar. Tutorial disponivel no site oficial do WhatsApp Business. Fazer junto em chamada de 10 minutos |
| Instagram nao esta vinculado a uma Pagina do Facebook | Criar e vincular a Pagina antes de conectar ao painel. Processo no Meta Business Suite: Configuracoes > Contas do Instagram > Vincular conta |
| Secretaria nao consegue participar da call no prazo | Enviar o Guia PDF com video de tutorial (maximo 5 minutos) por WhatsApp. Agendar a call para a semana seguinte. Acompanhar de perto nos primeiros dias |
| Medica continua respondendo pelo WhatsApp pessoal | Reforcar com a medica: "Quando voce responde pelo pessoal, a [secretaria] nao tem o historico da conversa e pode duplicar o contato ou perder o acompanhamento." E uma questao de processo — nao de tecnica |
| Plataforma instavel ou com bugs | Ter a segunda opcao (Chatguru ou Octadesk) avaliada. Se o problema persistir por mais de 2 dias uteis, migrar para a alternativa sem esperar resolucao indefinida |
| Celular da clinica fica sem internet e painel desconecta | Orientar a clinica a manter o celular com o numero da clinica sempre conectado (Wi-Fi ou plano de dados). Alternativa: usar WhatsApp Business API (plano pago) que nao depende do celular — avaliar upgrade se desconexoes forem frequentes |

---

## ROTEIRO DE PROTOCOLO OPERACIONAL

> Este roteiro orienta como fazer o setup completo do painel do zero e como conduzir o treinamento da secretaria de forma eficaz.

---

### Etapa 1 — Preparacao antes do setup (Dia 8, manha)

**Tempo: 15 minutos**

1. Confirmar qual plataforma usar: Chatguru ou Octadesk (verificar plano ativo da agencia)
2. Abrir o E02 e confirmar que o WhatsApp Business e a conta Instagram estao validados
3. Confirmar o horario de funcionamento da clinica (usado na configuracao das filas)
4. Salvar o numero de WhatsApp da secretaria — voce vai precisar para enviar o acesso
5. Separar os textos das respostas rapidas e mensagens automaticas (template desta secao) — personalize com os dados do cliente antes de comecar o setup

---

### Etapa 2 — Criar a conta na plataforma (Dia 8, manha)

**Tempo: 15 a 20 minutos**

No Chatguru:
1. Acesse chatguru.com.br > Login (com a conta da agencia)
2. Va em "Clientes" ou "Workspaces" > Criar novo workspace para o cliente
3. Configure: nome da clinica, fuso horario (America/Sao_Paulo), idioma (PT-BR)
4. Adicione o logo da clinica (do E02) para personalizar o workspace

---

### Etapa 3 — Conectar o WhatsApp (Dia 8, tarde)

**Tempo: 20 a 30 minutos**

1. No painel do cliente, va em Configuracoes > Canais > WhatsApp > Adicionar
2. Gere o QR Code
3. Ligue para a secretaria (ou medica) e peca para escanear o QR Code no WhatsApp do numero da clinica
4. Aguarde a confirmacao da conexao
5. Envie uma mensagem de teste de outro numero — verifique se aparece no painel
6. Se nao aparecer em 2 minutos: recarregar a pagina e verificar se a conexao ainda esta ativa

**Ponto de atencao:** Faca isso em horario comercial, quando a secretaria esta disponivel. O escaneamento do QR Code precisa ser feito no celular que tem o numero da clinica — nao da para fazer remotamente.

---

### Etapa 4 — Conectar o Instagram (Dias 8-9)

**Tempo: 20 a 30 minutos**

1. Verifique antes: o Instagram da clinica esta vinculado a uma Pagina do Facebook? (Se nao, corrigir primeiro)
2. No painel, va em Configuracoes > Canais > Instagram > Conectar
3. Clique em "Conectar com o Facebook" e faca login com a conta do Meta Business Suite da clinica
4. Selecione a Pagina vinculada ao Instagram
5. Aceite todas as permissoes solicitadas
6. Aguarde confirmacao
7. Envie uma mensagem de Direct de outro perfil — verifique se aparece no painel junto com as mensagens de WhatsApp

---

### Etapa 5 — Configurar filas, horarios e agentes (Dia 9, manha)

**Tempo: 30 minutos**

1. Va em Configuracoes > Filas > Criar fila
2. Nome: "Atendimento Geral". Horario: configurar o horario real da clinica
3. Va em Configuracoes > Agentes > Convidar agente
4. Insira o e-mail da secretaria. Nivel: Agente
5. Adicione o e-mail do CS da Pixel Rain. Nivel: Supervisor (somente leitura)
6. Aguarde os convites serem aceitos (cobrar a secretaria para aceitar o convite no mesmo dia)

---

### Etapa 6 — Cadastrar respostas rapidas e mensagens automaticas (Dia 9, tarde)

**Tempo: 45 a 60 minutos**

1. Va em Configuracoes > Respostas Rapidas
2. Crie cada uma das 5 respostas rapidas desta secao, com os atalhos (/saudacao, /horarios, etc.)
3. Personalize os textos com os dados reais do cliente antes de salvar
4. Va em Configuracoes > Mensagens Automaticas
5. Configure a mensagem de boas-vindas
6. Configure a mensagem fora do horario (IMPORTANTE: incluir orientacao de emergencias pediatricas)
7. Configure mensagem de fim de semana se aplicavel

---

### Etapa 7 — Teste completo (Dia 10, manha)

**Tempo: 30 a 45 minutos**

Use um numero pessoal para testar. Execute cada item da lista de testes da Secao "Passo 7". Registre o resultado de cada teste. Corrija qualquer problema antes do treinamento.

Nao pule esta etapa. A secretaria nao pode ser treinada em uma plataforma com bug nao resolvido.

---

### Etapa 8 — Treinamento da secretaria (ate Dia 12)

**Tempo: 30 minutos de call + 15 minutos de preparacao**

**Preparacao antes da call:**
- Tenha o Guia PDF pronto para enviar durante ou imediatamente apos a call
- Acesse o painel do cliente como supervisor para mostrar a tela em tempo real
- Tenha o numero de suporte da Pixel Rain definido para passar para a secretaria

**Durante a call:**
1. Comece mostrando o painel — "Voce vai usar isso toda vez que uma mensagem chegar no WhatsApp ou no Instagram da clinica"
2. Mostre onde ficam as conversas novas
3. Faca ela responder uma mensagem de teste na frente de voce
4. Mostre como usar as respostas rapidas — faca ela usar pelo menos 2
5. Explique o SLA de 1 hora — "Isso significa que voce responde antes de 1 hora, nao espera 1 hora para responder"
6. Explique o que ela pode resolver e o que deve escalar
7. Passe o seu contato de suporte
8. Envie o Guia PDF pelo WhatsApp imediatamente apos a call

**Ponto de atencao:** Nao sobrecarregue a secretaria com muita informacao de uma vez. Os 3 pontos mais importantes que ela precisa sair sabendo: (1) onde as mensagens chegam, (2) como responder usando as respostas rapidas, (3) a quem escalar quando nao sabe.

---

### Etapa 9 — Acompanhamento na primeira semana (Dias 12-19)

**Tempo: 15 minutos por dia (monitoramento)**

CS acessa o painel como supervisor todo dia nos primeiros 7 dias de operacao da secretaria.

Verificar:
- Mensagens sem resposta por mais de 1 hora
- Respostas muito longas ou muito curtas (fora do padrao)
- Conversas abertas sem resolucao

Se identificar problema: enviar mensagem direta para a secretaria no grupo de suporte criado (CS + secretaria). Tom: orientador, nao critico.

---

*Documento de processo interno — Pixel Rain Agency. Versao 2.0 — Maio 2026*
