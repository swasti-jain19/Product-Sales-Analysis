-- 1. Sales by Region (Quarterly) --

SELECT DATE_PART('quarter', invoice_date) AS quarter, region, 
	SUM(total_sales) total_sales 
	FROM sport_products 
	GROUP BY quarter, region 
	ORDER BY quarter, region;

-- 2. Regional Sales Contribution --

SELECT region, 
	SUM(total_sales) total_sales, 
	ROUND(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER (), 2) AS percentage_contribution 
	FROM sport_products 
	GROUP BY region 
	ORDER BY total_sales DESC;

-- 3. Sales by State --

SELECT state, 
	SUM(total_sales) total_sales 
	FROM sport_products 
	GROUP BY state 
	ORDER BY total_sales DESC;

-- 4. Average Sale Value by Region and Sales Method --
sql
Copy
Edit
SELECT
    region,
    sales_method,
    ROUND(AVG(total_sales), 2) AS avg_sale_value
FROM sport_products
GROUP BY region, sales_method
ORDER BY region, avg_sale_value DESC; 


-- 5. Retailer Sales Decomposition (Retailer + Sales Method) --

SELECT retailer, 
	sales_method, 
	SUM(total_sales) total_sales FROM sport_products 
	GROUP BY retailer, sales_method 
	ORDER BY retailer, total_sales DESC;

--6. Sales by Retailer & Product --

SELECT retailer, 
	product, 
	SUM(total_sales) as total_sales FROM sport_products 
	GROUP BY retailer, product 
	ORDER BY retailer, total_sales DESC;