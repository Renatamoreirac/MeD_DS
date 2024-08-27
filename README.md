# MeD - Data Science

## Grupo 1: Renata Costa, Leila Moreira, Marielle Miziara e Samara Lima

## Sobre o Projeto
Este projeto foi criado durante o workshop ministrado por Teo Me Why, em parceria com Mulheres em Dados. O objetivo principal é desenvolver um modelo de machine learning para analisar a probabilidade de churn entre os usuários do canal Teo Me Why.

## Ambiente de Desenvolvimento
- **Plataforma:** DataBricks

## Objetivo do Projeto
Criar e implementar um modelo de machine learning que preveja a probabilidade de churn dos usuários. O projeto abrange desde a criação de feature stores até a implementação de pipelines e predições finais.

**Churn** é uma métrica utilizada para mostrar o número de clientes que cancelam o serviço em um determinado período de tempo. Para o projeto foi estipulado o prazo de 28 dias.

## O que foi feito:
### Criação das Tabelas SQL para Feature Store:
- **Tabelas criadas:** lr_fs_pontos e lr_fs_transacoes.

### Notebook Feature Store:
- **Notebook criado:** Feature_Store_Notebook para gerar as feature stores no schema `sandbox.med` no DataBricks.

### Criação da ABT (Analytical Base Table):
- **Tabela ABT criada:** lr_abt_churn.
- **Features incluídas:**
  - t3.nrSomaPontos
  - t3.nrSomaPontosPos
  - t3.nrSomaPontosNeg
  - t3.nrTicketMedio
  - t3.nrTicketMedioPos
  - t3.nrTicketMedioNeg
  - t3.nrPontosDia
  - t2.nrQtdeTransacoes
  - t2.nrQtdeDias
  - t2.nrRecenciaDias
  - t2.nrQtdeTransacaoDay2
  - t2.nrQtdeTransacaoDay3
  - t2.nrQtdeTransacaoDay4
  - t2.nrQtdeTransacaoDay5
  - t2.nrQtdeTransacaoDay6
  - t2.nrQtdeDay2
  - t2.nrQtdeDay3
  - t2.nrQtdeDay4
  - t2.nrQtdeDay5
  - t2.nrQtdeDay6
  - t2.nrAvgRecorrencia

### Treinamento do Modelo:
- Processo de treinamento realizado utilizando a metodologia SEMMA.
- Modelo treinado e testado utilizando árvore de decisão, random forest e adaboost.
- Documentação completa no arquivo em HTML **Treinamento_ML** (obs: realizar download para visualizar no browser).

### Criação da Pipeline de Machine Learning:
- **Notebook criado:** Pipeline (obs: realizar download para visualizar no browser).
- Definição e implementação do modelo de machine learning.

### Predição e Análise dos Resultados:
- Resultado final inclui a probabilidade de churn e análise dos dados.
- Resultado pode ser visualizado no arquivo **Predição.html** (obs: realizar download para visualizar no browser).
- Para as respostas obtidas nos resultados da seção abaixo, foi realizado um Top20 com os principais clientes com probabilidade de churn visando analisar e planejar ações pautadas na redução do churn. 


## Resultados
Os resultados da análise de Churn podem ser utilizados em ações de CRM para reter clientes e evitar que deixem de utilizar o serviço. Com base nesses resultados, algumas estratégias que podem ser implementadas para prevenir o churn incluem:
- Enviar e-mails para clientes que estão há 15 dias sem acessar as lives.
- Oferecer pontos de incentivo para aqueles que participam de 2 ou 3 lives consecutivas.
- Focar nos temas das lives mais assistidas, ampliando a oferta de conteúdo relevante.
- Utilizar os dias e horários com maior audiência (terça e quarta)  para fidelizar os clientes e maximizar o engajamento.

## Como Utilizar
- **Ambiente:** DataBricks.
- **Passos:** Execute os notebooks na ordem indicada para recriar o ambiente, treinar o modelo e realizar predições (necessário verificação de acesso às tabelas no DataBricks).

## Agradecimentos
Agradecemos ao Teo Me Why e à comunidade Mulheres em Dados pelo suporte e colaboração durante o workshop.
