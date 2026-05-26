📌 **Project Overview**

This project focuses on data cleaning, exploration, and comprehensive business analysis of an e-commerce dataset from Zepto (a prominent quick-commerce platform).
Using **MySQL Workbench**, I built the database architecture from scratch, handled data anomalies (such as misformatted data and pricing scales).
Executed business-critical queries to extract actionable insights regarding inventory management, pricing strategies, and revenue optimization.

**Project Workflow**

Database Creation

Data Import

Data Exploration

Counted the total number of records in the dataset

Viewed a sample of the dataset to understand structure and content

Checked for null values across all columns

Identified distinct product categories available in the dataset

Compared in-stock vs out-of-stock product counts

Detected products present multiple times, representing different SKUs


Data Cleaning
Identified and removed rows where MRP or discounted selling price was zero

Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability



Business Insights
Found top 10 best-value products based on discount percentage

Identified high-MRP products that are currently out of stock

Estimated potential revenue for each product category

Filtered expensive products (MRP > ₹500) with minimal discount

Ranked top 5 categories offering highest average discounts

Calculated price per gram to identify value-for-money products

Grouped products based on weight into Low, Medium, and Bulk categories

Measured total inventory weight per product category
