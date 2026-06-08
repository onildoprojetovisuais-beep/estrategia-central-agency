# E08 — Configuracao das Campanhas de Trafego — Dra. Marina Albuquerque
**N1 — Plano de Atracao | Pixel Rain Agency**
**Cliente:** Instituto Infantil Aurora | Campinas/SP
**Instagram:** @institutoinfantilaurora | **Site:** institutoinfantilaurora.com.br
**Classificacao:** Processo Aplicado — Cliente Ativo

---

## Contexto do cliente neste entregavel

A Dra. Marina tem R$1.500/mes de verba de trafego, distribuidos entre Meta Ads (R$40/dia) e Google Ads (R$10/dia). Esse orcamento e modesto mas suficiente para gerar volume significativo de leads dado o raio geografico reduzido (5km do consultorio) e a especificidade do publico-alvo. A vantagem competitiva esta na segmentacao ultra-localizada e no diferencial real da Marina: unica pediatra do Cambui com especializacao em Desenvolvimento Infantil pela UNICAMP — diferencial que ainda nao esta sendo comunicado por nenhuma campanha paga na regiao.

O @institutoinfantilaurora provavelmente nunca rodou campanhas pagas. Isso significa que a conta de anuncios no Meta precisa ser criada ou ativada do zero — incluindo validar metodo de pagamento e aguardar aprovacao inicial. Criar a conta no Dia 12 para ter margem ate o Dia 14.

---

## Estrutura geral das campanhas

**Verba total:** R$1.500/mes
- Meta Ads: R$1.200/mes (R$40/dia)
- Google Ads: R$300/mes (R$10/dia)

**Convencao de nomenclatura:**
- Meta: `IA-N1-[Funil]-Meta-S[semana]` — ex: `IA-N1-F1-Meta-S01`
- Google: `IA-N1-Search-Google-S[semana]`

---

## Campanha Meta Ads — Instituto Infantil Aurora

### Configuracao da conta (Dia 12)

1. Acessar Meta Business Suite da conta do Instituto Infantil Aurora
2. Verificar se existe conta de anuncios. Se nao: criar nova conta
   - Nome: "Instituto Infantil Aurora — Ads"
   - Fuso horario: America/Sao_Paulo
   - Moeda: BRL
3. Adicionar metodo de pagamento (cartao da Dra. Marina ou da clinica)
4. Vincular: conta de anuncios + Instagram @institutoinfantilaurora + Meta Pixel instalado no site
5. Confirmar que o Instagram esta vinculado ao Meta Business Suite como "Conta do Instagram"

*A conta nova passa por verificacao do Meta em 24-48h. Criar no Dia 12 para ter margem.*

---

### Distribuicao do orcamento Meta Ads — R$40/dia

| Funil | Orcamento diario | Proporcao | Logica |
|---|---|---|---|
| F1 — Avaliacao de Desenvolvimento | R$20/dia | 50% | Lead mais quente — mae com duvida ativa de desenvolvimento |
| F2 — Guia da Primeira Consulta | R$10/dia | 25% | Custo de aquisicao mais baixo (oferta gratuita), nutricao mais longa |
| F3 — Migracao de Convenio | R$10/dia | 25% | Publico mais especifico — orcamento conservador no inicio |

---

### Campanha F1 — Avaliacao de Desenvolvimento (IA-N1-F1-Meta-S01)

**Objetivo de campanha:** Leads

**Conjunto de anuncios — segmentacao:**
- Localizacao: raio de 5km do Instituto Infantil Aurora (Rua Coronel Quirino, 1.204, Cambui, Campinas/SP)
  - Bairros cobertos: Cambui, Nova Campinas, Jardim Paulista, Taquaral, Campolim
- Genero: feminino
- Faixa etaria: 24 a 42 anos
- Interesses: maternidade, recem-nascidos, bebes, puericultura, desenvolvimento infantil, pediatria, amamentacao
- Exclusoes: profissionais de saude
- Posicionamento: Feed Instagram + Stories Instagram (excluir Audience Network)
- Orcamento diario: R$20
- Objetivo de lance: Maximizar volume de leads

**Anuncio F1-A (jaleco — autoridade):**
- Imagem: foto da Dra. Marina com jaleco branco, expressao acolhedora
- Headline: "Seu bebe esta atingindo os marcos de desenvolvimento?"
- Texto: "Dra. Marina Albuquerque — unica pediatra do Cambui com especializacao em Desenvolvimento Infantil pela UNICAMP — oferece avaliacao gratuita de 15 minutos. Instituto Infantil Aurora, Campinas."
- CTA: "Saiba mais" → link para `institutoinfantilaurora.com.br/avaliacao` com UTM `utm_source=meta&utm_campaign=f1&utm_content=jaleco`

**Anuncio F1-B (credencial UNICAMP — racional):**
- Imagem: foto da Dra. Marina em ambiente clinico (consultorio ao fundo)
- Headline: "Especialista em Desenvolvimento Infantil — UNICAMP — no Cambui"
- Texto: "Sua crianca se desenvolve melhor com acompanhamento especializado. Dra. Marina Albuquerque, CRM SP 183.472. Consulta de 40 minutos no Instituto Infantil Aurora, Campinas."
- CTA: "Saiba mais" → UTM `utm_source=meta&utm_campaign=f1&utm_content=unicamp`

**Teste A/B F1:** foto com jaleco (F1-A) vs. credencial UNICAMP no texto (F1-B). Avaliar CTR e CPL apos 7 dias.

---

### Campanha F2 — Guia da Primeira Consulta (IA-N1-F2-Meta-S01)

**Conjunto de anuncios — segmentacao:**
- Localizacao: raio de 5km (mesma configuracao)
- Genero: feminino
- Faixa etaria: 22 a 35 anos (faixa mais jovem — maes de recem-nascidos)
- Interesses: recem-nascido, bebe, parto, maternidade, amamentacao, enxoval de bebe
- Orcamento diario: R$10

**Anuncio F2-A:**
- Imagem: mockup do e-book com capa atrativa (identidade visual do Instituto Aurora)
- Headline: "Vai a primeira consulta do bebe? Baixe o guia gratis"
- Texto: "Guia gratuito de 10 paginas da Dra. Marina Albuquerque — pediatra especialista pela UNICAMP. Tudo o que voce precisa saber antes da primeira consulta do seu bebe."
- CTA: "Baixar" → UTM `utm_source=meta&utm_campaign=f2&utm_content=mockup`

**Anuncio F2-B:**
- Imagem: foto da Dra. Marina com expressao explicativa
- Headline: "O que perguntar na primeira consulta do bebe?"
- Texto: "Toda mae tem duvidas na primeira consulta. A Dra. Marina preparou um guia completo e gratuito com o que voce precisa saber."
- CTA: "Baixar" → UTM `utm_source=meta&utm_campaign=f2&utm_content=foto`

**Teste A/B F2:** mockup do e-book (F2-A) vs. foto casual da Marina (F2-B).

---

### Campanha F3 — Migracao de Convenio (IA-N1-F3-Meta-S01)

**Conjunto de anuncios — segmentacao:**
- Localizacao: raio de 5km (mesma configuracao)
- Genero: feminino
- Faixa etaria: 26 a 42 anos (maes com filhos mais velhos, mais provavel uso de convenio)
- Interesses: saude da crianca, plano de saude, pediatria, consulta medica
- Orcamento diario: R$10

**Anuncio F3-A:**
- Headline: "Cansada de sempre ver um pediatra diferente no convenio?"
- Texto: "No Instituto Infantil Aurora, a Dra. Marina acompanha seu filho desde o primeiro dia. Mesma medica. Mesmo historico. Todo o contexto que faz diferenca no cuidado."
- CTA: "Saiba mais" → UTM `utm_source=meta&utm_campaign=f3&utm_content=convenio`

---

## Campanha Google Ads Search — Instituto Infantil Aurora

**Verba:** R$300/mes (R$10/dia)

**Campanha:** `IA-N1-Search-Google`
**Tipo:** Pesquisa
**Objetivo:** Leads (formulario ou ligacao)

**Palavras-chave (correspondencia de frase e exata):**
- "pediatra cambui campinas"
- "pediatra desenvolvimento infantil campinas"
- "consulta pediatrica cambui"
- "pediatra particular cambui"
- [pediatra cambui]
- [pediatra campinas particular]
- [puericultura campinas]
- [desenvolvimento infantil pediatra campinas]

**Palavras-chave negativas:**
- "convenio" (nao e o publico-alvo prioritario)
- "pronto socorro"
- "upa"

**Extensoes obrigatorias:**
- Local: Rua Coronel Quirino, 1.204, sala 34, Cambui, Campinas/SP
- Chamada: numero de telefone / WhatsApp da Claudinha
- Sitelinks: "Avaliacao Gratuita" (→ /avaliacao), "Primeira Consulta" (→ /particular), "Guia Gratuito" (→ /guia)

**Anuncio Google 1:**
- Headline 1: Instituto Infantil Aurora
- Headline 2: Pediatra Desenvolvimento Infantil
- Headline 3: Especialista UNICAMP | Cambui Campinas
- Description 1: Consultas de 40 min com a Dra. Marina Albuquerque. Acompanhamento desde o 1o dia de vida.
- Description 2: Pediatra especialista em desenvolvimento infantil no Cambui, Campinas. Agende pelo WhatsApp.

**Localizacao Google Ads:** Campinas/SP + raio de 10km

---

## Metas do Mes 1

| Metrica | Meta |
|---|---|
| Total de leads (Meta + Google) | 35 a 50 leads |
| CPL Meta Ads | Abaixo de R$25 |
| CPL Google Ads | Abaixo de R$35 |
| Taxa de conversao LP (leads/visitas) | 15% ou mais |
| CTR minimo Meta Ads | 0,8% |

**Alerta de CPL:** se CPL acima de R$40 por 5 dias consecutivos → revisar criativos e segmentacao imediatamente.
**Alerta de CTR:** abaixo de 0,8% por 5 dias em qualquer criativo → pausar e criar substituto com angulo diferente.

*Contexto para comunicar a Marina: as primeiras 2 semanas de qualquer campanha sao de aprendizado de algoritmo — o Meta e o Google precisam de dados para otimizar. O CPL das semanas 1 e 2 sera mais alto. A partir da semana 3, os numeros tendem a melhorar.*

---

## Rotina semanal de gestao de campanhas

**Segunda-feira — Revisao de performance:**
- Verificar campanhas ativas (sem pausa involuntaria), gasto do dia anterior, CPL por funil
- Se CPL acima da meta: ajustar lances ou pausar criativo com pior performance
- Registrar no log interno

**Quarta-feira — Qualidade dos leads:**
- Checar com a Claudinha (via painel ou grupo WhatsApp de suporte) quantos leads da semana responderam e quantos agendaram
- Registrar taxa de conversao lead → agendamento por funil

**Sexta-feira — Update para a Dra. Marina (maximo 5 linhas):**
Modelo:
```
Instituto Aurora — Semana de [data a data]:
Leads: [X leads] | CPL medio: R$[XX]
Melhor funil: F[X] com CPL de R$[XX]
Ajuste feito: [o que foi otimizado ou nada a ajustar]
Proxima semana: [o que sera testado ou mantido]
```

---

## Alertas operacionais para este cliente

- **Conta Meta Ads nova:** criar no Dia 12. Conta nova passa por verificacao em 24-48h — nao criar no Dia 14.
- **Sem historico de pixel:** os primeiros 7 a 10 dias geram dados, nao resultados otimizados. Comunicar isso a Marina antes que ela pergunte.
- **Vocabulario dos anuncios:** evitar termos que o Meta reprova. Usar "acompanhamento", "consulta", "cuidado", "desenvolvimento" — nao "diagnostico", "tratamento", "doenca".
- **Aprovacao dos criativos:** a Marina tem direito de aprovar os anuncios antes de subirem — especialmente os que usam foto e nome dela. Enviar para aprovacao em lote junto com os posts do Instagram.

---

## ROTEIRO DE PROTOCOLO OPERACIONAL

### Como subir as campanhas para o Instituto Infantil Aurora

**Dia 12 — Criacao da conta:**
1. Entrar no Meta Business Suite com o login da agencia
2. Criar a conta de anuncios com os dados do Instituto Aurora
3. Vincular o @institutoinfantilaurora
4. Instalar o Meta Pixel no site (se ainda nao instalado via E06)
5. Configurar o metodo de pagamento — confirmar com a Marina ou Claudinha qual cartao usar

**Dia 13 — Producao e aprovacao dos criativos:**
1. Montar os anuncios F1-A, F1-B, F2-A, F2-B, F3-A com as copies aprovadas
2. Enviar para aprovacao da Marina: "Marina, esses sao os anuncios que vamos subir amanha. Voce tem ate as 18h de hoje para sugerir ajustes."
3. Registrar aprovacao (print do WhatsApp ou e-mail)

**Dia 14 — Subida das campanhas:**
1. Criar estrutura: 3 campanhas Meta (F1, F2, F3) + 1 campanha Google
2. Configurar segmentacoes, orcamentos e criativos conforme este documento
3. Publicar e verificar status "Em analise" no Meta Ads Manager
4. Confirmar que os UTMs dos links estao funcionando (visita de teste em cada LP)
5. Registrar hora de subida no log interno

---

### Como fazer o primeiro relatorio de campanha (Semana 1)

O primeiro relatorio e enviado 7 dias apos a subida das campanhas. Formato: texto curto, sem PDF, enviado via WhatsApp Business para a Marina.

Estrutura do relatorio de semana 1:
```
Instituto Aurora — Relatorio Semana 1:
Leads gerados: [X] (Meta: [X] | Google: [X])
CPL medio: R$[XX] (Meta: R$[XX] | Google: R$[XX])
Melhor anuncio: [nome do anuncio] com CTR de [X]%
Contexto: semana 1 e de aprendizado — CPL tende a cair nas proximas semanas
Proximo passo: [o que sera ajustado ou testado na semana 2]
```

---

### Como apresentar os resultados da primeira semana para a Dra. Marina

**Contexto:** a Marina e ISFJ — ela vai querer entender os numeros, nao apenas receber um relatorio. Prepare-se para perguntas como "Por que o CPL esta alto?", "Esse numero e bom ou ruim?", "Quanto tempo ate vermos resultado de verdade?"

**Script de apresentacao da semana 1 (via WhatsApp):**
"Marina, aqui esta o resumo da nossa primeira semana de campanhas. O CPL de R$[XX] e esperado para a primeira semana — o algoritmo do Meta precisa de alguns dias de dados para otimizar. Ja identificamos que o anuncio F1-A esta performando melhor (CTR de [X]%). Na proxima semana, vamos concentrar um pouco mais de orcamento nele. Qualquer duvida, estou a disposicao."

**Se a Marina perguntar "quando vou ver resultado?":**
"A curva padrao de uma campanha nova e: semana 1-2 de aprendizado, semana 3-4 de otimizacao. O primeiro mes cheio de dados e o mes 2. Voce vai ver os numeros melhorarem semana a semana."

---

*Documento de processo aplicado — Pixel Rain Agency. Cliente: Instituto Infantil Aurora. Versao 1.1 — Maio 2026*
