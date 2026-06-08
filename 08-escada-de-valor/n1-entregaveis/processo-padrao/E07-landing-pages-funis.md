# E07 — Landing Pages e Funis de Captação
**N1 — Fase de Atração | Pixel Rain Agency**
**Classificação:** Processo Operacional Interno
**Entrega:** Semana 2 da implantação (até o Dia 14)

---

## O que é este entregável

A criação das Landing Pages dos 3 Funis é a construção das três páginas de conversão que vão receber todo o tráfego pago gerado pelo N1. Cada landing page corresponde a um funil específico, com uma oferta específica e um público específico. São essas páginas que transformam o clique em lead cadastrado.

Links genéricos para o Instagram ou para a homepage não convertem. Uma mãe que clicou em um anúncio sobre "avaliação de desenvolvimento do bebê" precisa chegar em uma página que fala exclusivamente sobre isso: autoridade do médico, benefícios claros, formulário simples, zero fricção. Qualquer elemento fora de lugar reduz a conversão.

Os 3 funis cobrem os três principais momentos de decisão de uma mãe que busca pediatra:

| Funil | Momento | Temperatura do Lead |
|---|---|---|
| F1 — Avaliação de Desenvolvimento | Preocupada com o desenvolvimento do bebê | Quente — alta intenção |
| F2 — Guia da Primeira Consulta | Bebê recém-nascido, ainda sem pediatra definido | Morno — nutrição de relacionamento |
| F3 — Migração de Convênio para Particular | Insatisfeita com o convênio, considerando mudar | Estratégico — decisão de mudança |

---

## Stack Técnico Padrão

A Pixel Rain adota o seguinte stack como padrão para landing pages de médicos:

**Opção A — Cliente com site WordPress:**
- Plataforma: WordPress com Elementor Pro
- Domínio: subpasta do site da clínica (nomeclinica.com.br/avaliacao)
- Vantagem: SEO integrado ao domínio principal, sem custo adicional de plataforma

**Opção B — Cliente sem site (MVP):**
- Plataforma: Systeme.io (plano gratuito suporta até 3 funis)
- Domínio: subdomínio customizado (avaliacao.nomeclinica.com.br via DNS)
- Vantagem: rápida implantação, formulário nativo, integração com e-mail e automações

**Regra de decisão:** se o cliente tem WordPress ativo e funcional, usar Elementor. Se não tem site ou o site é legado/difícil de alterar, usar Systeme.io. Documentar a escolha no sistema interno.

---

## Quem executa

| Papel | Responsabilidade |
|---|---|
| Social Media | Copy de todas as páginas, layout e design, gestão da aprovação com o cliente |
| Gestor de Tráfego | Instalação do Meta Pixel e GA4, integração do formulário com WhatsApp, configuração dos eventos de conversão, testes de tracking |
| CS | Coordenação de prazos, envio ao cliente para aprovação, handoff com a secretária |

---

## Quando acontece

**Dias 8 a 14 do contrato.**

| Fase | Dias | Responsável |
|---|---|---|
| Escolha da plataforma e estrutura | Dia 8 | CS + Gestor |
| Copy das 3 páginas | Dias 8-10 | Social Media |
| Layout e design das 3 páginas | Dias 10-12 | Social Media |
| Instalação técnica (pixel, GA4, formulário) | Dias 10-12 | Gestor de Tráfego |
| Envio para aprovação do cliente | Dia 12 | CS |
| Ajustes pós-aprovação | Dia 13 | Social Media |
| Publicação e testes finais | Dia 14 | Gestor + Social Media |

---

## Insumos necessários

- Fotos profissionais do médico e da clínica (coletadas no E02)
- Logo e identidade visual validada (E02)
- Meta Pixel e GA4 instalados no domínio (E06)
- WhatsApp Business conectado ao painel omnichannel (E05)
- Briefing com USP, diferenciais e público-alvo (E01)

---

## Os 3 Funis em Detalhe

### F1 — Avaliação de Desenvolvimento Infantil

**Objetivo:** capturar leads de mães preocupadas com o desenvolvimento do bebê. Público de alta intenção — já sente a dor e está buscando solução ativamente.

**Público-alvo:** mães de bebês de 0 a 2 anos. Preocupação central: "meu filho está se desenvolvendo como deveria?"

**Estrutura da Landing Page:**

| Bloco | Conteúdo |
|---|---|
| Headline | Foca na preocupação da mãe, não no produto. Ex: "Seu bebê está se desenvolvendo como deveria?" |
| Subheadline | Amplia a proposta com o diferencial do médico. Ex: "Agende uma avaliação completa de desenvolvimento com o Dr. [Nome], pediatra especialista em puericultura." |
| Autoridade | Foto do médico (alta qualidade, expressão acolhedora) + 2-3 linhas de credenciais (especialização, formação, anos de experiência) |
| Benefícios | Lista com 4-5 bullets: o que a mãe vai obter na avaliação (rastreio de marcos, orientação sobre alimentação, espaço para dúvidas, continuidade de acompanhamento) |
| Prova social | Depoimentos de pacientes (se autorizados) OU número de crianças atendidas. Ex: "+500 famílias acompanhadas" |
| Formulário | Nome da mãe, nome do bebê, data de nascimento do bebê, WhatsApp |
| CTA | Botão de alto contraste com ação específica. Ex: "Quero agendar a avaliação" |
| Redução de risco | Linha abaixo do botão: "Sem compromisso. Você decide se quer continuar o acompanhamento." |

**Tracking configurado:**
- Meta Pixel: evento `Lead` no submit do formulário
- GA4: evento `generate_lead` no submit do formulário
- UTM: `utm_source=meta&utm_medium=paid&utm_campaign=F1-avaliacao`

---

### F2 — Guia da Primeira Consulta

**Objetivo:** capturar leads de mães em fase inicial (bebê recém-nascido ou até 6 meses), que ainda não têm pediatra definido. Oferta de e-book gratuito. Nutrição de relacionamento — a conversão para consulta acontece no funil de e-mail/WhatsApp pós-download.

**Público-alvo:** mães de bebês de 0 a 6 meses, primigestas, mães ansiosas sobre a primeira consulta pediátrica.

**Estrutura da Landing Page:**

| Bloco | Conteúdo |
|---|---|
| Headline | Captura a ansiedade do momento. Ex: "Vai levar seu bebê ao pediatra pela primeira vez? Descubra o que levar, o que perguntar e o que esperar da consulta." |
| Subheadline | Apresenta o guia como solução para a ansiedade. Ex: "Baixe gratuitamente o Guia da Primeira Consulta criado pelo Dr. [Nome]." |
| Prévia do e-book | 4-5 bullets do que está no guia (gera percepção de valor antes do cadastro) |
| Visual do e-book | Mockup de capa do e-book criado no Canva (imagem profissional, não apenas texto) |
| Formulário | Nome, e-mail, WhatsApp, idade do bebê |
| CTA | "Quero receber o guia gratuito" |
| Pós-formulário | Confirmação automática: "Seu guia foi enviado para o WhatsApp informado. Verifique agora!" |

**Tracking configurado:**
- Meta Pixel: evento `Lead` no submit do formulário
- GA4: evento `generate_lead` no submit do formulário
- UTM: `utm_source=meta&utm_medium=paid&utm_campaign=F2-guia`

**Automação pós-lead:**
- Lead entra na lista de WhatsApp do funil F2
- Sequência de 3 mensagens ao longo de 7 dias (via Chatguru ou Z-API): envio do guia, dica complementar, CTA para agendar primeira consulta

---

### F3 — Migração de Convênio para Particular

**Objetivo:** capturar leads de mães que já têm pediatra de convênio, mas estão insatisfeitas. Oferta de primeira consulta particular com condição especial de apresentação.

**Público-alvo:** mães com filhos em convênio, frustradas com troca constante de médico, tempo de espera, consultas curtas, falta de continuidade.

**Estrutura da Landing Page:**

| Bloco | Conteúdo |
|---|---|
| Headline | Aborda a dor diretamente. Ex: "Cansada de levar seu filho a um pediatra diferente toda vez que vai ao convênio?" |
| Copy de problema | 2-3 parágrafos descrevendo as dores do convênio: troca de médico, 15 minutos de consulta, sem continuidade, sem quem "conhece" a criança |
| Virada | Transição para o modelo particular como contraste. Ex: "E se cada consulta fosse com o mesmo médico, que já conhece seu filho, sem pressa?" |
| Proposta | Primeira consulta particular com condição especial. Ex: "Conheça o Dr. [Nome] com desconto de apresentação para novos pacientes." |
| Autoridade | Médico + credenciais + diferencial do modelo de atendimento (tempo de consulta, continuidade, disponibilidade) |
| Formulário | Nome da mãe, WhatsApp, nome e idade da criança |
| CTA | "Quero conhecer o atendimento particular" |

**Tracking configurado:**
- Meta Pixel: evento `Lead` no submit do formulário
- GA4: evento `generate_lead` no submit do formulário
- UTM: `utm_source=meta&utm_medium=paid&utm_campaign=F3-migracao`

---

## Instalação de Tracking

Todas as 3 páginas recebem a mesma estrutura de rastreamento:

**Meta Pixel:**
```html
<!-- Instalar no <head> de cada página -->
<script>
!function(f,b,e,v,n,t,s){...}(window, document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '[SEU_PIXEL_ID]');
fbq('track', 'PageView');
</script>
```

**Evento de Lead (dispara no submit do formulário):**
```javascript
fbq('track', 'Lead');
```

**GA4 — evento generate_lead:**
```javascript
gtag('event', 'generate_lead', {
  'currency': 'BRL',
  'value': 0
});
```

**Teste obrigatório:** usar o Meta Pixel Helper (extensão Chrome) e o Google Tag Assistant para confirmar que os eventos estão disparando corretamente antes do lançamento das campanhas.

---

## Handoff com a Secretária

A secretária precisa saber o que acontece quando chega um lead. O CS faz esse briefing no Dia 15 (após o lançamento das LPs e campanhas).

**O que a secretária precisa saber:**

1. **De onde vêm os leads:** formulários preenchidos nas páginas de avaliação, guia ou migração de convênio. Chegam via WhatsApp Business com os dados preenchidos (nome, bebê, telefone).

2. **Como identificar um lead de tráfego pago:** a mensagem automática que chega no WhatsApp Business vai vir com um prefixo identificando o funil. Ex: "[F1 — Avaliação] Nova solicitação: Ana Lima, bebê João, 8 meses, (11) 9xxxx-xxxx"

3. **Tempo de resposta:** o SLA é de resposta em até 1 hora em dias úteis (8h-18h). Depois desse prazo, a probabilidade de agendamento cai significativamente.

4. **Script de primeiro contato (WhatsApp):**
   > "Oi [Nome da mãe]! Tudo bem? Aqui é a [Nome da secretária], da clínica do Dr. [Nome]. Vi que você pediu informações sobre [avaliação/primeira consulta/consulta particular]. Temos horários disponíveis [esta semana / próxima semana]. Posso te enviar as opções?"

5. **O que NÃO fazer:** não enviar tabela de preços sem antes criar conexão. Não deixar o lead "no vácuo" por mais de 24h.

---

## Diretrizes de Design

- **Mobile-first:** a maioria das mães acessa pelo celular. Testar no mobile antes do desktop.
- **Formulário acima do fold:** visível sem scroll no mobile.
- **Foto do médico:** em posição de destaque, alta qualidade, expressão acolhedora — jamais foto de jaleco com expressão séria.
- **Botão de CTA:** cor de alto contraste com o restante da página. O botão precisa "saltar" visualmente.
- **Velocidade:** meta de carregamento acima de 70 no PageSpeed Insights (mobile). Comprimir imagens antes de subir.
- **Sem menu de navegação:** landing page não tem menu. Sem saída além do formulário.

---

## Ferramentas utilizadas

| Ferramenta | Para quê |
|---|---|
| WordPress + Elementor Pro / Systeme.io | Plataforma de criação das landing pages |
| Canva | Mockup do e-book (F2) e criativos de apoio |
| Meta Pixel Helper | Verificação do pixel nas páginas |
| Google Tag Assistant | Verificação do GA4 nas páginas |
| Zapier ou Make | Integração formulário → WhatsApp Business (se não nativo) |
| PageSpeed Insights | Verificação de velocidade das páginas |

---

## Padrão de qualidade

- [ ] 3 landing pages publicadas com URL definitivo documentado
- [ ] Cada página tem: headline, autoridade, benefícios, formulário, CTA
- [ ] Meta Pixel instalado e testado em cada página
- [ ] GA4 instalado e testado em cada página
- [ ] Evento "Lead" disparando no submit de cada formulário (confirmado pelo Pixel Helper)
- [ ] Formulário integrado com WhatsApp Business da secretária
- [ ] Testado em mobile (iOS + Android) com visualização adequada
- [ ] Aprovado pelo cliente antes da publicação
- [ ] Velocidade mobile acima de 70 no PageSpeed Insights
- [ ] Briefing de handoff feito com a secretária

---

## Entregável final

3 landing pages publicadas e operacionais, com rastreamento instalado e formulários funcionando. URLs registrados na documentação do cliente. Links enviados ao time de tráfego para uso nas campanhas (E08). Secretária briefada sobre o fluxo de leads.

---

## O que fazer se travar

**Cliente demora mais de 48h para aprovar:** CS cobra diretamente via WhatsApp. Lembrar o SLA combinado no kickoff. Se não houver resposta em 72h, aplicar aprovação tácita (documentar no sistema interno) e publicar.

**Plataforma não aceita integração com WhatsApp:** Usar Zapier como middleware. Se não for possível, o formulário envia e-mail para a secretária como solução temporária enquanto a integração via WhatsApp é configurada.

**Fotos do cliente com baixa qualidade:** Publicar com as melhores fotos disponíveis e incluir no plano de ação do próximo ciclo a realização de uma sessão fotográfica básica com celular.

**Meta Pixel não dispara o evento Lead:** Verificar se o código está no `<head>` (não no `<body>`). Verificar se o evento está amarrado ao evento de submit do formulário (não ao carregamento da página). Usar o Pixel Helper para debugar.

**Anúncio reprovado pelo Meta por conteúdo de saúde:** Reescrever o copy evitando: promessas de resultado ("cure", "trate", "resolva"), linguagem de diagnóstico, imagens de procedimentos. Focar em conforto, cuidado e continuidade de acompanhamento.

---

## ROTEIRO DE PROTOCOLO OPERACIONAL

### Etapa 1 — Escolha da plataforma (Dia 8 | 30 min)

**Quem:** CS + Gestor de Tráfego
**O que fazer:**
1. Verificar se o cliente tem WordPress com Elementor Pro ativo
2. Se sim: usar WordPress. Se não: usar Systeme.io
3. Criar os subdomínios ou subpastas para as 3 páginas:
   - `/avaliacao` ou `avaliacao.[dominio].com.br`
   - `/guia` ou `guia.[dominio].com.br`
   - `/particular` ou `particular.[dominio].com.br`
4. Documentar a escolha e os URLs no sistema interno
5. Gestor configura os DNS se necessário (prazo propagação DNS: até 24h)

**Ponto de atenção:** se o domínio estiver em registradora diferente do hosting, pode atrasar. Verificar no Dia 8 para não impactar o prazo de publicação no Dia 14.

---

### Etapa 2 — Produção do copy (Dias 8-10 | Social Media)

**Quem:** Social Media
**O que fazer:**
1. Abrir o briefing do cliente (E01) e a auditoria (E03)
2. Para cada funil, preencher o template de copy:
   - Headline (1 frase — problema ou transformação)
   - Subheadline (1-2 frases — quem é o médico + o que oferece)
   - 4-5 bullets de benefício (começa com verbo: "Descubra...", "Entenda...", "Receba...")
   - Copy de prova social
   - Texto do botão de CTA (5-7 palavras máximo)
3. Salvar o copy em documento compartilhado (Google Docs) com os 3 funis separados
4. Enviar para revisão interna do CS antes de subir para o layout

**Ponto de atenção:** headline é o elemento mais crítico. Nunca usar o nome do médico como headline. A headline deve falar da dor ou do desejo da mãe — não do produto.

---

### Etapa 3 — Criação do layout (Dias 10-12 | Social Media)

**Quem:** Social Media
**O que fazer:**
1. Criar as páginas na plataforma escolhida usando os templates base da Pixel Rain
2. Aplicar a identidade visual do cliente (cores, tipografia, logo)
3. Inserir a foto do médico no bloco de autoridade
4. Para o F2: criar mockup da capa do e-book no Canva e exportar em PNG (2x)
5. Configurar o formulário com os campos corretos por funil
6. Testar o formulário internamente (preencher e submeter)
7. Enviar o link de preview para o Gestor de Tráfego instalar o tracking

**Ponto de atenção:** não publicar as páginas como "live" antes de o tracking estar instalado e testado. Publicar em modo de preview/draft até o Dia 14.

---

### Etapa 4 — Instalação técnica (Dias 10-12 | Gestor de Tráfego)

**Quem:** Gestor de Tráfego
**O que fazer (por página):**
1. Instalar o código do Meta Pixel no `<head>` da página
2. Instalar o código do GA4 no `<head>` da página
3. Configurar o evento `Lead` para disparar no submit do formulário
4. Configurar a integração formulário → WhatsApp Business:
   - Via webhook nativo da plataforma (Systeme.io tem nativo)
   - Via Zapier (se WordPress + Elementor): formulário → Zapier → WhatsApp Business API
5. Testar o fluxo completo: preencher formulário → verificar se chegou no WhatsApp → verificar se o evento Lead disparou no Pixel Helper e no GA4 DebugView
6. Documentar os IDs de Pixel e GA4 usados em cada página

---

### Etapa 5 — Revisão e aprovação do cliente (Dias 12-13 | CS)

**Quem:** CS
**Fala sugerida para envio ao cliente:**
> "Oi [Nome]! As 3 páginas de captação estão prontas para sua revisão. Seguem os links:
> - Avaliação de Desenvolvimento: [link]
> - Guia da Primeira Consulta: [link]
> - Consulta Particular: [link]
>
> Por favor, verifique: textos, sua foto, seus dados de contato. Preciso da sua aprovação até amanhã [data] para mantermos o prazo de lançamento no Dia 14. Se não receber feedback, considerarei aprovado e seguimos com a publicação."

**O que o cliente pode alterar:** textos, fotos, informações da clínica.
**O que não deve alterar:** estrutura da página (não remover o formulário, não adicionar menu).
**Máximo:** 1 rodada de revisão estrutural incluída no processo.

---

### Etapa 6 — Publicação e testes finais (Dia 14 | Gestor + Social Media)

**Quem:** Gestor de Tráfego + Social Media
**Checklist de publicação:**
- [ ] Publicar as 3 páginas (mudar status de draft para published)
- [ ] Testar em Chrome desktop
- [ ] Testar em Safari mobile (iPhone)
- [ ] Testar em Chrome mobile (Android)
- [ ] Preencher formulário de teste em cada página e confirmar chegada no WhatsApp
- [ ] Confirmar eventos no Meta Pixel Helper (evento Lead visível)
- [ ] Confirmar eventos no GA4 DebugView (evento generate_lead visível)
- [ ] Verificar velocidade no PageSpeed Insights — meta: acima de 70 no mobile
- [ ] Registrar os 3 URLs definitivos no sistema interno
- [ ] Enviar os URLs ao time de tráfego (para uso nas campanhas do E08)
- [ ] Comunicar ao CS que as páginas estão no ar

---

### Etapa 7 — Briefing de handoff com a secretária (Dia 15 | CS)

**Quem:** CS
**Duração:** 15-20 minutos (call ou presencial)
**O que cobrir:**
1. Mostrar como vai chegar a notificação de novo lead no WhatsApp Business
2. Demonstrar o formulário preenchido e a mensagem que aparece no painel
3. Ensinar o script de primeiro contato (ver seção "Handoff com a Secretária" acima)
4. Combinar o SLA: resposta em até 1 hora em dias úteis
5. Esclarecer: não responder com tabela de preços direto. Criar conexão primeiro.
6. Deixar o script de primeiro contato salvo como resposta rápida no WhatsApp Business

**Fala de encerramento do briefing:**
> "Toda vez que você ver essa mensagem chegando no WhatsApp, é uma mãe que clicou em um anúncio e pediu informação. Ela está quente — quanto mais rápido você responder, mais chance tem de agendar. Pode contar comigo se tiver dúvida."

---

*Documento de processo interno — Pixel Rain Agency. Versão 2.0 — Maio 2026*
