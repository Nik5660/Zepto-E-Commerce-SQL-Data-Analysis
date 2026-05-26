## 📌 **Project Overview**

This project focuses on data cleaning, exploration, and comprehensive business analysis of an e-commerce dataset from Zepto (a prominent quick-commerce platform).
Using **MySQL Workbench**, I built the database architecture from scratch, handled data anomalies (such as misformatted data and pricing scales).
Executed business-critical queries to extract actionable insights regarding inventory management, pricing strategies, and revenue optimization.

## 🔄 Project Workflow

### 1. Database Setup & Architecture
* **Database Creation:** Initialized a dedicated schema (`zepto_sql_project`) to maintain data isolation.
* **Data Import:** Ingested the raw `zepto.csv` data and optimized table attributes.

### 2. Exploratory Data Analysis (EDA)
* **Record Count:** Audited the total dataset size to establish a baseline for cleaning.
* **Structural Review:** Examined a snapshot of the dataset to verify initial data integrity.
* **Null Value Audit:** Scanned all key transactional attributes for missing values.
* **Categorical Mapping:** Extracted unique product categories to map out inventory depth.
* **Availability Metrics:** Compared in-stock vs. out-of-stock product counts to gauge inventory health.
* **Duplicate Detection:** Identified repeated product names to track overlapping SKUs.

### 3. Data Cleaning & Transformation
* **Anomaly Elimination:** Isolated and purged invalid transactional records where the MRP or selling price was recorded as zero.
* **Currency Standardization:** Identified a data scaling issue (prices ingested in paisa) and converted `mrp` and `discountedSellingPrice` to Rupees for downstream accuracy.

### 4. Business Intelligence & Insights
* **Discount Optimization:** Ranked the top 10 best-value products using discount percentages.
* **Stockout Risk Identification:** Tracked high-MRP items currently out of stock to point out direct revenue leakage.
* **GMV Estimation:** Estimated projected revenue metrics aggregated by product category.
* **Pricing Strategy Audit:** Flagged high-ticket products (MRP > ₹500) paired with low discounts (< 10%).
* **Category Performance:** Ranked the top 5 product categories offering the highest average discount.
* **Unit Economics:** Computed a custom metric for price-per-gram to determine true product value.
* **Inventory Classification:** Used conditional logic to segment products into "Low", "Medium", and "Bulk" weight categories.
* **Supply Chain Volume:** Computed the cumulative physical weight of inventory grouped by category.
