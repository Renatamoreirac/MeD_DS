DROP TABLE IF EXISTS sandbox.med.lr_abt_churn;
CREATE TABLE IF NOT EXISTS sandbox.med.lr_abt_churn AS

WITH tb_cliente_dia AS (
  SELECT DISTINCT
        idCliente,
        date(dtTransacao) AS diaTransacao
  FROM silver.upsell.transacoes
),

tb_clientes_fl AS (

    SELECT t1.dtRef,
          t1.idCliente,
          max(CASE WHEN t2.idCliente IS NULL THEN 1 ELSE 0 END) flChurn

    FROM sandbox.med.lr_fs_transacoes AS t1

    LEFT JOIN tb_cliente_dia AS t2
    ON t1.idCliente = t2.idCliente
    AND t1.dtRef <= t2.diaTransacao
    AND t1.dtRef > t2.diaTransacao - INTERVAL 28 DAY

    GROUP BY ALL

),

tb_churn AS (
    SELECT *
    FROM tb_clientes_fl
    QUALIFY row_number() OVER (PARTITION BY idCliente ORDER BY RAND() DESC) = 1
)

SELECT t1.dtRef,
       t1.idCliente,
       t1.flChurn,
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
        t2.nrQtdeTransacaoDia2,
        t2.nrQtdeTransacaoDia3,
        t2.nrQtdeTransacaoDia4,
        t2.nrQtdeTransacaoDia5,
        t2.nrQtdeTransacaoDia6,
        t2.nrQtdeDia2,
        t2.nrQtdeDia3,
        t2.nrQtdeDia4,
        t2.nrQtdeDia5,
        t2.nrQtdeDia6,
        t2.nrAvgRecorrencia

FROM tb_churn AS t1

LEFT JOIN sandbox.med.lr_fs_transacoes AS t2
ON t1.idCliente = t2.idCliente
AND t1.dtRef = t2.dtRef

LEFT JOIN sandbox.med.lr_fs_pontos AS t3
ON t1.idCliente = t3.idCliente
AND t1.dtRef = t3.dtRef


WHERE t1.idCliente <> "5f8fcbe0-6014-43f8-8b83-38cf2f4887b3"
AND t1.dtRef < '2024-08-01'
