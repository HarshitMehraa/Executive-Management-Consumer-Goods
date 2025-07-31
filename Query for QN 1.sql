-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region

SELECT 
    Market
FROM
    dim_customer
WHERE
    customer = 'Atliq Exclusive'
        AND region = 'APAC'
GROUP BY Market;