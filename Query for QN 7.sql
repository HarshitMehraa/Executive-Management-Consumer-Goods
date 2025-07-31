-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: Month, Year, Gross sales Amount

SELECT 
    YEAR(fsm.date) AS year,
    MONTH(fsm.date) AS month,
    SUM(fgp.gross_price * fsm.sold_quantity) AS sales_amount
FROM
    fact_sales_monthly AS fsm
        INNER JOIN
    fact_gross_price AS fgp ON fsm.product_code = fgp.product_code
        INNER JOIN
    dim_customer AS dc ON fsm.customer_code = dc.customer_code
WHERE
    dc.customer = 'Atliq Exclusive'
GROUP BY year , month
ORDER BY year;