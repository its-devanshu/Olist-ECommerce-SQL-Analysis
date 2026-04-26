–Driving Business Insights: Advanced SQL Analysis of the Olist E-Commerce Dataset.

Executive Summary:
This project transforms raw transactional data from the Brazilian Olist e-commerce ecosystem into business intelligence. By leveraging advanced SQL techniques—including Common Table Expressions (CTEs), Window Functions, and complex relational joins—I developed a suite of queries designed to optimize logistics, identify high-value customer segments, and track longitudinal financial growth.

Strategic Business Solutions:
*Revenue Velocity & Financial Forecasting: Implemented Window Functions to calculate cumulative running totals, providing a granular view of daily and monthly revenue trends.
*Customer Lifetime Value (CLV) Segmentation: Engineered multi-tier CTEs to isolate "Whale" accounts (LTV > $1,000), enabling data-driven VIP marketing strategies.
*Logistics Efficiency & SLA Monitoring: Developed a performance monitoring framework to identify delivery bottlenecks by state, comparing estimated vs. actual fulfillment dates to pinpoint regional supply chain friction.
*Competitive Merchandising Analytics: Utilized PARTITION BY logic to rank product pricing within specific categories, offering insights into market positioning and pricing strategy.

Technical Competencies:
*Advanced Data Modeling: Executed multi-table JOIN operations across 5+ relational tables to synthesize comprehensive datasets.
*Operational Logic: Applied complex CASE WHEN statements to categorize products by physical attributes and payment tiers.
*Modular Query Design: Utilized WITH clauses (CTEs) to create readable, maintainable, and high-performance SQL scripts.
*Data Integrity: Implemented robust filtering and validation layers to handle missing values and maintain accuracy in final reporting.

Repository Structure:
01_Foundations_Filtering.sql: Exploratory data analysis and ad-hoc operational filtering.
02_Aggregations_Grouping.sql: Summary statistics and bucketed KPI analysis.
03_Relational_Joins.sql: Synthesizing data across the Olist schema (Orders, Customers, Products).

04_Business_Logic_CTEs.sql: Advanced segmentation and multi-step data transformations.
05_Advanced_Window_Functions.sql: Ranking, partitioning, and longitudinal financial tracking.

Logistics_Performance.sql: Dedicated SLA monitoring and geographic delay analysis.

Data Source:
The data utilized in this project is sourced from the Brazilian E-Commerce Public Dataset by Olist, available on Kaggle.
Source: [Kaggle - Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
