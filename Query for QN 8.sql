-- In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter, total_sold_quantity

SELECT 
    CASE
        WHEN MONTH(date) IN (01 , 02, 03) THEN 'Q1'
        WHEN MONTH(date) IN (04 , 05, 06) THEN 'Q2'
        WHEN MONTH(date) IN (07 , 08, 09) THEN 'Q3'
        WHEN MONTH(date) IN (10 , 11, 12) THEN 'Q4'
    END AS Quarter,
    SUM(sold_quantity)
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY Quarter;