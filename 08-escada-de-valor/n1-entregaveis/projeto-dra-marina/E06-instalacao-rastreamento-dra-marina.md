# E06 — Instalação Técnica de Rastreamento — Dra. Marina Albuquerque
**N1 — Fase de Atração | Pixel Rain Agency**
**Cliente:** Instituto Infantil Aurora | Campinas/SP
**Classificação:** Processo Aplicado — Cliente Ativo

---

## Contexto do cliente neste entregável

O Instituto Infantil Aurora, com alta probabilidade, não tem nenhum pixel ou ferramenta de rastreamento instalada. O site (se existir) quase certamente não tem Meta Pixel nem Google Analytics 4 — sites de clínicas criados antes de 2022 raramente têm rastreamento configurado. Isso significa que a operação de tráfego pago do N1 começa do zero em termos de dados: sem histórico de conversões para o Meta Ads otimizar, sem audiência de remarketing, sem dados de comportamento.

Essa situação é comum e não é bloqueadora — apenas significa que o primeiro mês de campanhas vai gerar dados brutos, sem otimização automática baseada em histórico. O gestor de tráfego precisará monitorar manualmente as primeiras 2 semanas. A instalação correta e o teste rigoroso do rastreamento **antes** de ligar as campanhas é ainda mais crítica neste cliente.

**Importante:** o rastreamento deve ser instalado primariamente nas landing pages criadas no E07 — não no site. As LPs são os destinos de conversão reais do N1.

---

## Verificação do estado atual de rastreamento

**Site institutoinfantilaurora.com.br:**
- Verificar existência e estado
- Se encontrar: usar Meta Pixel Helper e Google Tag Assistant para verificar pixels instalados
- Hipótese: nenhum pixel, nenhum GA4
- Se o site for de 2020 ou anterior sem manutenção: não instalar rastreamento no site — focar nas landing pages

**Instagram @institutoinfantilaurora:**
- Verificar no Meta Business Manager / Events Manager se há algum pixel associado à conta de anúncios
- Hipótese: nenhum pixel existente (conta de anúncios provavelmente nem existe ainda)

**Google Business:**
- Não há rastreamento a instalar no Google Business
- UTMs serão inseridas nos links que saem do perfil (botão "Site", CTA dos posts)

---

## Meta Pixel — Instituto Infantil Aurora

### Criação

1. Acessar Meta Business Suite > Events Manager > Criar nova fonte de dados > Pixel da Meta
2. **Nome:** `Instituto Infantil Aurora — Pixel N1`
3. Método de instalação: código manual (para inserção nas landing pages)
4. Obter o ID do Pixel e o código base
5. Fornecer ao responsável pelas LPs (E07): ID do Pixel + instruções de instalação no `<head>` de cada página

**Não instalar no site do Instituto** se existir e for de 2020 sem manutenção — o esforço de acessar um site antigo pode atrasar o processo sem benefício real para o N1.

### Evento de conversão "Lead"

Este é o evento mais crítico para o N1. Definição: o evento "Lead" dispara quando uma mãe preenche e submete o formulário em qualquer uma das 3 landing pages.

- Nome do evento: `Lead` (nome padrão da Meta para melhor otimização automática)
- Parâmetro `content_name`: identificar o funil de origem
  - F1: `f1_avaliacao`
  - F2: `f2_guia`
  - F3: `f3_migracao`

**Evento secundário — Clique no WhatsApp:**
Se as LPs tiverem botão "Agendar pelo WhatsApp", configurar clique como conversão secundária. Captura leads que preferem contato direto ao formulário — padrão comum em clínicas médicas.

### Teste do Meta Pixel

- Instalar extensão Meta Pixel Helper no Chrome
- Acessar cada LP e preencher formulário de teste
- Verificar que o evento "Lead" aparece como "Ativo" no Events Manager
- Aguardar confirmação antes de ligar qualquer campanha

---

## Google Analytics 4 — Instituto Infantil Aurora

### Criação da propriedade

1. Acessar analytics.google.com com e-mail da agência (ou criar e-mail profissional da clínica)
2. **Nome da propriedade:** `Instituto Infantil Aurora — GA4 N1`
3. Configurar: fuso horário America/Sao_Paulo, moeda BRL
4. Criar stream de dados Web: usar o domínio das landing pages
5. Obter o código de rastreamento (gtag.js ou ID de medição G-XXXXXXXXXX)
6. Fornecer ao responsável pelas LPs para instalação no `<head>`

**Conta Google recomendada:** criar ou usar e-mail profissional da clínica (contato@institutoinfantilaurora.com.br). Não usar conta pessoal da Dra. Marina nem conta genérica da agência para propriedades de clientes.

### Configuração de conversão no GA4

- Admin > Conversões > Marcar evento `generate_lead` como conversão
- Verificar no DebugView após o teste de submissão do formulário
- Confirmar que a conversão aparece na visualização de tempo real

---

## Estrutura de UTMs — Instituto Infantil Aurora

Toda campanha, todo anúncio e todo link externo deve ter UTMs. Nenhum anúncio é criado sem UTM.

### Estrutura por funil (Meta Ads)

**Funil 1 — Avaliação de Desenvolvimento:**
```
utm_source=meta
utm_medium=paid
utm_campaign=F1-avaliacao
utm_content={variável do criativo}
```

**Funil 2 — Guia da Primeira Consulta:**
```
utm_source=meta
utm_medium=paid
utm_campaign=F2-guia
utm_content={variável do criativo}
```

**Funil 3 — Migração de Convênio para Particular:**
```
utm_source=meta
utm_medium=paid
utm_campaign=F3-migracao
utm_content={variável do criativo}
```

### Google Ads

```
utm_source=google
utm_medium=cpc
utm_campaign=[nome da campanha]
utm_content={variável do grupo de anúncio}
```

### Links do Google Business

```
utm_source=google_business
utm_medium=organic
utm_campaign=perfil-gmb
```

### Exemplos de links completos

**F1 via Meta — foto da Dra. Marina:**
```
https://[dominio-lp]/avaliacao?utm_source=meta&utm_medium=paid&utm_campaign=F1-avaliacao&utm_content=foto-dra-marina-consultorio
```

**F2 via Meta — vídeo depoimento:**
```
https://[dominio-lp]/guia?utm_source=meta&utm_medium=paid&utm_campaign=F2-guia&utm_content=video-depoimento
```

**F3 via Google Ads:**
```
https://[dominio-lp]/particular?utm_source=google&utm_medium=cpc&utm_campaign=F3-migracao&utm_content=pesquisa-pediatra-cambuí
```

### Documentação dos UTMs

**Criar planilha no Google Sheets** na pasta do cliente com a estrutura:

| Funil | Canal | URL completa | utm_campaign | utm_content | Status |
|---|---|---|---|---|---|
| F1 | Meta | [URL] | F1-avaliacao | foto-dra-marina | A criar |
| F1 | Meta | [URL] | F1-avaliacao | texto-desenvolvimento | A criar |
| F2 | Meta | [URL] | F2-guia | [variável] | A criar |
| F3 | Meta | [URL] | F3-migracao | [variável] | A criar |
| F3 | Google | [URL] | F3-migracao | pesquisa-pediatra | A criar |

Preencher todos os links antes do lançamento das campanhas (E08). Gestor de tráfego usa esses links ao criar os anúncios — nunca criar anúncio com link sem UTM.

---

## Distribuição da verba de tráfego

**Verba total:** R$1.500/mês

| Canal | Valor/mês | Valor/dia | Meta de CPL |
|---|---|---|---|
| Meta Ads (Facebook + Instagram) | R$1.200 | R$40/dia | Abaixo de R$25 |
| Google Ads | R$300 | R$10/dia | Abaixo de R$35 |

**CPL de alerta:** acima de R$40 por mais de 5 dias consecutivos no Meta → revisar criativos e segmentação antes de pausar campanha.

**Com R$40/dia no Meta distribuído entre 3 funis:** cada funil recebe aproximadamente R$13/dia nas primeiras semanas. O gestor de tráfego vai ajustar a distribuição conforme os dados dos primeiros 10 dias — concentrando verba no funil com menor CPL.

---

## Dashboard Looker Studio — Instituto Infantil Aurora

**Nome:** `Instituto Infantil Aurora — Painel N1`

### Métricas do painel

| Métrica | Fonte de dados | Visualização |
|---|---|---|
| Leads por funil (F1, F2, F3) | GA4 / Meta Ads | Gráfico de barras por semana |
| CPL por funil | Meta Ads + Google Ads | Comparativo numérico com meta |
| CPL Meta vs. CPL Google | Ambas | Comparativo direto (meta: R$25 e R$35) |
| Gasto total do mês (Meta + Google) | Ambas | Número com barra de progresso |
| Leads acumulados no mês | GA4 | Número + meta do mês (35-50 leads) |
| Taxa de conversão por LP | GA4 | Percentual por funil |
| Sessões por semana (LPs) | GA4 | Linha temporal |
| Avaliações Google Business | Manual (Claudinha atualiza) | Número simples |
| Consultas particulares agendadas | Manual (Claudinha atualiza) | Número simples |

### Metas visuais no painel

- CPL Meta: indicador verde abaixo de R$25 / amarelo R$25-R$35 / vermelho acima de R$35
- CPL Google: indicador verde abaixo de R$35 / amarelo R$35-R$50 / vermelho acima de R$50
- Leads mês 1: meta de 35 a 50 leads

### Como compartilhar o painel com a Dra. Marina

- Link de visualização pública (sem necessidade de login no Google)
- Enviar o link por WhatsApp após a primeira reunião mensal
- Acompanhamento verbal: "Dra. Marina, aqui está o painel que mostra os resultados em tempo real. O link funciona pelo celular, sem precisar de senha."
- **Não** exigir que ela crie conta no Google ou no Looker Studio para acessar
- Revisar o painel antes de cada reunião mensal para garantir que os dados estão atualizados e sem erro

---

## Checklist de aprovação — Pré-campanhas

Nenhuma campanha é ligada antes de este checklist estar 100% concluído.

- [ ] Meta Pixel "Instituto Infantil Aurora — Pixel N1" instalado nas 3 landing pages
- [ ] Meta Pixel disparando evento "Lead" no submit de cada formulário (verificado com Pixel Helper)
- [ ] GA4 "Instituto Infantil Aurora — GA4 N1" instalado nas 3 LPs
- [ ] GA4 capturando pageviews em cada LP (verificado no DebugView)
- [ ] Evento `generate_lead` marcado como conversão no GA4
- [ ] Links com UTMs corretos para todas as campanhas Meta (F1, F2, F3)
- [ ] Links com UTMs corretos para campanhas Google
- [ ] Planilha de UTMs completa e salva na pasta do cliente
- [ ] Dashboard Looker Studio criado e compartilhado com a Dra. Marina
- [ ] CS revisou o painel — está apresentável e com os dados corretos

---

## Dados canônicos do cliente

- **Nome do Pixel:** Instituto Infantil Aurora — Pixel N1
- **Nome da propriedade GA4:** Instituto Infantil Aurora — GA4 N1
- **Nome do painel Looker Studio:** Instituto Infantil Aurora — Painel N1
- **Funis:** F1 (Avaliação Desenvolvimento), F2 (Guia Primeira Consulta), F3 (Migração Convênio)
- **Verba Meta Ads:** R$1.200/mês (R$40/dia)
- **Verba Google Ads:** R$300/mês (R$10/dia)
- **CPL alvo Meta:** abaixo de R$25
- **CPL alvo Google:** abaixo de R$35
- **Meta de leads Mês 1:** 35 a 50 leads

---

## Atenções e alertas para este cliente

- **Sem histórico de pixel:** o Meta Ads precisa de pelo menos 50 eventos de "Lead" para iniciar a otimização automática. Nos primeiros 7-10 dias, monitoramento manual é essencial. Não alterar segmentação ou criativos antes de 5 dias de dados — deixar o algoritmo aprender.
- **Verba dividida em 3 funis:** R$40/dia distribuído em 3 funis = ~R$13/funil/dia. Os dados chegam mais lentamente. Se o CPL do F3 for muito alto após 10 dias, considerar pausar temporariamente e concentrar verba no F1 e F2.
- **A Dra. Marina pode pedir para ver o painel a qualquer momento:** o Looker Studio deve estar sempre em estado apresentável. CS revisa antes de cada reunião e antes de qualquer interação em que o painel seja mencionado.
- **A Dra. Marina não tem background técnico em marketing:** o painel deve usar linguagem que ela entende. "Leads" pode ser substituído por "contatos recebidos" ou "mães interessadas" no contexto da apresentação verbal (mantendo o termo técnico no painel para rastreamento interno).
- **Dados manuais da Claudinha:** as métricas de avaliações Google e consultas agendadas dependem de input manual. Incluir na rotina semanal da Claudinha o preenchimento dessas informações (não mais de 5 minutos por semana).

---

## Resultado esperado para este cliente

Meta Pixel e GA4 instalados e funcionando nas 3 landing pages. Evento "Lead" configurado e testado em cada LP. Estrutura de UTMs documentada para as 3 campanhas Meta e as campanhas Google. Planilha de UTMs completa na pasta do cliente. Dashboard Looker Studio criado, apresentável e compartilhado com a Dra. Marina. Checklist de aprovação 100% concluído antes do lançamento das campanhas.

---

## ROTEIRO DE PROTOCOLO OPERACIONAL — Instalação de Rastreamento para o Instituto Infantil Aurora

Passo a passo para o gestor de tráfego. Seguir em ordem — cada etapa depende da anterior.

**Pré-requisito:** landing pages do E07 existentes (ou pelo menos os domínios/subdomínios definidos) para criar os streams de dados GA4 e os links UTM.

**Etapa 1 — Criação do Meta Pixel (Dia 8)**
- [ ] Acessar Meta Business Manager > Events Manager
- [ ] Criar pixel: nome "Instituto Infantil Aurora — Pixel N1"
- [ ] Copiar o ID do pixel e o código base
- [ ] Enviar ao responsável pelas LPs com instruções: inserir no `<head>` de cada LP antes do fechamento `</head>`
- [ ] Aguardar instalação antes de continuar

**Etapa 2 — Criação do GA4 (Dia 8)**
- [ ] Acessar analytics.google.com
- [ ] Criar propriedade: "Instituto Infantil Aurora — GA4 N1" (fuso America/Sao_Paulo, moeda BRL)
- [ ] Criar stream de dados Web com o domínio das LPs
- [ ] Copiar o ID de medição (G-XXXXXXXXXX)
- [ ] Enviar ao responsável pelas LPs com instruções de instalação
- [ ] Configurar `generate_lead` como conversão: Admin > Eventos > Conversões

**Etapa 3 — Teste de rastreamento (após instalação nas LPs)**
- [ ] Instalar Meta Pixel Helper e Google Tag Assistant no Chrome
- [ ] Acessar LP do F1 em janela anônima — verificar Pixel ativo e GA4 ativo
- [ ] Preencher formulário de teste no F1 — verificar evento "Lead" no Events Manager e no GA4 DebugView
- [ ] Repetir para LP do F2
- [ ] Repetir para LP do F3
- [ ] Registrar confirmação de cada teste

**Etapa 4 — Estrutura de UTMs (Dia 9-10)**
- [ ] Criar planilha de UTMs no Google Sheets na pasta do cliente
- [ ] Criar todos os links UTM para as campanhas Meta (F1, F2, F3) com as variáveis de criativo planejadas
- [ ] Criar links UTM para as campanhas Google
- [ ] Testar 1 link UTM de cada campanha — verificar no GA4 DebugView que a fonte e o medium chegam corretos
- [ ] Compartilhar planilha de UTMs com o gestor de tráfego e com o CS

**Etapa 5 — Dashboard Looker Studio (Dia 10-11)**
- [ ] Criar dashboard: "Instituto Infantil Aurora — Painel N1"
- [ ] Conectar fontes: GA4 + Meta Ads + Google Ads
- [ ] Configurar os indicadores de meta (verde/amarelo/vermelho para CPL)
- [ ] Adicionar seção de dados manuais (avaliações Google, consultas agendadas)
- [ ] Gerar link de compartilhamento público (sem login obrigatório)
- [ ] Testar o link em janela anônima — verificar que abre sem pedido de login
- [ ] Compartilhar o link com a Dra. Marina via WhatsApp após a reunião da semana 2

**Etapa 6 — Checklist final (Dia 12, antes do lançamento das campanhas)**
- [ ] Executar todos os itens do checklist de aprovação
- [ ] Confirmar com o gestor de tráfego: "Pode ligar as campanhas"
- [ ] Documentar data e hora do início das campanhas na pasta do cliente

**Atenção para o primeiro relatório (E11 — Dia 30):**
- Fazer print do painel Looker Studio no Dia 1 das campanhas (estado inicial)
- Fazer print do painel no Dia 30 (estado final para comparação)
- Documentar CPL real obtido vs. CPL alvo para o relatório de 30 dias

---
*Documento de processo aplicado — Pixel Rain Agency. Cliente: Instituto Infantil Aurora. Versão 2.0 — Maio 2026*
