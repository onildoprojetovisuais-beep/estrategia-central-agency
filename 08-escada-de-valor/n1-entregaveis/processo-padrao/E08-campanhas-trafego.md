# E08 — Campanhas de Tráfego Pago
**N1 — Fase de Atração | Pixel Rain Agency**
**Classificação:** Processo Operacional Interno
**Entrega:** Dias 12-14 do contrato (lançamento). Gestão contínua até o fim do N1.

---

## O que é este entregável

A configuração e gestão das campanhas pagas é o motor de captação ativa do N1. É o que transforma as landing pages do E07 em máquinas de geração de leads. Sem tráfego pago, as páginas ficam no ar sem visitas. Com tráfego pago bem configurado, leads chegam diariamente no WhatsApp da secretária.

O tráfego orgânico de um perfil com poucos seguidores e histórico inconsistente não é suficiente para atingir o KPI de +40% de consultas particulares em 4 meses. O tráfego pago resolve isso: alcance controlado, segmentação precisa por geolocalização e perfil demográfico, dados diários de CPL e CTR para otimização contínua.

**Verba mensal de tráfego (separada do ticket da agência):**

| Plataforma | Orçamento diário | Orçamento mensal |
|---|---|---|
| Meta Ads (Facebook + Instagram) | R$40/dia | R$1.200/mês |
| Google Ads (Search) | R$10/dia | R$300/mês |
| **Total** | **R$50/dia** | **R$1.500/mês** |

> A verba de tráfego é paga diretamente pelo cliente nas plataformas (cartão do cliente). Não passa pela Pixel Rain.

---

## KPIs das Campanhas

| Métrica | Meta | Plataforma |
|---|---|---|
| CPL (Custo por Lead) | Abaixo de R$25 | Meta Ads |
| CPL (Custo por Lead) | Abaixo de R$35 | Google Ads |
| CTR (Click-Through Rate) | Acima de 1,5% | Meta Ads |
| CTR | Acima de 3% | Google Ads |
| Leads totais/mês | Mínimo 60 (média dos 4 meses) | Todos os canais |

---

## Quem executa

| Papel | Responsabilidade |
|---|---|
| Gestor de Tráfego | Configuração, lançamento, monitoramento diário, otimização semanal |
| Social Media | Criação dos criativos (imagens + copy dos anúncios) |
| CS | Comunicação com o cliente sobre performance, prestação de contas no relatório |

---

## Quando acontece

**Lançamento:** Dias 12-14 do contrato.
**Pré-requisitos obrigatórios:** landing pages publicadas (E07) e rastreamento instalado e testado (E06).
**Gestão contínua:** diária (monitoramento) + semanal (otimização) + mensal (relatório).

---

## Insumos necessários

- 3 landing pages publicadas e com formulários funcionando (E07)
- Meta Pixel e GA4 instalados e testados (E06)
- UTMs padronizadas documentadas (E06)
- Conta no Meta Business Suite configurada com pixel associado
- Conta Google Ads criada (ou acesso concedido pelo cliente)
- Mínimo 2 criativos por funil (imagem + copy) prontos para upload
- Verba mensal confirmada com o cliente

---

## Estrutura Completa das Campanhas Meta Ads

### Convenção de nomenclatura — Meta Ads

```
Campanha:  PR_[CLIENTE]_N1_[FUNIL]_[OBJETIVO]
           Ex: PR_DRAPEDRO_N1_F1-AVALIACAO_LEADS

Conjunto:  PR_[CLIENTE]_N1_[FUNIL]_[SEGMENTACAO]_[DATA]
           Ex: PR_DRAPEDRO_N1_F1_MAES-0-2ANOS_MAI26

Anúncio:   PR_[CLIENTE]_N1_[FUNIL]_[CRIATIVO]_[VERSAO]
           Ex: PR_DRAPEDRO_N1_F1_FOTO-MEDICA_V1
           Ex: PR_DRAPEDRO_N1_F1_TEXTO-PROBLEMA_V2
```

---

### Campanha F1 — Avaliação de Desenvolvimento

**Objetivo da campanha:** Leads (formulário nativo) ou Tráfego (para LP)
- Usar Leads se o pixel tiver menos de 50 eventos de Lead registrados
- Migrar para Conversões (otimizar para Lead na LP) após 50+ eventos

**Conjunto de anúncios:**

| Configuração | Valor |
|---|---|
| Localização | Raio de 5km ao redor da clínica |
| Gênero | Feminino |
| Idade | 24 a 38 anos |
| Interesses | Maternidade, Bebês e crianças, Recém-nascidos, Puericultura, Desenvolvimento infantil, Marco do desenvolvimento |
| Exclusão | Profissionais de saúde (evitar desperdício de verba) |
| Posicionamentos | Feed Instagram + Stories Instagram (manual — excluir Audience Network) |
| Orçamento | R$15/dia |
| Período | Sem data de fim |

**Criativos A/B (mínimo 2 por conjunto):**

| Variante | Formato | Elemento testado |
|---|---|---|
| V1 — Foto do médico | Imagem 1:1 + Stories 9:16 | Headline emocional: "Seu bebê está se desenvolvendo bem?" |
| V2 — Layout texto | Imagem 1:1 + Stories 9:16 | Headline racional: "Avaliação completa de desenvolvimento infantil — [Cidade]" |

**Regra de pausa:** criativo com CTR abaixo de 0,8% após 5 dias é pausado. Subir novo criativo na semana seguinte.

---

### Campanha F2 — Guia da Primeira Consulta

**Objetivo da campanha:** Leads (capturar e-mail + WhatsApp para envio do e-book)

**Conjunto de anúncios:**

| Configuração | Valor |
|---|---|
| Localização | Raio de 8km (funil de conteúdo — raio maior é justificado) |
| Gênero | Feminino |
| Idade | 22 a 36 anos |
| Interesses | Maternidade, Bebês recém-nascidos, Amamentação, Gravidez, Primeiros meses do bebê |
| Exclusão | Profissionais de saúde |
| Posicionamentos | Feed Instagram + Stories Instagram |
| Orçamento | R$10/dia |
| Período | Sem data de fim |

**Criativos A/B:**

| Variante | Formato | Elemento testado |
|---|---|---|
| V1 — Visual do e-book | Imagem do mockup do guia + chamada para o download gratuito | Foco na oferta (e-book grátis) |
| V2 — Dúvida da mãe | Imagem com pergunta: "O que levar na primeira consulta do seu bebê?" | Foco na dor (ansiedade da primeira consulta) |

---

### Campanha F3 — Migração de Convênio para Particular

**Objetivo da campanha:** Leads (capturar nome, WhatsApp e dados da criança)

**Conjunto de anúncios:**

| Configuração | Valor |
|---|---|
| Localização | Raio de 5km ao redor da clínica |
| Gênero | Feminino |
| Idade | 26 a 42 anos |
| Interesses | Plano de saúde, Maternidade, Saúde infantil, Pediatria, Convênio médico |
| Exclusão | Profissionais de saúde |
| Posicionamentos | Feed Instagram + Stories Instagram |
| Orçamento | R$15/dia |
| Período | Sem data de fim |

**Criativos A/B:**

| Variante | Formato | Elemento testado |
|---|---|---|
| V1 — Dor do convênio | Imagem com texto: "Pediatra diferente toda vez. Sem continuidade. Tem que mudar." | Headline emocional — dor |
| V2 — Contraste | Foto do médico com headline: "Consulta de 40 min. Sempre o mesmo médico. Sem pressa." | Headline propositivo — solução |

---

## Estrutura Completa das Campanhas Google Ads

### Convenção de nomenclatura — Google Ads

```
Campanha:  PR_[CLIENTE]_SEARCH_[SEGMENTO]
           Ex: PR_DRAPEDRO_SEARCH_LOCAL-ALTA-INTENCAO

Grupo:     [ESPECIALIDADE]_[CIDADE/BAIRRO]
           Ex: PEDIATRA_[CIDADE]

Anúncio:   Responsivo — mínimo 5 headlines + 3 descriptions
```

---

### Campanha Search — Alta Intenção Local

**Objetivo:** capturar quem está buscando ativamente por pediatra na região.

**Configurações:**

| Configuração | Valor |
|---|---|
| Tipo | Search |
| Objetivo | Leads / Visitas ao site |
| Localização | Raio de 10km ao redor da clínica |
| Idioma | Português |
| Lances | Maximizar conversões (ou CPC manual no início se sem histórico) |
| Orçamento | R$10/dia |

**Palavras-chave (match exato e frase):**

```
[pediatra [cidade]]
[pediatra [bairro]]
[pediatra particular [cidade]]
[consulta pediátrica [cidade]]
[pediatra infantil [cidade]]
"pediatra [cidade]"
"pediatra [bairro]"
"consulta pediatra particular"
"melhor pediatra [cidade]"
```

**Palavras-chave negativas essenciais:**

```
-convênio (se o cliente não aceita mais convênio)
-plano de saúde (mesmo caso)
-gratuito
-público
-UPA
-pronto socorro
-hospital público
-concurso
-emprego
-vagas
-salário
-quanto ganha
```

**Extensões obrigatórias:**
- Local: endereço da clínica
- Telefone: número do WhatsApp Business
- Sitelinks: links para as 3 LPs (Avaliação / Guia Primeira Consulta / Consulta Particular)
- Callout: "Consultas de 40 min" / "Mesmo médico sempre" / "Agendamento pelo WhatsApp"

**Headlines sugeridas (criar 5-8 variações):**
1. Pediatra em [Cidade] — Agende Hoje
2. Dr. [Nome] — Pediatra Particular
3. Consulta Pediátrica [Bairro]
4. Atendimento Pediátrico Completo
5. Consultas de 40 min — Sem Pressa
6. Mesmo Pediatra em Todas as Consultas
7. Agende Pelo WhatsApp Agora

**Descriptions sugeridas (3 variações):**
1. "Consultas completas e sem pressa para seu filho. Agende pelo WhatsApp — atendimento em até 24h."
2. "Dr. [Nome] — pediatra especializado com consultas de 40 min. Mesma médica em todos os retornos."
3. "Pediatra particular em [Cidade]. Avaliação de desenvolvimento, puericultura e acompanhamento contínuo."

---

## Rotina de Gestão Semanal

### Segunda-feira — Revisão e ajustes de orçamento

**Tempo estimado:** 20-30 min
**O que fazer:**
1. Verificar o gasto da semana anterior vs. orçamento previsto (está queimando mais ou menos?)
2. Verificar CPL por campanha — alguma ultrapassou a meta (R$25 Meta / R$35 Google)?
3. Verificar CTR por criativo — algum abaixo de 0,8% (Meta) ou 2% (Google)?
4. Ajustar lances se necessário
5. Pausar criativos de baixo desempenho

### Quarta-feira — Análise de leads e qualidade

**Tempo estimado:** 15-20 min
**O que fazer:**
1. Quantos leads chegaram nos últimos 7 dias?
2. De quais funis vieram os mais leads?
3. Verificar com a secretária: dos leads que chegaram, quantos agendaram?
4. Calcular a taxa de conversão de lead para agendamento por funil
5. Registrar no sistema interno

### Sexta-feira — Otimização e update ao cliente

**Tempo estimado:** 30-40 min
**O que fazer:**
1. Revisar performance da semana completa
2. Criar novo criativo se algum foi pausado (entregar ao social media o brief)
3. Preparar o update semanal para o cliente (máximo 5 linhas — ver template no E12)
4. Enviar o update via CS

---

## Alertas a Configurar no Meta Ads Manager

| Condição | Ação |
|---|---|
| CPL acima de R$35 por mais de 3 dias | Alerta automático + revisão imediata de segmentação e criativo |
| Gasto diário = R$0 por mais de 1 dia | Alerta automático + verificar se campanha foi pausada involuntariamente |
| CTR abaixo de 0,5% por mais de 5 dias | Pausar o anúncio e subir novo criativo |
| Sem leads por 48h com campanha ativa | Verificar formulário + landing page + tracking |

---

## Documentação de Lançamento

Após o lançamento (Dia 14), o Gestor de Tráfego preenche a ficha de lançamento no sistema interno:

| Campo | Valor |
|---|---|
| Data de lançamento | |
| Campanhas Meta (nomes) | |
| Campanhas Google (nomes) | |
| Orçamento diário Meta por campanha | |
| Orçamento diário Google | |
| CPL alvo Meta | R$25 |
| CPL alvo Google | R$35 |
| ID do Pixel Meta | |
| ID do GA4 | |
| Link para o Gerenciador Meta | |
| Link para o Google Ads | |
| Observações | |

---

## Ferramentas utilizadas

| Ferramenta | Para quê |
|---|---|
| Meta Ads Manager | Criação, gestão e monitoramento das campanhas Meta |
| Google Ads | Criação, gestão e monitoramento das campanhas Search |
| Meta Business Suite | Vinculação de contas, pixel, Instagram |
| Google Analytics 4 | Acompanhamento de conversões |
| Google Looker Studio | Painel de acompanhamento para CS e cliente |
| Canva | Criativos (imagens dos anúncios) |
| Meta Pixel Helper | Verificação do pixel nas páginas |

---

## Padrão de qualidade

- [ ] 3 campanhas Meta Ads lançadas (uma por funil) com segmentação adequada
- [ ] Mínimo 2 criativos por campanha (A/B configurado)
- [ ] Convenção de nomenclatura seguida em todas as campanhas
- [ ] Campanha Google Ads Search lançada com palavras-chave locais
- [ ] Palavras-chave negativas essenciais configuradas no Google
- [ ] Todas as campanhas com UTMs nos links de destino
- [ ] Pixel e GA4 registrando cliques e leads (confirmado antes do lançamento)
- [ ] Alertas de CPL configurados no Meta Ads Manager
- [ ] Ficha de lançamento preenchida no sistema interno
- [ ] CS comunicado sobre o lançamento com estrutura e próximos passos

---

## Entregável final

Campanhas ativas em Meta Ads e Google Ads, entregando tráfego qualificado para as 3 landing pages. Ficha de lançamento documentada. Rotina de gestão semanal iniciada. CS e secretária avisados de que os leads vão começar a chegar em 24-72h.

---

## O que fazer se travar

**Meta Ads reprovar anúncio sobre saúde:** Reescrever o copy evitando: promessas de resultado ("cure", "resolva", "trate"), linguagem que soa como diagnóstico, imagens de procedimentos médicos. Focar em benefícios de conforto, cuidado e continuidade — não em problema clínico.

**Conta Google Ads suspensa ao criar:** Verificar se o cartão está validado e se o perfil de cobrança está consistente. Se houver histórico de suspensão prévia no e-mail, criar nova conta com e-mail limpo.

**Orçamento esgota antes do fim do mês:** Verificar se os lances estão muito altos. No Google, reduzir lance máximo de CPC. No Meta, usar estratégia "Maximizar conversões" com orçamento diário fixo — não orçamento vitalício.

**Nenhum lead nos primeiros 3 dias:** Verificar se as campanhas estão entregando (alcance > 0). Testar o formulário manualmente. Se tudo funciona e ainda sem leads, aguardar mais 4-5 dias antes de alterar a segmentação (o Meta precisa de tempo de aprendizado).

**CPL muito alto após 7 dias:** Pausar os criativos de menor CTR. Criar novo criativo com ângulo diferente (se testou emocional, testar racional, e vice-versa). Revisar se o público está muito amplo. Verificar se as LPs estão convertendo (taxa de conversão de visita para lead — meta: acima de 15%).

**Secretária não está respondendo os leads:** Notificar o CS imediatamente. Quantidade de leads sem resposta = CPL desperdiçado. CS entra em contato com a secretária e reforça o SLA de 1h. Se o problema persistir, escalar para o cliente diretamente.

---

## ROTEIRO DE PROTOCOLO OPERACIONAL

### Etapa 1 — Verificação das contas antes do lançamento (Dia 12 | 45 min)

**Quem:** Gestor de Tráfego
**Meta Ads — verificar:**
1. A conta de anúncios existe no Meta Business Suite? (Se não, criar)
2. O método de pagamento está configurado e ativo com o cartão do cliente?
3. O Meta Pixel está associado à conta de anúncios?
4. O perfil do Instagram está vinculado ao Business Suite?
5. O pixel tem ao menos alguns eventos de PageView registrados (confirmando que está rodando nas LPs)?

**Google Ads — verificar:**
1. O cliente tem conta Google Ads? (Se não, criar em ads.google.com)
2. A cobrança está configurada com o cartão do cliente?
3. A conta está vinculada ao GA4 para importação de conversões?

**Ponto crítico:** nunca lançar campanhas com o cartão da agência. Cobrança sempre no cartão do cliente. Documentar o método de pagamento no sistema interno.

---

### Etapa 2 — Criação das campanhas Meta Ads (Dias 12-13 | 2-3h)

**Quem:** Gestor de Tráfego
**Sequência de criação:**
1. Criar a estrutura de conta no Ads Manager (se for primeira campanha desse cliente)
2. Criar Campanha F1 (Avaliação):
   - Nomear conforme convenção
   - Objetivo: Leads
   - Criar conjunto de anúncios com segmentação da tabela acima
   - Criar anúncio V1 (foto do médico) — subir a imagem, escrever o copy, colocar o link com UTM
   - Criar anúncio V2 (layout texto) — mesma estrutura
3. Repetir para Campanha F2 (Guia) e Campanha F3 (Migração)
4. Conferir todos os links de destino (clicar em cada um e confirmar que a LP abre)
5. Deixar as campanhas em rascunho — não publicar ainda (aguardar upload dos criativos do Social Media)

---

### Etapa 3 — Upload dos criativos e revisão (Dia 13 | 30 min)

**Quem:** Gestor de Tráfego (recebe do Social Media)
**Checklist de criativos antes do upload:**
- [ ] Imagem em 1:1 (1080x1080px) para feed — sem texto excessivo (regra dos 20%)
- [ ] Imagem em 9:16 (1080x1920px) para Stories
- [ ] Copy do anúncio: texto principal (máximo 125 chars), headline (máximo 40 chars), descrição
- [ ] Links de destino com UTMs corretos por funil
- [ ] LPs de destino estão no ar e funcionando

---

### Etapa 4 — Criação das campanhas Google Ads (Dias 13-14 | 1,5h)

**Quem:** Gestor de Tráfego
**Sequência:**
1. Criar campanha Search com objetivo Leads
2. Configurar localização (raio de 10km) e idioma (português)
3. Criar grupo de anúncios com as palavras-chave listadas acima (exato + frase)
4. Adicionar todas as palavras-chave negativas da lista
5. Criar anúncio responsivo: inserir 5-8 headlines e 3 descriptions (variações acima)
6. Adicionar extensões: local, telefone, sitelinks, callouts
7. Configurar lances: começar com "Maximizar cliques" (sem histórico) e migrar para "Maximizar conversões" após 30+ conversões
8. Vincular conversão do GA4 para rastreamento

---

### Etapa 5 — Lançamento e primeiro monitoramento (Dia 14 | 15 min + acompanhamento)

**Quem:** Gestor de Tráfego
**Fala para o CS após o lançamento:**
> "Campanhas lançadas em [data]. Meta Ads: 3 campanhas (F1, F2, F3) com orçamento total de R$40/dia. Google Ads: 1 campanha Search com R$10/dia. Primeiros dados em 24-72h (tempo de revisão das plataformas). Enviarei o primeiro update na sexta."

**Monitoramento nos primeiros 3 dias:**
- Verificar diariamente se as campanhas estão com status "Ativo" (não em revisão ou pausadas)
- Meta Ads revisa anúncios em até 24h
- Google Ads pode levar até 72h para aprovação

---

### Etapa 6 — Otimização semanal contínua (a partir da semana 3)

**Quem:** Gestor de Tráfego
**Toda segunda-feira (20-30 min):**
1. Acessar o Meta Ads Manager
2. Filtrar por período: últimos 7 dias
3. Ver tabela: CPL, CTR, leads gerados, gasto por campanha
4. Pausar anúncios com CTR < 0,8% que já rodaram 5+ dias
5. Aumentar orçamento em 10-15% das campanhas com CPL abaixo da meta (sem mudar de uma vez — risco de sair da fase de aprendizado)
6. Registrar as decisões tomadas no log semanal do sistema interno

**Toda quarta-feira (15 min):**
1. Verificar com CS quantos leads chegaram na semana
2. Cruzar com dado da secretária: quantos agendaram?
3. Calcular taxa de conversão de lead para agendamento por funil
4. Se taxa abaixo de 20%: checar se o problema está no script da secretária ou na qualidade do lead

---

*Documento de processo interno — Pixel Rain Agency. Versão 2.0 — Maio 2026*
