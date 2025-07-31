-- Follow-up: Which segment had the most increase in unique products in 
-- 2021 vs 2020? The final output contains these fields, segment, product_count_2020, product_count_2021 
-- difference

WITH cte1 AS (
SELECT dp.segment, COUNT(DISTINCT dp.product_code) AS product_count_2020
FROM dim_product dp
INNER JOIN  fact_sales_monthly fsm
ON dp.product_code = fsm.product_code
WHERE fsm.fiscal_year = 2020
GROUP BY segment
),
cte2 AS (
SELECT dp.segment, COUNT(DISTINCT dp.product_code) AS product_count_2021
FROM dim_product dp
INNER JOIN  fact_sales_monthly fsm
ON dp.product_code = fsm.product_code
WHERE fsm.fiscal_year = 2021
GROUP BY segment
)
SELECT cte1.segment, cte1.product_count_2020, cte2.product_count_2021, 
ROUND(((cte2.product_count_2021 - cte1.product_count_2020)/cte1.product_count_2020)*100, 2) AS percent_change
FROM cte1 INNER JOIN cte2
ON cte1.segment = cte2.segment 
GROUP BY segment
ORDER BY percent_change DESC;