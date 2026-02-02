-- =========================================
-- Superstore Sales Analysis
-- Database: superstore_db
-- =========================================

-- 1. Check total number of records
SELECT COUNT(*) AS total_rows
FROM clean_superstore;

-- 2. Total Sales
SELECT ROUND(SUM(sales), 2) AS total_sales
FROM clean_superstore;

-- 3. Total Profit
SELECT ROUND(SUM(profit), 2) AS total_profit
FROM clean_superstore;

-- 4. Category-wise Sales
SELECT 
    category,
    ROUND(SUM(sales), 2) AS category_sales
FROM clean_superstore
GROUP BY category
ORDER BY category_sales DESC;

-- 5. Top 10 Profitable Products
SELECT 
    product_name,
    ROUND(SUM(profit), 2) AS product_profit
FROM clean_superstore
GROUP BY product_name
ORDER BY product_profit DESC
LIMIT 10;

-- 6. Loss-Making Products
SELECT 
    product_name,
    ROUND(SUM(profit), 2) AS loss
FROM clean_superstore
GROUP BY product_name
HAVING loss < 0
ORDER BY loss;
