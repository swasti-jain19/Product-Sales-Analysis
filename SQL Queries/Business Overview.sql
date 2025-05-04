-- 1. KPI Summary --

SELECT
    SUM(total_sales) AS total_sales,
    SUM(operating_profit) AS total_profits,
    SUM(units_sold) AS total_units_sold,
    COUNT(*) AS total_orders
FROM sport_products;

-- 2. Total Sales by Product --

SELECT product, 
	SUM(total_sales) AS total_sales
	FROM sport_products 
	GROUP BY product 
	ORDER BY total_sales DESC;

-- 3. Average Sales per Unit by Product --

SELECT product, 
	ROUND(SUM(total_sales)::NUMERIC / NULLIF(SUM(units_sold), 0), 2) AS avg_sales_per_unit 
	FROM sport_products 
	GROUP BY product 
	ORDER BY avg_sales_per_unit DESC;

-- 4. Sales by Sales Method --

SELECT sales_method,
	SUM(total_sales) total_sales FROM sport_products 
	GROUP BY sales_method;

-- 5. Profit by Sales Method --

SELECT sales_method,
	SUM(operating_profit) AS total_profit 
	FROM sport_products 
	GROUP BY sales_method;

-- 6. Units Sold by Sales Method --

SELECT sales_method, 
	SUM(units_sold) AS total_units 
	FROM sport_products 
	GROUP BY sales_method;

-- 7. Operating Margin by Sales Method --

SELECT sales_method, 
	ROUND(SUM(operating_profit) / NULLIF(SUM(total_sales), 0), 2) AS operating_margin
	FROM sport_products 
	GROUP BY sales_method;