# Sales Analytics Project

## Project Overview

This project analyzes sales data using SQL to answer key business questions about revenue, customers, products, and sales trends.

## Database Schema

The project contains three tables:

### Customers
- customer_id
- customer_name
- city

### Products
- product_id
- product_name
- category
- price

### Orders
- order_id
- customer_id
- product_id
- quantity
- order_date

## SQL Skills Demonstrated

- INNER JOIN
- LEFT JOIN
- GROUP BY
- Aggregations (SUM, COUNT)
- Common Table Expressions (CTEs)
- Window Functions
  - DENSE_RANK()
  - ROW_NUMBER()
  - LAG()
  - SUM() OVER()

## Business Questions Answered

1. Total Revenue
2. Top Selling Product
3. Top Customer by Revenue
4. Monthly Revenue
5. Revenue by Category
6. Number of Orders by Customer
7. Customers with No Orders
8. Top 3 Customers by Revenue
9. Top 3 Products by Revenue
10. Rank Customers by Revenue
11. Top Customer(s) by Revenue
12. Running Monthly Revenue
13. Best-Selling Product in Each Category
14. Month-over-Month Revenue Growth

## Files

- create_tables.sql
- insert_data.sql
- analysis_queries.sql

## Tools Used

- MySQL
- MySQL Workbench
- VS Code
- GitHub

## What I Learned

- How to join multiple tables
- How to calculate business KPIs like revenue
- How to use CTEs to simplify complex queries
- How to use window functions such as ROW_NUMBER, DENSE_RANK, and LAG

## Author

Asha