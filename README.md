# MeD_Data_Science

## Grupo 1: Renata Costa, Leila, Marielle e Samara 

### Sobre o Projeto
Este projeto foi criado durante o workshop ministrado por Teo Me Why, em parceria com Mulheres em Dados. O objetivo principal é desenvolver um modelo de machine learning para analisar a probabilidade de churn entre os usuários do canal Teo Me Why.

### Ambiente de Desenvolvimento
- **Plataforma:** DataBricks

### Objetivo do Projeto
Criar e implementar um modelo de machine learning que preveja a probabilidade de churn dos usuários. O projeto abrange desde a criação de feature stores até a implementação de pipelines e predições finais.

### O que foi feito:

1. **Criação das Tabelas SQL para Feature Store:**
   - Tabelas criadas: `lr_fs_pontos` e `lr_fs_transacoes`.

2. **Notebook Feature Store:**
   - Notebook criado: `Feature_Store_Notebook` para gerar as feature stores no schema `sandbox.med` no DataBricks.

3. **Criação da ABT (Analytical Base Table):**
   - Tabela ABT criada: `lr_abt_churn`.
   - Features incluídas:
     - `t3.nrSomaPontos`
     - `t3.nrSomaPontosPos`
     - `t3.nrSomaPontosNeg`
     - `t3.nrTicketMedio`
     - `t3.nrTicketMedioPos`
     - `t3.nrTicketMedioNeg`
     - `t3.nrPontosDia`
     - `t2.nrQtdeTransacoes`
     - `t2.nrQtdeDias`
     - `t2.nrRecenciaDias`
     - `t2.nrQtdeTransacaoDay2`
     - `t2.nrQtdeTransacaoDay3`
     - `t2.nrQtdeTransacaoDay4`
     - `t2.nrQtdeTransacaoDay5`
     - `t2.nrQtdeTransacaoDay6`
     - `t2.nrQtdeDay2`
     - `t2.nrQtdeDay3`
     - `t2.nrQtdeDay4`
     - `t2.nrQtdeDay5`
     - `t2.nrQtdeDay6`
     - `t2.nrAvgRecorrencia`

4. **Treinamento do Modelo:**
   - Processo de treinamento realizado utilizando a metodologia SEMMA.
   - Treinado e testado nosso modelo usando árvore de decisão, random forest e adaboost
   - Documentação completa no arquivo em html `Treinamento_ML`.

5. **Criação da Pipeline de Machine Learning:**
   - Notebook criado: `Pipeline`.
   - Definição e implementação do modelo de machine learning.

6. **Predição e Análise dos Resultados:**
   - Resultado final inclui a probabilidade de churn e análise dos dados.

### Como Utilizar
- **Ambiente:** DataBricks.
- **Passos:** Execute os notebooks na ordem indicada para recriar o ambiente, treinar o modelo e realizar predições.

### Agradecimentos
Agradecemos ao Teo Me Why e à comunidade Mulheres em Dados pelo suporte e colaboração durante o workshop.
