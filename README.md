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
# output for 7. question:
<img width="402" height="327" alt="ques7_Customers_with_No_Orders" src="https://github.com/user-attachments/assets/ce33beaa-9564-480a-b5ee-7b0a651a6a8d" />

8. Top 3 Customers by Revenue
9. Top 3 Products by Revenue
10. Rank Customers by Revenue
# output for 10. question:
<img width="522" height="561" alt="ques10_ Rank_Customers_by_Revenue " src="https://github.com/user-attachments/assets/b97fe13d-5686-4852-a602-901da56d110b" />

11. Top Customer(s) by Revenue
12. Running Monthly Revenue
# output for 12. question:
<img width="500" height="482" alt="query12_running_revenue" src="https://github.com/user-attachments/assets/1cf91b6f-41f4-4182-991d-e82c6348f49d" />

13. Best-Selling Product in Each Category
# output for 13. question:
<img width="422" height="532" alt="ques13_Best-Selling Product" src="https://github.com/user-attachments/assets/5d5f9e73-fd2c-43c6-8d8e-933468164744" />

14. Month-over-Month Revenue Growth
# output for 14. question:
<img width="580" height="567" alt="query14_Month-over-Month_Growth" src="https://github.com/user-attachments/assets/2b051778-106a-4835-abd1-a826ba1eb3b7" />


## Files

- create_tables.sql
- insert_data.sql
- analysis_queries.sql

## Tools Used

- MySQL
- MySQL Workbench
- VS Code
- GitHub

## Key Findings

- Electronics drove 91% of total revenue
- Top 3 customers contributed 67% of total sales
- Month-over-month revenue peaked in March 2025

## Author

Asha
