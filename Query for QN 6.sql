-- Generate a report which contains the top 5 customers who received an 
-- average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields, customer_code, customer, average_discount_percentage

SELECT 
    dc.customer_code,
    dc.customer,
    ROUND(AVG(fpid.pre_invoice_discount_pct) * 100,
            2) AS avg_discount
FROM
    dim_customer AS dc
        JOIN
    fact_pre_invoice_deductions AS fpid ON dc.customer_code = fpid.customer_code
WHERE
    fpid.fiscal_year = 2021
        AND dc.market = 'India'
GROUP BY dc.customer_code
ORDER BY avg_discount DESC
LIMIT 5;
