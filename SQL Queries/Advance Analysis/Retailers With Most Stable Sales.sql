-- Retailers with Highest Consistency in Sales --
-- lower variance = more stable --

WITH retailer_monthly_sales AS (
    SELECT 
        retailer,
        DATE_TRUNC('month', invoice_date) AS month,
        SUM(total_sales) AS monthly_sales
    FROM sport_products
    GROUP BY retailer, month
)
SELECT 
    retailer,
    ROUND(STDDEV(monthly_sales), 2) AS sales_variance
FROM retailer_monthly_sales
GROUP BY retailer
ORDER BY sales_variance ASC
LIMIT 10;