# MeD_Data_Science
Grupo 1: Renata Costa, Leila, Marielle  e Samara 
Projeto criado durante o workshop ministrado por Teo Me Why em parceria com Mulheres em Dados. 
Objetivo: 
Criar um modelo em machine learning para analisar a probabilidade dos usuários do canal Teo me why dar churn. 

Ambiente: DataBricks 
O quê:
1. Criação das tabelas em sql a serem usadas como feature store: lr_pontos e lr_transacoes
2. Criacao do notebook Feature_Store_Notebook para criar essas feature store no schema sandbox.med no databrics 
3. Criação da nossa ABT (lr_abt_churn) considerando as features:
       t3.nrSomaPontos,
       t3.nrSomaPontosPos,
       t3.nrSomaPontosNeg,
       t3.nrTicketMedio,
       t3.nrTicketMedioPos,
       t3.nrTicketMedioNeg,
       t3.nrPontosDia,
        t2.nrQtdeTransacoes,
        t2.nrQtdeDias,
        t2.nrRecenciaDias,
        t2.nrQtdeTransacaoDay2,
        t2.nrQtdeTransacaoDay3,
        t2.nrQtdeTransacaoDay4,
        t2.nrQtdeTransacaoDay5,
        t2.nrQtdeTransacaoDay6,
        t2.nrQtdeDay2,
        t2.nrQtdeDay3,
        t2.nrQtdeDay4,
        t2.nrQtdeDay5,
        t2.nrQtdeDay6,
        t2.nrAvgRecorrencia
4. Treinamento do nosso modelo usando SEMMA, todo o processo está documentado no notebook Treinamento_ML
5. Criação da nossa pipeline e definição do nosso modelo machine learning: Notebook Pipeline
6. Predição: Resultado final com a probabilidade de churn e análise dos dados 
