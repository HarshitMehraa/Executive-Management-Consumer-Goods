-- Get the Top 3 products in each division that have a hightotal_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields- division, product_code, product, total_sold_quantity, rank_order

WITH cte1 AS
(SELECT dp.division, dp.product_code, dp.product, SUM(fsm.sold_quantity) AS total_sold_qty,
RANK() OVER(PARTITION BY dp.division ORDER BY SUM(fsm.sold_quantity) DESC) AS Top3ranks
FROM dim_product AS dp JOIN fact_sales_monthly AS fsm
ON dp.product_code = fsm.product_code
WHERE fsm.fiscal_year = 2021
GROUP BY dp.product_code)

SELECT * FROM cte1
WHERE Top3ranks IN (1,2,3);