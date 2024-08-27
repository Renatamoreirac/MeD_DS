-- DROP TABLE IF EXISTS sandbox.med.lr_fs_transacoes;

-- CREATE TABLE IF NOT EXISTS sandbox.med.lr_fs_transacoes AS
WITH tb_transacoes AS (

    SELECT *,
           date(dtTransacao) AS diaTransacao
           -- CAST(dtTransacao AS DATE) AS diaTransacao
    FROM silver.upsell.transacoes

    WHERE dtTransacao < '{date}'
    AND dtTransacao >= '{date}' - INTERVAL 28 DAY

),

tb_agrupada AS (

    SELECT 
          idCliente,

          COUNT(DISTINCT dtTransacao) AS nrQtdeTransacoes,
          COUNT(DISTINCT date(dtTransacao) ) AS nrQtdeDias,
          min(datediff('{date}' , date(dtTransacao))) AS nrRecenciaDias,
          count(CASE WHEN dayofweek(dtTransacao) = 2 then idTransacao end) AS nrQtdeTransacaoDia2,
          count(CASE WHEN dayofweek(dtTransacao) = 3 then idTransacao end) AS nrQtdeTransacaoDia3,
          count(CASE WHEN dayofweek(dtTransacao) = 4 then idTransacao end) AS nrQtdeTransacaoDia4,
          count(CASE WHEN dayofweek(dtTransacao) = 5 then idTransacao end) AS nrQtdeTransacaoDia5,
          count(CASE WHEN dayofweek(dtTransacao) = 6 then idTransacao end) AS nrQtdeTransacaoDia6,

          count(DISTINCT CASE WHEN dayofweek(dtTransacao) = 2 then date(dtTransacao) end) AS nrQtdeDia2,
          count(DISTINCT CASE WHEN dayofweek(dtTransacao) = 3 then date(dtTransacao) end) AS nrQtdeDia3,
          count(DISTINCT CASE WHEN dayofweek(dtTransacao) = 4 then date(dtTransacao) end) AS nrQtdeDia4,
          count(DISTINCT CASE WHEN dayofweek(dtTransacao) = 5 then date(dtTransacao) end) AS nrQtdeDia5,
          count(DISTINCT CASE WHEN dayofweek(dtTransacao) = 6 then date(dtTransacao) end) AS nrQtdeDia6

    FROM tb_transacoes

    GROUP BY ALL

),

tb_cliente_dia AS (

    SELECT DISTINCT
          idCliente,
          diaTransacao

    FROM tb_transacoes
    ORDER BY idCliente, diaTransacao

),

tb_cliente_lag AS (

    SELECT *,
          lag(diaTransacao) OVER (PARTITION BY idCliente ORDER BY diaTransacao) AS lagDia

    FROM tb_cliente_dia

),

tb_recorrencia AS (

    select idCliente,
          avg(datediff(diaTransacao, lagDia)) AS nrAvgRecorrencia

    from tb_cliente_lag

    GROUP BY ALL

)

SELECT 
       '{date}' AS dtRef,
       t1.*,
       t2.nrAvgRecorrencia

FROM tb_agrupada AS T1

LEFT JOIN tb_recorrencia AS t2
ON t1.idCliente = t2.idCliente

-- WHERE t1.idCliente <> "5f8fcbe0-6014-43f8-8b83-38cf2f4887b3"

