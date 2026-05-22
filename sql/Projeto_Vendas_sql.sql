-- =========================================
-- AJUSTE DO TIPO NUMÉRICO DOS PRODUTOS
-- =========================================
SELECT custo
FROM t_produtos;

SELECT
    custo,
    CASE
        WHEN custo < 10000 THEN custo / 10
        ELSE custo / 100
    END AS custo_corrigido
FROM t_produtos;

CREATE VIEW vw_produtos AS
SELECT
    id_produto,
    produto,
    TRIM(categoria) AS categoria,

    CASE
        WHEN custo < 10000 THEN custo / 10
        ELSE custo / 100
    END AS custo

FROM t_produtos;

-- =========================================
-- PADRONIZAÇÃO DA CATEGORIA
-- Removendo espaços em branco
-- =========================================
UPDATE t_produtos
SET categoria = TRIM(categoria);

-- =========================================
-- CRIAÇÃO COLUNA DE FATURAMENTO
-- =========================================
ALTER TABLE t_vendas
ADD Faturamento DECIMAL(10, 2);

UPDATE t_vendas
SET faturamento = quantidade * preco_unitario;
