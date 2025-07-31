-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, product_code, product, manufacturing_cost 

(SELECT fmc.product_code, dp.product, MAX(fmc.manufacturing_cost) AS mfg_cost
FROM fact_manufacturing_cost AS fmc JOIN dim_product AS dp
ON fmc.product_code = dp.product_code
GROUP BY fmc.product_code 
ORDER BY mfg_cost DESC LIMIT 1)
UNION
(SELECT fmc.product_code, dp.product, MIN(fmc.manufacturing_cost) AS mfg_cost
FROM fact_manufacturing_cost AS fmc JOIN dim_product AS dp
ON fmc.product_code = dp.product_code
GROUP BY fmc.product_code
ORDER BY mfg_cost LIMIT 1);