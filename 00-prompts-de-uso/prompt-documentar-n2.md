# PROMPT — Documentar Entregáveis do N2
> Cole este prompt inteiro numa nova conversa com o Claude Code quando quiser gerar os documentos do N2.

---

```
Estamos trabalhando no projeto da Pixel Rain Agency em C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency

Quero que você leia os seguintes arquivos para ter todo o contexto necessário e então delegue a criação dos documentos para um subagente:

ARQUIVOS A LER ANTES DE COMEÇAR:
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n2-conversao-entrega.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\visao-geral-escada.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\01-identidade\identidade-completa.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\02-posicionamento\posicionamento-profissional.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\05-instagram\instagram-completo.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\06-ecossistema-digital\ecossistema-digital.md

TAMBÉM LER (para entender o padrão de qualidade já estabelecido no N1):
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n1-entregaveis\processo-padrao\E01-kickoff.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n1-entregaveis\projeto-dra-marina\E01-kickoff-dra-marina.md

TAREFA:
Após ler todos os arquivos acima, delegue para um subagente a criação de 24 documentos de processo para o N2 — exatamente como foi feito para o N1.

ESTRUTURA DE PASTAS A CRIAR:
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n2-entregaveis\processo-padrao\
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n2-entregaveis\projeto-dra-marina\

OS 10 ENTREGÁVEIS DO N2 SÃO:
1. E01 — Kickoff do N2 (transição do N1 para o N2 — reunião de abertura, framing e coleta de novos acessos)
2. E02 — Diagnóstico de Conversão (Semana 1 — mapeamento de onde o lead some, baseline de taxa de conversão, entrevista com secretária sobre objeções)
3. E03 — Implantação do CRM Pipedrive (Semana 2 — pipeline pediátrico padrão com 6 etapas, campos personalizados, acesso do cliente e da secretária)
4. E04 — Configuração das Automações de Cadência (Semana 2 — WhatsApp Business API, 4 cadências: lead frio, lead quente, confirmação de agendamento, não compareceu)
5. E05 — Criação do Playbook de Atendimento (Semanas 3 e 4 — scripts de qualificação por WhatsApp e telefone, cadência de 3 toques em 7 dias, respostas para as 10 objeções principais, roteiro para pacientes inativos)
6. E06 — Treinamento da Secretária (Semanas 3 e 4 — 3 calls: apresentação do playbook, simulação ao vivo, revisão após 30 dias)
7. E07 — Dashboard de Indicadores de Conversão (integração Pipedrive + Google Data Studio — taxa de conversão por canal, tempo de resposta, motivos de perda)
8. E08 — Relatório dos Primeiros 30 Dias do N2 (baseline de conversão, mapa de gargalos, primeiros ajustes no playbook)
9. E09 — Rotina Mensal do N2 (ciclo mensal com leitura de pipeline, análise de conversão, sessão de feedback com secretária, atualização do playbook)
10. E10 — Gatilho de Upgrade para o N3 (como identificar os dois sinais de convergência, como conduzir a conversa de upgrade na reunião do 8º ao 12º mês de N2)

LÓGICA DO N2 PARA O SUBAGENTE ENTENDER:
- O N2 é a fase de Conversão. Ticket: R$ 3.750/mês entrada → R$ 5.000/mês escopo pleno.
- KPI único: taxa de conversão lead → consulta realizada. Baseline entrada: 35-45%. Meta: 60-70%.
- O N1 CONTINUA RODANDO. O N2 adiciona a camada de conversão em cima — nunca substitui.
- Ferramenta central nova: Pipedrive (CRM). Já existe no N1: omnichannel (Chatguru/Octadesk).
- A secretária é o ator principal do N2 — o playbook é para ela, o CRM é operado por ela.
- O N2 dura 6 a 12 meses. Upgrade para N3 acontece quando: taxa de conversão estável acima de 60% + pacientes inativos visíveis na base.

CONTEXTO DA DRA. MARINA NO N2:
- Ela entrou no N2 no Mês 5 do relacionamento (gatilho: agenda cheia + secretária perdendo lead na conversão)
- Secretária: Claudinha, 28 anos, CLT — operou o N1 bem, mas improvisa nas objeções e não tem processo documentado de follow-up
- Baseline de conversão estimada ao entrar no N2: 38% (leads chegam, mas 62% não vira consulta)
- Principal objeção no consultório dela: preço ("R$ 450 está caro") e convênio ("atende pelo meu plano?")
- Instagram: @institutoinfantilaurora — cresceu com o N1, está mais ativo, Marina começou a aparecer nos reels
- CRM a implantar: Pipedrive — Claudinha nunca usou CRM. Precisa de interface simples e treinamento com paciência
- Atenção: a Marina vai querer entender o CRM com profundidade antes de deixar a Claudinha operar. Preparar uma sessão de apresentação para ela (fundadora) antes do treinamento da secretária.
- Motivos de perda mais prováveis no pipeline dela: "preço", "convênio", "quero pensar", "não respondeu"

ESTRUTURA DE CADA DOCUMENTO — PROCESSO PADRÃO:
```markdown
# E[número] — [Nome do Entregável]
**N2 — Fase de Conversão | Pixel Rain Agency**
**Classificação:** Processo Operacional Interno

---

## O que é este entregável
## Quem executa
## Quando acontece
## Insumos necessários (o que precisa existir antes)
## Passo a passo detalhado
## Ferramentas utilizadas
## Padrão de qualidade
## Entregável final
## Prazo máximo de entrega
## O que fazer se travar

---
*Documento de processo interno — Pixel Rain Agency. Versão 1.0 — Maio 2026*
```

ESTRUTURA DE CADA DOCUMENTO — PROJETO DRA. MARINA:
```markdown
# E[número] — [Nome do Entregável] — Dra. Marina Albuquerque
**N2 — Fase de Conversão | Pixel Rain Agency**
**Cliente:** Instituto Infantil Aurora | Campinas/SP
**Classificação:** Processo Aplicado — Cliente Ativo

---

## Contexto do cliente neste entregável
## Adaptações do processo padrão para este cliente
## Execução para o Instituto Infantil Aurora (passo a passo com dados reais da Marina)
## Dados e materiais específicos do cliente
## Atenções e alertas para este cliente
## Resultado esperado para este cliente

---
*Documento de processo aplicado — Pixel Rain Agency. Cliente: Instituto Infantil Aurora. Versão 1.0 — Maio 2026*
```

NOMES DOS ARQUIVOS:
processo-padrao: E01-kickoff-n2.md, E02-diagnostico-conversao.md, E03-implantacao-crm.md, E04-automacoes-cadencia.md, E05-playbook-atendimento.md, E06-treinamento-secretaria.md, E07-dashboard-conversao.md, E08-relatorio-30-dias-n2.md, E09-rotina-mensal-n2.md, E10-gatilho-upgrade-n3.md

projeto-dra-marina: mesmos nomes com sufixo "-dra-marina.md"

PADRÃO DE QUALIDADE:
- Documentos de processo padrão: mínimo 500 palavras cada
- Documentos da Dra. Marina: mínimo 600 palavras cada, com dados reais (nome da clínica, @institutoinfantilaurora, CRM-SP 183.472, Claudinha, scripts prontos)
- Use as tabelas do N1 como referência de formato
- Os documentos da Dra. Marina devem ter textos prontos para uso: scripts de objeção específicos do consultório dela, mensagens de cadência com o nome do Instituto Infantil Aurora, configuração de pipeline com os campos relevantes para pediatria em Campinas

Você não executa, você delega. Use o Agent tool para criar todos os 20 arquivos.
```
