CREATE DATABASE zepto_SQL_project;
USE zepto_SQL_project;

RENAME TABLE `zepto.csv` TO zepto;
SHOW TABLES;

ALTER TABLE zepto
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE zepto
RENAME COLUMN `ï»¿Category` TO category;

SET SQL_SAFE_UPDATES = 0;

UPDATE zepto
SET outOfStock =
CASE
WHEN outOfStock = 'TRUE' THEN 1
WHEN outOfStock = 'FALSE' THEN 0
END;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE zepto
MODIFY COLUMN sku_id INT AUTO_INCREMENT,
MODIFY COLUMN category VARCHAR(120),
MODIFY COLUMN name VARCHAR(150) NOT NULL,
MODIFY COLUMN mrp DECIMAL(8,2),
MODIFY COLUMN discountPercent DECIMAL(5,2),
MODIFY COLUMN availableQuantity INT,
MODIFY COLUMN discountedSellingPrice DECIMAL(8,2),
MODIFY COLUMN weightInGms INT,
MODIFY COLUMN outOfStock BOOLEAN,
MODIFY COLUMN quantity INT;

-- data exploration

-- count of rows
SELECT COUNT(*) 
FROM zepto;

-- sample data
SELECT * 
FROM zepto
LIMIT 10;

-- null values
SELECT * 
FROM zepto
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discountPercent IS NULL
OR discountedSellingPrice IS NULL
OR weightInGms IS NULL
OR availableQuantity IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(*) AS total_products
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) AS total_sku
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- data cleaning
-- products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 
OR discountedSellingPrice = 0;
-- one product comes under this and that should not be here

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;
    
SET SQL_SAFE_UPDATES = 1;

-- data analysis 

-- Q1. Find the top 10 best-value products based on the discount percentage.
-- if product quantity or weight also matter
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. What are the Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = 1 
  AND mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;