-- ==========================================
-- Query 1: Total Revenue
-- Question:
-- What is the total revenue generated from all orders?
-- ==========================================

SELECT SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;

-- ==========================================
-- Query 2: Top Selling Product
-- Question:
-- Which products sold the highest number of units?
-- ==========================================

SELECT p.product_name,
       SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- ==========================================
-- Query 3: Top Customer by Revenue
-- Question:
-- Which customer generated the highest revenue?
-- ==========================================

SELECT c.customer_name,
       SUM(o.quantity * p.price) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;

-- ==========================================
-- Query 4: Monthly Revenue
-- Question:
-- How much revenue was generated each month?
-- ==========================================

SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(o.quantity * p.price) AS revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- ==========================================
-- Query 5: Revenue by Category
-- Question:
-- Which product categories generate the most revenue?
-- ==========================================

SELECT p.category,
       SUM(o.quantity * p.price) AS revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- ==========================================
-- Query 6: Number of Orders by Customer
-- Question:
-- How many orders has each customer placed?
-- ==========================================

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

-- ==========================================
-- Query 7: Customers with No Orders
-- Question:
-- Which customers have never placed an order?
-- ==========================================

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- ==========================================
-- Query 8: Top 3 Customers by Revenue
-- Question:
-- Who are the top 3 customers based on revenue generated?
-- ==========================================

SELECT c.customer_name,
       SUM(o.quantity * p.price) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 3;

-- ==========================================
-- Query 9: Top 3 Products by Revenue
-- Question:
-- Which products generate the highest revenue?
-- ==========================================

SELECT p.product_name,
       SUM(o.quantity * p.price) AS revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 3;

-- ==========================================
-- Query 10: Rank Customers by Revenue
-- Question:
-- Rank all customers based on revenue generated.
-- ==========================================

WITH customer_revenue AS (
    SELECT c.customer_name,
           SUM(o.quantity * p.price) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name
)
SELECT customer_name,
       revenue,
       DENSE_RANK() OVER (ORDER BY revenue DESC) AS rank_position
FROM customer_revenue;

-- ==========================================
-- Query 11: Top Customer(s) by Revenue
-- Question:
-- Identify the highest revenue-generating customer(s),
-- including ties.
-- ==========================================
WITH customer_revenue AS (
    SELECT c.customer_name,
           SUM(o.quantity * p.price) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.customer_name
),
ranked_customers AS (
    SELECT customer_name,
           revenue,
           DENSE_RANK() OVER (ORDER BY revenue DESC) AS rnk
    FROM customer_revenue
)
SELECT customer_name,
       revenue
FROM ranked_customers
WHERE rnk = 1;


-- ==========================================
-- Query 12: Running Monthly Revenue
-- Question:
-- Calculate cumulative revenue over time.
-- ==========================================


WITH monthly_revenue AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           SUM(o.quantity * p.price) AS revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT month,
       revenue,
       SUM(revenue) OVER (ORDER BY month) AS running_revenue
FROM monthly_revenue;

-- ==========================================
-- Query 13: Best-Selling Product in Each Category
-- Question:
-- Which product sells the most units in each category?
-- ==========================================

WITH product_sales AS (
    SELECT p.category,
           p.product_name,
           SUM(o.quantity) AS total_quantity
    FROM products p
    JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY p.category, p.product_name
),
ranked_products AS (
    SELECT category,
           product_name,
           total_quantity,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY total_quantity DESC
           ) AS rnk
    FROM product_sales
)
SELECT category,
       product_name,
       total_quantity
FROM ranked_products
WHERE rnk = 1;

-- ==========================================
-- Query 14: Month-over-Month Revenue Growth
-- Question:
-- How has revenue changed compared to the previous month?
-- ==========================================
WITH monthly_revenue AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),
revenue_growth AS (
    SELECT month,
           total_revenue,
           LAG(total_revenue) OVER (ORDER BY month) AS previous_revenue
    FROM monthly_revenue
)
SELECT month,
       total_revenue,
       previous_revenue,
       total_revenue - previous_revenue AS growth
FROM revenue_growth;