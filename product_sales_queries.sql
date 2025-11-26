-- SECTION 1: Sales Performance & Revenue Analysis
-- Focus: High-level financial metrics.
-- Q1. Total Revenue and Profit by Year. How is the company performing year over year?

SELECT "Year",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue",
	TO_CHAR(SUM("Profit"), '$FM999,999,999.00') AS "Total Profit"
FROM sales
GROUP BY 1
ORDER BY 1;
	
-- Q2. Top 10 Best-Selling Products. Which products generate the most revenue?

SELECT "Product_Name" AS "Product Name",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue",
	SUM("Quantity") AS "Units Sold"
FROM sales
GROUP BY "Product Name"
ORDER BY SUM("Revenue") DESC
LIMIT 10;

-- Q3. Best Performing Categories. Which product category is the most profitable?

SELECT "Category",
	"Margin",
	TO_CHAR(SUM("Profit"), '$FM999,999,999.00') AS "Total Profit"
FROM sales
GROUP BY "Category", "Margin"
ORDER BY SUM("Profit") DESC
LIMIT 1;

-- Q4. Monthly Sales Trend (Seasonality). Which month generates the highest sales historically?

SELECT "Month", "Month_Name",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue"
FROM sales
GROUP BY "Month", "Month_Name"
ORDER BY SUM("Revenue") DESC
LIMIT 1;

-- SECTION 2: Customer Insights
-- Focus: Who are our customers?
-- Q5. Top 5 VIP Customers. Who are the customers spending the most money?

SELECT "Customer_Name", "City",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Spent",
	COUNT(*) AS "Order Count"
FROM sales
GROUP BY "Customer_Name", "City"
ORDER BY SUM("Revenue") DESC
LIMIT 5;

-- Q6. Average Order Value (AOV). How much does an average customer spend per transaction?

SELECT TO_CHAR(AVG("Revenue"), '$FM999,999,999.00') AS "Average Order Value"
FROM sales

-- Q7. Customer Loyalty Analysis (Frequency). Who are our most frequent buyers?

SELECT "Customer_Name" AS "Customer Name",
	COUNT(*) AS "Order Count"
FROM sales
GROUP BY "Customer Name"
ORDER BY "Order Count" DESC
LIMIT 10;

-- SECTION 3: Geographical Analysis
-- Focus: Where are the sales coming from?
-- Q8. Revenue by Region. Which region is the strongest in terms of sales?

SELECT "Region",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue"
FROM sales
GROUP BY "Region"
ORDER BY SUM("Revenue") DESC
LIMIT 1;

-- Q9. Best & Worst States for Profit. Which US State is the most profitable and which is the least?

(SELECT 'Most Profitable' AS "Type",
	"State",
	TO_CHAR(SUM("Profit"), '$FM999,999,999.00') AS "Total Profit"
FROM sales
GROUP BY "State"
ORDER BY SUM("Profit") DESC
LIMIT 1)
UNION ALL 
(SELECT 'Least Profitable' AS "Type",
	"State",
	TO_CHAR(SUM("Profit"), '$FM999,999,999.00') AS "Total Profit"
FROM sales
GROUP BY "State"
ORDER BY SUM("Profit") ASC
LIMIT 1);

-- Q10. City performance Analysis. What are top 5 cities contributing to revenue?

SELECT "City",
	"State",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue"
FROM sales
GROUP BY "City", "State"
ORDER BY SUM("Revenue") DESC
LIMIT 5;

-- SECTION 4: Product & Operations
-- Focus: Operational efficiency
-- Q11. Sales by Sub-Category. Which specific sub-categories are driving the business?

SELECT "Sub_Category" AS "Sub-Category",
	SUM("Quantity") AS "Total Quantity Sold",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue"
FROM sales
GROUP BY "Sub-Category"
ORDER BY SUM("Revenue") DESC
LIMIT 5;

-- Q12. Products with Low Margins. Which products have the lowest profit margin? (Potential to stop selling)

SELECT "Sub_Category" AS "Sub-Category",
	"Product_Name" AS "Product Name",
	"Margin"
FROM sales
ORDER BY "Margin" ASC
LIMIT 10;

-- Q13. Quantity Analysis: Who buys in bulk? What is the average quantity of items purchased per order by Region?

SELECT "Region",
	ROUND(AVG("Quantity"), 1) AS "Average Quantity"
FROM sales
GROUP BY "Region"
ORDER BY "Region" ASC;

-- Q14. Most Popular Product in Each Region. What is the #1 selling product in each region?

WITH RankedProducts AS (
	SELECT "Region",
		"Product_Name",
		SUM("Revenue") AS "Region Revenue",
		ROW_NUMBER() OVER(
			PARTITION BY "Region" 
			ORDER BY SUM("Revenue") DESC) AS "Rank"
		FROM sales
		GROUP BY "Region", "Product_Name"
)
SELECT "Region",
	"Product_Name" AS "Product Name",
	TO_CHAR("Region Revenue", '$FM999,999,999.00') AS "Region Revenue"
FROM RankedProducts
WHERE "Rank"=1;

-- SECTION 5: Advanced Insights (Deep Dive)
-- Q15. Weekend vs Weekday Sales. Do we sell more on weekends?

SELECT 
	CASE WHEN EXTRACT(ISODOW FROM "Order_Date") IN (6,7) THEN 'Weekend'
	ELSE 'Weekday'
	END AS "Day Type",
	TO_CHAR(SUM("Revenue"), '$FM999,999,999.00') AS "Total Revenue",
	TO_CHAR(AVG("Revenue"), '$FM999,999,999.00') AS "Average Revenue"
FROM sales
GROUP BY "Day Type";
	
-- Q16. Pareto Principle (80/20 Rule). Checking if top 20% customers bring 80% of profit?



-- Q17. Year-over-Year Growth (YoY). Calculating growth between 2023 and 2024

-- Q18. Top Perfoming Sales Reps or Stores. Which states have consistently high orders (>100 orders)?

-- Q19. Product Affinity (Basket Analysis). Which sub-categories appear most?

-- Q20. Loss Leaders. Which products have high sales volume but very low profit?