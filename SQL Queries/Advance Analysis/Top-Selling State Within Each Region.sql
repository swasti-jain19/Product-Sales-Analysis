-- Region-Wise Best Performing State --

WITH state_sales AS (
    SELECT 
        region,
        state,
        SUM(total_sales) AS total_sales
    FROM sport_products
    GROUP BY region, state
),
ranked_states AS (
    SELECT 
        region,
        state,
        total_sales,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_sales DESC) AS state_rank
    FROM state_sales
)
SELECT 
    region,
    state AS top_state,
    total_sales
FROM ranked_states
WHERE state_rank = 1
ORDER BY region;
