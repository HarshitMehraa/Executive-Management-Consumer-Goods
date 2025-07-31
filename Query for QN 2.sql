-- What is the percentage of unique product increase in 2021 vs. 2020? The 
-- final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg

SELECT 
    UNQ20.X AS UNQ_Product_2020,
    UNQ21.Y AS UNQ_Product_2020,
    ROUND((Y - X) * 100/X, 2) AS Increase_percent
FROM
    ((SELECT 
        COUNT(DISTINCT (Product_code)) AS X
    FROM
        Fact_Sales_Monthly
    WHERE
        fiscal_year = 2020) AS UNQ20, (SELECT 
        COUNT(DISTINCT (Product_code)) AS Y
    FROM
        Fact_Sales_Monthly
    WHERE
        fiscal_year = 2021) AS UNQ21);