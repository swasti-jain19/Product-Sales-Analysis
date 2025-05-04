-- Sales Method Performance across Regions --

WITH method_sales AS (
    SELECT 
        region,
        sales_method,
        SUM(total_sales) AS method_sales
    FROM sport_products
    GROUP BY region, sales_method
)
SELECT 
    region,
    sales_method,
    method_sales,
    ROUND(method_sales * 100.0 / SUM(method_sales) OVER (PARTITION BY region), 2) AS method_share_in_region
FROM method_sales
ORDER BY region, method_share_in_region DESC;