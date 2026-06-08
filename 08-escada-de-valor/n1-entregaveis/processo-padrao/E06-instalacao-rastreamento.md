# E06 — Instalação de Rastreamento
**N1 — Plano de Atração | Pixel Rain Agency**
**Classificacao:** Processo Operacional Interno

---

## O que e este entregavel

A Instalacao de Rastreamento configura todos os pixels, tags e eventos de conversao necessarios para medir com precisao o retorno de cada acao do N1. Sem rastreamento, nao existe otimizacao — apenas gasto. Com rastreamento correto, o gestor sabe quantos cliques viraram leads, qual criativo gerou mais agendamentos e qual funil tem o menor custo por consulta.

Este entregavel inclui:
- **Meta Pixel** instalado no site e em todas as landing pages
- **Google Analytics 4 (GA4)** configurado com eventos de conversao
- **Estrutura de UTMs** documentada por funil e por canal
- **Dashboard Looker Studio** conectado as fontes de dados com as metricas do N1

O rastreamento deve estar 100% funcional **antes** das campanhas de trafego serem ligadas (E08). Nao existe justificativa para rodar campanhas sem rastreamento. Cada real investido em midia precisa ter destino rastreavel.

---

## Quem executa

| Papel | Responsabilidade |
|---|---|
| Gestor de Trafego | Instalacao de todos os pixels, configuracao de eventos de conversao, criacao das UTMs, criacao do dashboard Looker Studio |
| Social Media | Confirmacao de que todos os links de landing pages e posts organicos tem UTMs corretos |
| CS | Verificacao de que o painel Looker Studio esta operacional antes do relatorio do Dia 28 |

---

## Quando acontece

**Dias 5 a 8 do contrato.** Precede obrigatoriamente a criacao das landing pages (E07) e o lancamento das campanhas (E08). O rastreamento e a fundacao — as campanhas so sobem depois que a fundacao esta verificada.

---

## Insumos necessarios (o que precisa existir antes)

- Acesso ao Meta Business Suite (E02)
- Acesso ao site do cliente, se existir (E02)
- Dominio(s) das landing pages definidos (mesmo que as paginas ainda nao estejam prontas — o pixel pode ser instalado antes)
- Conta Google da clinica (ou e-mail para criacao — nao usar e-mail pessoal do medico)
- Briefing com estrutura dos 3 funis (F1, F2, F3) ja definida

---

## Passo a passo detalhado

### Passo 1 — Verificacao do estado atual de rastreamento (Dia 5)

**Antes de instalar qualquer coisa, verificar o que ja existe.**

**No site (se existir):**
1. Instalar a extensao **Meta Pixel Helper** no Chrome (gratuita, na Chrome Web Store)
2. Acessar o site do cliente com a extensao ativa
3. Clicar no icone do Meta Pixel Helper na barra do Chrome — mostra se ha pixel instalado, qual ID, e se esta disparando
4. Instalar a extensao **Google Tag Assistant** (ou usar a versao legada)
5. Acessar o site — verificar se GA4 ou Universal Analytics esta presente e funcionando

**No Meta Business Suite:**
1. Acessar business.facebook.com > Events Manager
2. Verificar se ja existe um Pixel criado para a conta do cliente
3. Se existir pixel antigo: verificar se tem dados ou se esta inativo. Pixel inativo por mais de 90 dias pode ser reutilizado ou descartado

**No Google Analytics:**
1. Acessar analytics.google.com com o e-mail da clinica
2. Verificar se existe propriedade GA4 criada — ou se so existe Universal Analytics (que foi descontinuado)

Registrar o que foi encontrado antes de qualquer intervencao. Nunca instalar sem verificar primeiro — pixel duplicado causa dados incorretos.

---

### Passo 2 — Criacao e instalacao do Meta Pixel (Dias 5-6)

**Se nao existe pixel ou o existente e inutilizavel:**

1. Acessar **Meta Business Suite > Events Manager**
2. Clicar em **"Criar pixel"** (ou "Conectar fontes de dados" > Web)
3. Nomear o pixel: [Nome da Clinica] - Pixel (ex: "Clinica Pediatra Ana Lima - Pixel")
4. Selecionar metodo de instalacao:

| Metodo | Quando usar |
|---|---|
| Codigo manual | Site personalizado ou quando tem acesso ao HTML |
| Via parceiro (WordPress) | Se o site e WordPress — usar plugin Facebook for WordPress ou PixelYourSite |
| Via parceiro (Wix, Squarespace) | Integrar pelo painel do construtor de sites |
| Via Google Tag Manager | Quando GTM ja esta instalado no site — metodo preferencial |

5. Copiar o ID do Pixel (formato: numeros de 15-16 digitos) — salvar no documento de rastreamento

**Para instalacao via codigo manual no site:**
- Copiar o codigo base do pixel
- Colar no `<head>` de todas as paginas do site (nao no `<body>`)
- Se WordPress: usar plugin ou adicionar via functions.php / header.php

**Para as landing pages (E07):**
Fornecer o ID do Pixel para o criador das landing pages com instrucao: "Instalar o Meta Pixel com o ID [XXXX] no head de cada landing page."

**Verificacao:**
Acessar o site com a extensao Meta Pixel Helper ativa. O icone deve ficar verde com o numero do pixel correto. Verificar na coluna "Status": deve mostrar "Ativo" e "Eventos".

---

### Passo 3 — Configuracao do Google Analytics 4 (Dias 6-7)

**Se o cliente nao tem GA4 (ou tem apenas Universal Analytics antigo):**

1. Acessar **analytics.google.com** com o e-mail da clinica (criar conta Google se necessario)
2. Clicar em **"Criar conta"** ou, se ja existe conta, em **"Criar propriedade"**
3. Configurar a propriedade:
   - Nome: [Nome da Clinica] — Analytics
   - Fuso horario: Brasil / Sao Paulo
   - Moeda: BRL (Real Brasileiro)
4. Selecionar tipo de negocio (mais proximo de "Saude")
5. Criar um **Stream de dados para Web**:
   - URL do site ou das landing pages
   - Nome: "[Clinica] - Web"
6. Obter o **ID de medicao** (formato G-XXXXXXXXXX) — salvar no documento de rastreamento
7. Obter o codigo de instalacao (gtag.js)

**Metodos de instalacao:**
- **Via Google Tag Manager (preferencial):** adicionar a tag GA4 no GTM — mais facil de gerenciar
- **Via codigo direto:** colar o gtag.js no `<head>` do site / landing pages

**Verificacao:**
Acessar o GA4 > Administrador > DebugView. Acessar o site/landing page em outra aba — deve aparecer uma sessao ativa no DebugView em tempo real. Se aparecer: GA4 esta funcionando.

---

### Passo 4 — Configuracao de eventos de conversao (Dia 7)

Este e o passo mais critico. Um evento de conversao e o momento especifico que conta como "lead" para o cliente.

#### Eventos principais para o N1 — Pediatria

| Evento | Descricao | Prioridade |
|---|---|---|
| **Lead** | Formulario preenchido e enviado em qualquer landing page | Principal |
| **Contact** | Clique no botao de WhatsApp ou no numero de telefone | Secundario |
| **PageView** | Visualizacao de qualquer pagina (configurado automaticamente) | Basico |

#### Configuracao do evento Lead no Meta Events Manager

**Metodo 1 — Via codigo (preferencial):**
Adicionar nas landing pages, imediatamente apos o elemento do formulario, o seguinte codigo que dispara quando o usuario submete o formulario:

```javascript
// Disparar apos o submit do formulario
fbq('track', 'Lead', {
  content_name: 'Agendamento Consulta',
  content_category: 'Pediatria'
});
```

Ou, se o formulario redireciona para uma pagina de obrigado (/obrigado ou /thank-you), instalar o pixel nessa pagina com o evento Lead no pageview:

```javascript
fbq('track', 'Lead');
```

**Metodo 2 — Via Conversions API (avancado, configurar no mes 2 se necessario):**
Para maior precisao — conecta eventos do servidor sem depender do navegador do usuario.

**Verificacao:**
1. Acessar a landing page de teste
2. Preencher e enviar o formulario
3. Abrir o Events Manager — em 2-5 minutos deve aparecer o evento "Lead" com os parametros corretos
4. Ou verificar em tempo real com a extensao Meta Pixel Helper: ao enviar o formulario, o icone deve mostrar "Lead" disparado

#### Configuracao do evento Lead no Google Analytics 4

**Metodo 1 — Via GTM:**
1. Criar um trigger de "Form Submission" no GTM
2. Criar uma tag GA4 Event com nome "generate_lead"
3. Associar a tag ao trigger
4. Publicar o container do GTM

**Metodo 2 — Via codigo direto:**
```javascript
// Adicionar apos o submit do formulario
gtag('event', 'generate_lead', {
  'currency': 'BRL',
  'value': 0
});
```

**Marcar como conversao no GA4:**
1. GA4 > Administrador > Conversoes
2. Clicar em "Novo evento de conversao"
3. Inserir o nome do evento: "generate_lead"
4. Salvar

---

### Passo 5 — Estrutura de UTMs por funil e por canal (Dia 7)

UTMs sao parametros adicionados a URLs de links de anuncios que identificam a origem exata de cada lead. Sem UTM, o relatorio mostra "visita" — com UTM, mostra "lead do anuncio X do funil F1 no Meta".

#### Estrutura padrao de UTMs — Pixel Rain Agency

| Parametro | Valores padrao | Descricao |
|---|---|---|
| **utm_source** | `facebook`, `instagram`, `google`, `organic` | Plataforma de origem |
| **utm_medium** | `cpc`, `paid_social`, `organic`, `email` | Tipo de midia |
| **utm_campaign** | `f1-novos-pacientes`, `f2-reativacao`, `f3-sazonalidade` | Funil e nome da campanha |
| **utm_content** | identificador do criativo (ex: `foto-dra-consultorio`, `video-depoimento`) | Qual criativo especifico |
| **utm_term** | palavra-chave (apenas para Google Search) | Qual busca acionou o anuncio |

#### Estrutura por funil

**Funil F1 — Captacao de Novos Pacientes (topo de funil)**
Objetivo: atrair maes que ainda nao conhecem o medico
Canal principal: Meta Ads (Instagram e Facebook)

Exemplos de UTMs:
```
utm_source=facebook&utm_medium=paid_social&utm_campaign=f1-novos-pacientes&utm_content=foto-dra-consultorio
utm_source=instagram&utm_medium=paid_social&utm_campaign=f1-novos-pacientes&utm_content=video-sala-espera
```

**Funil F2 — Reativacao / Remarketing (meio de funil)**
Objetivo: alcançar pessoas que ja visitaram a pagina mas nao agendaram
Canal principal: Meta Ads (remarketing) + Google Display

Exemplos de UTMs:
```
utm_source=facebook&utm_medium=paid_social&utm_campaign=f2-remarketing&utm_content=texto-desconto-primeira-consulta
utm_source=google&utm_medium=cpc&utm_campaign=f2-remarketing&utm_content=display-banner-clinica
```

**Funil F3 — Busca Ativa (fundo de funil)**
Objetivo: capturar quem ja esta buscando ativamente
Canal principal: Google Search Ads

Exemplos de UTMs:
```
utm_source=google&utm_medium=cpc&utm_campaign=f3-busca&utm_term=pediatra+campinas+particular
utm_source=google&utm_medium=cpc&utm_campaign=f3-busca&utm_term=puericultura+vila+olimpia
```

#### Documento de UTMs (Google Sheets)

Criar e manter um documento Google Sheets com todas as UTMs geradas para o cliente. Estrutura do documento:

| Campanha | Funil | Canal | Criativo | URL base | URL completa com UTM |
|---|---|---|---|---|---|
| Novos Pacientes - Foto Dra | F1 | Facebook | foto-dra-consultorio | landing-page.com/f1 | landing-page.com/f1?utm_source=... |

**Regra inviolavel:** Nunca subir link de anuncio sem UTM. Nenhuma excecao.

---

### Passo 6 — Dashboard Looker Studio (Dia 8)

O dashboard do Looker Studio e o painel de acompanhamento de metricas do cliente — o que o CS usa nos relatorios mensais e o que o cliente pode acessar a qualquer momento.

#### Metricas que devem estar no dashboard do N1

| Metrica | Fonte de dados | Descricao |
|---|---|---|
| **Leads por canal** | GA4 + Meta Ads | Quantos leads chegaram de cada plataforma |
| **CPL (Custo por Lead)** | Meta Ads + Google Ads | Quanto custou cada lead por canal |
| **CPA (Custo por Agendamento)** | Dado manual (secretaria informa) | Quanto custou cada consulta agendada |
| **Gasto total do mes** | Meta Ads + Google Ads | Verba investida no periodo |
| **Leads acumulados no mes** | GA4 | Total de leads do mes |
| **Sessoes nas landing pages** | GA4 | Quantas visitas cada landing page recebeu |
| **Taxa de conversao** | GA4 | Percentual de visitas que viraram leads |
| **Posts com maior alcance** | Meta Business Suite | Top 3 conteudos organicos do periodo |

#### Como conectar as fontes de dados no Looker Studio

**Acesse:** lookerstudio.google.com > Criar > Relatorio

**Conectar Google Analytics 4:**
1. Clicar em "Adicionar dados" > Google Analytics
2. Fazer login com a conta Google do cliente
3. Selecionar a propriedade GA4 criada no Passo 3
4. Confirmar

**Conectar Meta Ads (via conector intermediario):**
Opcao 1: Usar o conector nativo do Looker Studio para Facebook Ads (disponivel em "Parceiros")
Opcao 2: Exportar dados do Meta Ads para um Google Sheets e conectar o Sheets ao Looker Studio (metodo mais simples para inicio)

**Conectar Google Ads:**
1. Clicar em "Adicionar dados" > Google Ads
2. Fazer login com a conta Google do cliente
3. Selecionar a conta do Google Ads da clinica
4. Confirmar

#### Layout basico do dashboard

**Pagina 1 — Resumo Executivo**
- Numero total de leads no mes (numero grande em destaque)
- CPL medio do mes (numero em destaque)
- Gasto total da verba (numero em destaque)
- Taxa de conversao das landing pages (%)
- Grafico de linha: leads por semana (tendencia)

**Pagina 2 — Por Canal**
- Tabela: canal / leads / CPL / gasto
- Grafico de pizza: distribuicao de leads por canal
- Destaque: canal com melhor CPL

**Pagina 3 — Landing Pages**
- Sessoes por landing page
- Taxa de conversao por landing page
- Comparativo F1 vs F2 vs F3

> **Ponto de atencao:** O dashboard deve ser simples e legivel para quem nao e especialista em marketing. Priorize metricas que respondem a pergunta do cliente: "Quantos novos pacientes vieram do marketing este mes e quanto custou?"

**Compartilhar o link do dashboard:**
- Com o CS (para os relatorios mensais)
- Com o cliente (acesso somente leitura — para ele acompanhar quando quiser)

---

### Passo 7 — Teste final de rastreamento (Dia 8)

Executar o teste completo ANTES de liberar para as campanhas.

**Checklist de teste:**

- [ ] Acessar cada landing page com UTM no link
- [ ] Preencher e submeter o formulario de teste
- [ ] Meta Events Manager: o evento "Lead" apareceu? Tem os parametros corretos?
- [ ] GA4 DebugView: o evento de conversao esta registrado?
- [ ] Verificar no Looker Studio: o dado de sessao aparece?
- [ ] Clicar no botao de WhatsApp (se existir nas landing pages): evento "Contact" disparou?
- [ ] Acessar com um link sem UTM: verificar se a sessao aparece como "direct" (confirma que as UTMs funcionam quando presentes)

**Resultado esperado de cada teste:**

| Acao | O que deve aparecer |
|---|---|
| Acessar landing page com UTM | Sessao registrada no GA4 com a UTM correta |
| Submeter formulario | Evento "Lead" no Events Manager + evento "generate_lead" no GA4 |
| Clicar no WhatsApp | Evento "Contact" ou "InitiateCheckout" (configurar conforme o setup) |
| Verificar Looker Studio | Sessao do teste aparece nas metricas em ate 24h |

**Nao subir campanhas sem todos os testes aprovados.**

---

## Documento de Rastreamento (Google Sheets)

Criar e salvar na pasta do cliente no Drive o documento "Rastreamento — [Nome da Clinica]" com as seguintes abas:

**Aba 1 — IDs e Propriedades**

| Item | ID / URL | Conta associada |
|---|---|---|
| Meta Pixel ID | | |
| GA4 Property ID | | |
| GA4 Stream ID | | |
| Google Tag Manager ID (se aplicavel) | | |
| Looker Studio Dashboard URL | | |

**Aba 2 — UTMs**
Tabela completa de todas as UTMs geradas (ver estrutura no Passo 5).

**Aba 3 — Log de Testes**
Data do teste, item testado, resultado (OK/Falha), correcao aplicada.

---

## Ferramentas utilizadas

| Ferramenta | Para que |
|---|---|
| Meta Business Suite / Events Manager | Criacao e configuracao do Meta Pixel |
| Meta Pixel Helper (extensao Chrome) | Verificacao de instalacao e disparo do pixel |
| Google Analytics 4 | Rastreamento de visitas e conversoes |
| Google Tag Manager | Instalacao centralizada de tags (quando aplicavel) |
| Google Tag Assistant (extensao Chrome) | Verificacao de instalacao do GA4 |
| Google Looker Studio | Dashboard de acompanhamento de metricas |
| Google Sheets | Documento de UTMs e registro de IDs |

---

## Padrao de qualidade (como saber se esta bom)

- [ ] Meta Pixel instalado e disparando corretamente em todas as landing pages
- [ ] GA4 instalado e capturando pageviews
- [ ] Evento "Lead" configurado e testado (dispara no submit do formulario)
- [ ] Evento "Contact" configurado (clique no WhatsApp)
- [ ] Estrutura de UTMs documentada no Google Sheets para F1, F2 e F3
- [ ] Dashboard Looker Studio criado, conectado as fontes de dados e compartilhado
- [ ] Documento de rastreamento salvo no Drive do cliente
- [ ] Teste completo realizado e aprovado antes do lancamento das campanhas
- [ ] **Nenhuma campanha ligada sem rastreamento confirmado**

---

## Entregavel final

Documentacao tecnica de rastreamento: IDs dos pixels/propriedades, estrutura de UTMs, link do dashboard Looker Studio. Tudo registrado no sistema interno e na pasta do cliente no Google Drive.

## Prazo maximo

**Instalacao completa ate o Dia 8.** Precede obrigatoriamente o lancamento das campanhas (E08, Dias 12-14).

---

## O que fazer se travar

| Situacao | Acao |
|---|---|
| Nao tem acesso ao site para instalar o pixel | Priorizar instalacao nas landing pages do E07. O site do cliente pode ser descartado temporariamente se for muito antigo ou inacessivel |
| Meta Pixel instalado mas nao esta disparando | Verificar se o codigo esta no `<head>` (nao no `<body>`). Verificar plugin de cache (pode estar servindo versao antiga). Verificar se nao ha bloqueador de anuncios ativo — testar em aba anonima sem extensoes |
| GA4 nao esta registrando conversoes | Usar o DebugView com modo debug ativado. Confirmar que o evento esta marcado como conversao nas configuracoes do GA4. Aguardar ate 24h para dados consolidados (nao tempo real) |
| Cliente nao tem conta Google para o GA4 | Criar conta Google para a clinica com e-mail profissional (ex: contato@clinicax.com.br). Nunca usar conta pessoal do medico para propriedades de negocio |
| Looker Studio nao conecta com Meta Ads | Usar o metodo alternativo: exportar dados do Meta Ads para Google Sheets (manualmente ou via Supermetrics) e conectar o Sheets ao Looker Studio |
| Formulario nao dispara o evento Lead | Verificar se o formulario usa JavaScript padrao. Se usar redirect para pagina de obrigado, instalar o pixel com evento Lead diretamente na pagina /obrigado — metodo mais confiavel |

---

## ROTEIRO DE PROTOCOLO OPERACIONAL

> Este roteiro e um guia tecnico passo a passo para instalar o rastreamento completo do zero. Execute na ordem indicada — cada etapa depende da anterior.

---

### Etapa 1 — Auditoria do rastreamento existente (Dia 5, manha)

**Tempo: 30 minutos**

1. Instale as extensoes no Chrome (se nao tiver): Meta Pixel Helper + Google Tag Assistant
2. Acesse o site do cliente com as extensoes ativas
3. Clique no icone do Meta Pixel Helper — o que aparece?
   - Verde com numero: pixel instalado e ativo. Anote o ID.
   - Vermelho ou cinza: pixel nao encontrado ou com erro
   - Nenhum dado: nao ha pixel
4. Clique no icone do Google Tag Assistant — o que aparece?
   - GA4 listado: anote o ID (G-XXXXXXXXXX)
   - Nenhum dado: nao ha GA4
5. Acesse o Meta Business Suite com a conta do cliente > Events Manager
   - Ha pixel na conta? Qual o ID? Tem dados nos ultimos 30 dias?
6. Registre tudo no documento de rastreamento (Google Sheets)

---

### Etapa 2 — Criacao do Meta Pixel (Dia 5, tarde)

**Tempo: 30 a 45 minutos (depende do metodo de instalacao)**

1. No Events Manager, clique em "Criar pixel" (ou "Adicionar nova fonte de dados")
2. Nomeie e salve o ID — copie para o documento de rastreamento
3. Escolha o metodo de instalacao:
   - **Google Tag Manager:** adicione a tag do Meta Pixel no GTM, publique o container
   - **WordPress:** instale o plugin "Facebook for WordPress" ou "PixelYourSite", insira o ID do pixel
   - **Codigo manual:** copie o codigo base e cole no `<head>` do site/landing pages
4. Apos instalar, acesse o site com o Meta Pixel Helper — deve ficar verde
5. Tambem acesse o Events Manager > Overview — deve aparecer "Ativo" com pageviews

---

### Etapa 3 — Criacao e configuracao do GA4 (Dias 6-7)

**Tempo: 45 a 60 minutos**

1. Acesse analytics.google.com com o e-mail da clinica
2. Criar nova conta e propriedade GA4 (se nao existir) — configurar fuso horario e moeda BRL
3. Criar Stream de dados Web com o dominio do site/landing pages
4. Copiar o ID de medicao (G-XXXXXXXXXX) para o documento de rastreamento
5. Instalar via GTM (adicionar tag GA4) ou via codigo no `<head>`
6. Abrir o GA4 > DebugView e acessar o site em outra aba — deve aparecer a sessao em tempo real
7. Configurar o evento "generate_lead" como conversao:
   - GA4 > Administrador > Conversoes > Novo evento de conversao > "generate_lead"

---

### Etapa 4 — Instalacao e teste dos eventos de conversao (Dia 7)

**Tempo: 60 a 90 minutos**

Este e o momento mais critico. Reserve tempo suficiente.

**Para o Meta Pixel — evento Lead:**
1. Abra a landing page de teste em uma aba
2. Abra o Meta Pixel Helper em outra janela
3. Preencha e submeta o formulario
4. Verifique o Meta Pixel Helper — deve mostrar "Lead" disparado
5. Verifique no Events Manager > Test Events — deve aparecer "Lead" com os parametros

Se o evento nao disparar: verificar onde o codigo do evento esta posicionado no HTML. O disparo deve acontecer APOS o submit, nao antes.

**Para o GA4 — evento generate_lead:**
1. Ative o modo debug no GA4 (DebugView)
2. Acesse a landing page e submeta o formulario
3. No DebugView: deve aparecer o evento "generate_lead"
4. Verifique se esta marcado como conversao (icone de bandeira ao lado do evento)

---

### Etapa 5 — Criacao do documento de UTMs (Dia 7, tarde)

**Tempo: 30 minutos**

1. Abra o Google Sheets e crie o documento "UTMs — [Nome da Clinica]"
2. Monte a tabela conforme a estrutura desta secao
3. Crie as UTMs para as campanhas do primeiro mes:
   - F1 no Meta: pelo menos 2 UTMs (para 2 criativos diferentes)
   - F3 no Google Search: pelo menos 3 UTMs (para 3 grupos de palavras-chave)
4. Use o Google Campaign URL Builder (ga-dev-tools.google.com/campaign-url-builder) para gerar as URLs com UTM sem erro
5. Salve e compartilhe o documento com o Gestor de Trafego e o CS

---

### Etapa 6 — Criacao do dashboard Looker Studio (Dia 8)

**Tempo: 90 a 120 minutos para o setup inicial**

1. Acesse lookerstudio.google.com > Criar > Relatorio
2. Conectar GA4: "Adicionar dados" > Google Analytics > selecionar a propriedade criada
3. Conectar Google Ads (se ja tiver a conta criada): "Adicionar dados" > Google Ads
4. Para Meta Ads: usar Google Sheets como intermediario (exportar metricas principais manualmente no inicio)
5. Montar as 3 paginas do dashboard conforme o layout desta secao
6. Ajustar o periodo padrao para os ultimos 30 dias
7. Salvar e publicar
8. Copiar o link de compartilhamento (leitura) e enviar para o CS + para o cliente

**Ponto de atencao:** O dashboard fica com dados zerados no primeiro mes — isso e normal. O importante e que a estrutura esteja criada e funcionando. A medida que as campanhas sobem, os dados aparecem automaticamente.

---

### Etapa 7 — Teste final e liberacao para campanhas (Dia 8, fim do dia)

**Tempo: 30 a 45 minutos**

Execute o checklist de teste desta secao (Passo 7) item por item. Registre o resultado de cada teste no documento de rastreamento (Aba "Log de Testes").

So apos todos os itens com "OK": comunicar ao Gestor de Trafego que o rastreamento esta aprovado e as campanhas podem subir quando as landing pages estiverem prontas (E07).

Se algum item falhar: corrigir antes de comunicar a liberacao. Nao existe "subir as campanhas e ver se o rastreamento funciona" — o rastreamento precisa funcionar antes.

---

*Documento de processo interno — Pixel Rain Agency. Versao 2.0 — Maio 2026*
