CREATE TABLE sport_products (
    retailer TEXT,
    retailer_id INTEGER,
    invoice_date DATE,
    region TEXT,
    state TEXT,
    city TEXT,
    product TEXT,
    price_per_unit NUMERIC(10, 2),
    units_sold INTEGER,
    total_sales NUMERIC(12, 2),
    operating_profit NUMERIC(12, 2),
    operating_margin NUMERIC(5, 2),
    sales_method TEXT
);

COPY sport_products
FROM 'C:\DA\Projects\PowerBi\Product Sales Analysis\Sport-Products-Sales-Analysis_Challenge-7.csv'
DELIMITER ','
CSV HEADER;
