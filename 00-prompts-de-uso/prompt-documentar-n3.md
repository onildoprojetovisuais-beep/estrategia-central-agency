# PROMPT — Documentar Entregáveis do N3
> Cole este prompt inteiro numa nova conversa com o Claude Code quando quiser gerar os documentos do N3.
> Pré-requisito: N1 e N2 já devem estar documentados antes de rodar este prompt.

---

```
Estamos trabalhando no projeto da Pixel Rain Agency em C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency

Quero que você leia os seguintes arquivos para ter todo o contexto necessário e então delegue a criação dos documentos para um subagente:

ARQUIVOS A LER ANTES DE COMEÇAR:
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n3-retencao-entrega.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\visao-geral-escada.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\01-identidade\identidade-completa.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\02-posicionamento\posicionamento-profissional.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\06-ecossistema-digital\ecossistema-digital.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\10-perfil-fake\dra-marina-albuquerque\07-contexto-social\contexto-social.md

TAMBÉM LER (para entender o padrão de qualidade já estabelecido):
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n1-entregaveis\processo-padrao\E01-kickoff.md
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n1-entregaveis\projeto-dra-marina\E01-kickoff-dra-marina.md

TAREFA:
Após ler todos os arquivos acima, delegue para um subagente a criação de 22 documentos de processo para o N3 — exatamente como foi feito para o N1.

ESTRUTURA DE PASTAS A CRIAR:
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n3-entregaveis\processo-padrao\
- C:\Projetos ClaudeCode\PIXEL RAIN\pixel-rain-agency\08-escada-de-valor\n3-entregaveis\projeto-dra-marina\

OS 11 ENTREGÁVEIS DO N3 SÃO:
1. E01 — Kickoff do N3 (transição do N2 para o N3 — reunião de abertura, framing de "maturidade operacional", coleta de dados de base de pacientes e LTV atual)
2. E02 — Diagnóstico de Retenção (Semana 1 — cálculo do LTV baseline, mapeamento de pacientes inativos, análise de quando e por que pacientes param de voltar, histórico de indicações existentes)
3. E03 — Implementação das Automações de Relacionamento (Semana 2 — WhatsApp API: lembrete de vacina, mensagem de aniversário, follow-up de receita, lembrete de puericultura, boas-vindas ao paciente novo)
4. E04 — Configuração do E-mail Marketing (Semana 2 — escolha da plataforma MailerLite ou RD Station, importação da base, segmentação, template visual, sequência de boas-vindas)
5. E05 — Criação e Lançamento da Comunidade de Mães (Semana 3 — WhatsApp Communities, protocolo de convite, calendário de conteúdo semanal, pacotes exclusivos para membros)
6. E06 — Newsletter Mensal (estrutura recorrente — briefing, produção, envio mensal para a base, métricas de abertura e clique)
7. E07 — Programa de Indicação (Semana 4 — definição do benefício com o médico, rastreamento no CRM, script de comunicação, campanha trimestral de ativação)
8. E08 — Campanha Trimestral de Recuperação de Inativos (criação do template, critério de inativo, sequência de 3 toques, análise de resultado)
9. E09 — Dashboard de LTV e Retenção (configuração Pipedrive + Data Studio — LTV médio mensal, taxa de recompra, volume de indicações, taxa de recuperação de inativos, NPS)
10. E10 — Rotina Mensal do N3 (ciclo completo com camada de retenção: conteúdo da comunidade, análise de LTV, NPS, indicações, campanha trimestral quando aplicável)
11. E11 — Renovação de Contrato e Extensões (como apresentar a renovação entre o 10º e 11º mês de N3, reajuste por índice, extensões pontuais: segunda unidade, novo médico, projeto sazonal especial)

LÓGICA DO N3 PARA O SUBAGENTE ENTENDER:
- O N3 é a fase de Retenção. Ticket: R$ 5.000/mês entrada → R$ 7.000/mês escopo pleno.
- KPI único: LTV médio por paciente. Meta: +30% sobre baseline ao final de 6 a 12 meses.
- O N1 e o N2 CONTINUAM RODANDO. O N3 adiciona a camada de retenção em cima — nunca substitui.
- Ferramentas novas: WhatsApp Communities (comunidade de mães), e-mail marketing (MailerLite ou RD Station), automações avançadas de relacionamento.
- O CRM do N2 (Pipedrive) agora também rastreia LTV, recompra e retenção familiar.
- O N3 dura 12 a 24+ meses. Clientes N3 tendem a renovar — sair significa desmontar tudo que foi construído.
- Renovação apresentada entre o 10º e 11º mês — nunca no 12º (pressão negativa).

CONTEXTO DA DRA. MARINA NO N3:
- Ela entrou no N3 no Mês 12 do relacionamento (gatilho: conversão estável acima de 62% + pacientes inativos visíveis na base)
- LTV baseline calculado no diagnóstico do N3: estimar com base nos dados do N2 (ticket médio R$ 390 × frequência de retorno por paciente)
- Base de pacientes ativos ao entrar no N3: estimar ~180 famílias (crescimento ao longo de N1 + N2)
- Instagram: @institutoinfantilaurora — Marina já aparece nos reels com regularidade (superou a barreira do N1), tem 4.200+ seguidores (crescimento real ao longo do método)
- Claudinha agora opera o CRM com autonomia e usa os scripts do playbook — está pronta para adicionar os scripts da comunidade e do programa de indicação
- E-mail marketing: base coletada pelos funis do N1 (~320 e-mails) — usar MailerLite (base ainda abaixo de 1.000, plano gratuito é suficiente)
- Comunidade de mães: nome sugerido "Instituto Infantil Aurora — Espaço das Mães". Tom: acolhedor, com a voz da Dra. Marina, sem linguagem de marketing explícita.
- Programa de indicação: benefício sugerido para discutir com a Marina — desconto em consulta de retorno para a mãe que indicar (ex: consulta de retorno com 30% de desconto para quem indicar uma família nova)
- Atenção: a Marina está em momento de maior segurança — o método funcionou, ela acredita. O risco agora é o excesso de confiança fazer ela querer acelerar demais (nova unidade, novo médico) antes de a base estar madura o suficiente. O N3 precisa ser apresentado como consolidação antes de expansão.
- Ambição da Marina para o período: 60 consultas particulares/mês, 12 famílias no programa de puericultura premium (R$ 1.000/família/mês = R$ 12.000/mês de receita recorrente de puericultura). O N3 deve ter esse número como norte.

ESTRUTURA DE CADA DOCUMENTO — PROCESSO PADRÃO:
```markdown
# E[número] — [Nome do Entregável]
**N3 — Fase de Retenção | Pixel Rain Agency**
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
**N3 — Fase de Retenção | Pixel Rain Agency**
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
processo-padrao: E01-kickoff-n3.md, E02-diagnostico-retencao.md, E03-automacoes-relacionamento.md, E04-email-marketing.md, E05-comunidade-maes.md, E06-newsletter-mensal.md, E07-programa-indicacao.md, E08-campanha-inativos.md, E09-dashboard-ltv.md, E10-rotina-mensal-n3.md, E11-renovacao-contrato.md

projeto-dra-marina: mesmos nomes com sufixo "-dra-marina.md"

PADRÃO DE QUALIDADE:
- Documentos de processo padrão: mínimo 500 palavras cada
- Documentos da Dra. Marina: mínimo 600 palavras cada, com dados reais (Instituto Infantil Aurora, @institutoinfantilaurora, Claudinha, LTV baseline estimado, scripts prontos para comunidade e programa de indicação)
- Os documentos da Dra. Marina devem ter textos prontos para uso: mensagens automáticas com o nome da clínica, copy da comunidade "Instituto Infantil Aurora — Espaço das Mães", script de convite da Claudinha para a comunidade, template da newsletter com a voz da Dra. Marina, texto do programa de indicação para a base

Você não executa, você delega. Use o Agent tool para criar todos os 22 arquivos.
```
