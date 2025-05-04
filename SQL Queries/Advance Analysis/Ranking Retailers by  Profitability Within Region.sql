-- Ranking Retailers Within Region by Total Profit --

WITH retailer_profit AS (
    SELECT 
        region,
        retailer,
        SUM(operating_profit) AS total_profit
    FROM sport_products
    GROUP BY region, retailer
)
SELECT 
    region,
    retailer,
    total_profit,
    RANK() OVER (PARTITION BY region ORDER BY total_profit DESC) AS profit_rank
FROM retailer_profit
ORDER BY region, profit_rank;