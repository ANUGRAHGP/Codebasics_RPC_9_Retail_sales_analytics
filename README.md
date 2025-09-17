# Codebasics_RPC_9_Retail_sales_analytics
Provided insights to marketing team on product sales performance before and after promotions (offers) during diwali and sankarnti in stores across different cities.
🛒 Atliq Stores – Sales Analytics

This project analyzes Atliq Stores sales performance using SQL and an interactive BI Dashboard.
The goal is to uncover insights on revenue, campaign effectiveness, and product/category performance.

📂 Repository Structure
├── atliq_sales_dump.sql     # SQL dump file with all tables (fact & dimension data)
├── dashboard/               # BI dashboard files (Power BI / Tableau / Looker Studio export)
└── README.md                # Project documentation

🗄️ Dataset Overview

The SQL dump contains fact and dimension tables:

fact_events → Sales transactions (base price, quantity sold, campaign mapping)

dim_campaigns → Marketing campaigns and metadata

dim_products → Product details (category, product name, product code)

dim_stores → Store information and attributes

dim_customers → Customer details

🔍 Key Analysis Performed

Revenue Impact of Promotions

Compared before vs. after promotion revenue at product and campaign level.

Normalized results into millions (M) for easy interpretation.

Incremental Sales Uplift (ISU%)

Calculated sales lift % for products/categories after promotions.

Ranked products & categories using window functions (DENSE_RANK).

Incremental Revenue % (IR%) by Product

Analyzed product-level revenue change due to promotions.

Identified top-performing and under-performing SKUs.

Campaign Performance

Total revenue generated before vs. after campaigns.

Ranked campaigns by effectiveness.

📊 BI Dashboard

The dashboard highlights:

📈 Revenue trends (before & after promotions)

🏷️ Top campaigns & their ROI impact

🛍️ Best-performing products & categories

🏬 Store-level performance comparison

⚙️ Tools & Skills Used

SQL (CTEs, Window Functions, Aggregations, Joins, Recursive Queries)

BI Tool (Power BI / Tableau / Looker Studio – whichever you used)

Data Modeling (fact & dimension schema)

Data Cleaning & Transformation

🚀 How to Use

Import the SQL dump (atliq_sales_dump.sql) into your SQL engine (MySQL / PostgreSQL).

Run the SQL queries (provided in repo / dashboard backend).

Open the BI dashboard file (dashboard/) to explore insights.

📌 Key Learnings

Practical use of SQL for business analytics.

Measuring promotion effectiveness using ISU% and IR%.

Applying window functions for ranking insights.

Designing dashboards to present actionable KPIs.

🔮 Future Improvements

Add customer segmentation analysis.

Build predictive models for sales forecasting.

Automate ETL pipelines for real-time dashboards.

✨ This project showcases end-to-end sales analytics: from raw SQL data to interactive business insights.
