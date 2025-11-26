# Sales Performance & Profitability Dashboard

![Power BI Banner](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

## Executive Summary
This end-to-end data analytics project analyzes sales data to identify key revenue drivers, optimize product portfolio, and segment customers.

The goal was to transform raw transaction data into actionable business insights using a full-stack approach: **ETL with Python**, **Data Warehousing with PostgreSQL**, and **Interactive Storytelling with Power BI**.

**Key Achievements:**
* Processed **200,000 sales records** ensuring data integrity.
* Identified high-margin product categories vs volume drivers.
* Created a dynamic dashboard allowing drill-down analysis into specific regions and timeframes.

---

## Dashboard Preview

### 1. Executive Overview
*High-level KPIs showing Revenue, Profit, and Year-over-Year growth.*
![Executive Overview](path_to_your_screenshot_1.png)

### 2. Product Performance & Decomposition Tree
*Deep dive into product margins using Scatter Plots and AI-based Decomposition Trees.*
![Product Analysis](path_to_your_screenshot_2.png)

---

## Tech Stack & Workflow

The project follows a standard industry pipeline:

### 1. Data Engineering (Python & Pandas)
* **Data Cleaning:** Handled missing values, standardized column names, and corrected data types.
* **Feature Engineering:** Created new metrics such as `Margin` and extracted date attributes (`Month`, `Year`) for time-series analysis.
* **Validation:** Automated sanity checks to ensure `Revenue = Quantity * Unit Price`.
* *Library used:* `Pandas`, `SQLAlchemy`.

### 2. Data Warehousing (PostgreSQL)
* Established a connection between Python and a local **PostgreSQL** database.
* Designed a structured SQL schema (`sales_data` table).
* Loaded cleaned data using the `to_sql` method for efficient storage and querying.

### 3. Data Analysis (Advanced SQL)
Executed complex queries to uncover trends before visualization. Key techniques used:
* **Window Functions (`NTILE`, `RANK`)**: To segment top 5% customers.
* **CTEs (Common Table Expressions)**: For readability in complex aggregations.
* **Aggregations**: Monthly trend analysis and regional performance.

### 4. Data Visualization (Power BI)
Built an interactive 3-page report:
* **Data Modeling:** Created DAX measures for `Total Revenue`, `AOV`, `Profit Margin %`.
* **UX/UI Design:** Used Data Bars, dynamic titles, and consistent color themes.
* **Advanced Visuals:** Utilized **Decomposition Trees** for root-cause analysis.

---

## Key Insights Derived

1.  **Profitability vs. Volume:** While *Electronics* generate the highest revenue, *Accessories* provide a better profit margin (15%+), suggesting a potential pivot in marketing strategy.
2.  **Customer Loyalty:** The top 20% of customers contribute to nearly 60% of total revenue (Pareto Principle confirmed).
3.  **Regional Trends:** The *South Region* underperforms in Q3; investigation via the Decomposition Tree revealed specific sub-categories causing the dip.

---

## Repository Structure

```text
├── data/
│   ├── product_sales_dataset_final.csv            # Original dataset
├── product_sales_queries.sql  # 20+ SQL queries answering business questions
├── product_sales_analysis.ipynb
├── screenshots/                  # Images for this README
└── README.md                   # Project documentation
How to Run
Clone the repository:

Bash

git clone [https://github.com/your-username/sales-analytics-portfolio.git](https://github.com/your-username/sales-analytics-portfolio.git)
Install dependencies:

Bash

pip install pandas sqlalchemy psycopg2
Run the ETL script: Update your database credentials in etl_pipeline.py and run the script to load data into PostgreSQL.

Explore SQL: Open business_questions.sql in pgAdmin to run the analysis.

View Dashboard: Open the .pbix file (if provided) or view screenshots.
