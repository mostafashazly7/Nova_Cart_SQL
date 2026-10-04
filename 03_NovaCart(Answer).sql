/*
============================================================
                    NovaCart SQL Lab
                  SQL Questions Worksheet
============================================================

Student Name : ______________________________
Section      : ______________________________
ID           : __________________________________

Platform: Microsoft SQL Server / SSMS

Instructions:
1. Complete the database design and implementation before solving
   these questions.
2. Do not modify the database structure just to make a question easier.
3. Write your SQL solution directly below each question.
4. Use meaningful aliases and readable formatting.
5. All queries must execute successfully on your completed NovaCartDB.
6. Use the separate Hints PDF only when you are genuinely stuck.
7. Do not hard-code results that should be calculated from the data.

Database:
    NovaCartDB

============================================================
*/

USE NovaDB;
GO


/*============================================================
                MISSION 1 — CUSTOMER & PRODUCT OVERVIEW
============================================================*/

-- M1-Q1
-- Display all customers.

-- Your query:
SELECT customer_id, username, email, phone, adress, join_date
FROM Customers;


------------------------------------------------------------

-- M1-Q2
-- Display the product name, category, and current price
-- for every product.

-- Your query:
SELECT product_name, product_category, selling_price
FROM Products;


------------------------------------------------------------

-- M1-Q3
-- Display products whose current price is greater than 5000.

-- Your query:
SELECT product_name, product_category, selling_price
FROM Products
WHERE selling_price > 5000;


------------------------------------------------------------

-- M1-Q4
-- Display all customers ordered by join date, newest first.

-- Your query:
SELECT customer_id, username, email, phone, adress, join_date
FROM Customers
ORDER BY join_date DESC;


------------------------------------------------------------

-- M1-Q5
-- Display the total number of customers.

-- Your query:
SELECT COUNT(customer_id) AS total_customers
FROM Customers;


/*============================================================
             MISSION 2 — AGGREGATION & BUSINESS TOTALS
============================================================*/

-- M2-Q1
-- Calculate the average current product price.

-- Your query:
SELECT AVG(selling_price) AS average_price
FROM Products;


------------------------------------------------------------

-- M2-Q2
-- Display the highest and lowest current product prices.

-- Your query:
SELECT MAX(selling_price) AS highest_price,
       MIN(selling_price) AS lowest_price
FROM Products;


------------------------------------------------------------

-- M2-Q3
-- Calculate the total available stock quantity.

-- Your query:
SELECT SUM(product_quantity) AS total_stock
FROM Products;


------------------------------------------------------------

-- M2-Q4
-- Calculate the total amount recorded in Payments.

-- Your query:
SELECT SUM(amount) AS total_payments
FROM Payments;


------------------------------------------------------------

-- M2-Q5
-- Display the number of orders for each order status.

-- Your query:
SELECT status, COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY status;


------------------------------------------------------------

-- M2-Q6
-- Display the total payment amount for each payment method.

-- Your query:
SELECT payment_method, SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method;

/*============================================================
               MISSION 3 — ORDER & SALES ANALYSIS
============================================================*/

-- M3-Q1
-- Calculate the total sales amount for each order.
-- Use quantity multiplied by the historical unit price.

-- Your query:
SELECT order_id,
       SUM(required_quantity * selling_price) AS total_sales
FROM Order_Details
GROUP BY order_id;


------------------------------------------------------------

-- M3-Q2
-- Display only orders whose total sales exceed 5000.

-- Your query:
SELECT order_id,
       SUM(required_quantity * selling_price) AS total_sales
FROM Order_Details
GROUP BY order_id
HAVING SUM(required_quantity * selling_price) > 5000;


------------------------------------------------------------

-- M3-Q3
-- Display each order together with:
-- customer name, order date, and order status.

-- Your query:
SELECT o.order_id,
       c.username,
       o.order_date,
       o.status
FROM Orders o
JOIN Customers c 
    ON o.customer_id = c.customer_id;


------------------------------------------------------------

-- M3-Q4
-- Display each order with:
-- product name, purchased quantity, and historical unit price.

-- Your query:
SELECT o.order_id,
       p.product_name,
       od.required_quantity,
       od.selling_price
FROM Orders o
JOIN Order_Details od 
    ON o.order_id = od.order_id
JOIN Products p       
    ON od.poduct_id = p.product_id;


------------------------------------------------------------

-- M3-Q5
-- Display the total amount spent by each customer.

-- Your query:
SELECT c.customer_id,
       c.username,
       SUM(pay.amount) AS total_spent
FROM Customers c
JOIN Orders o     
    ON c.customer_id = o.customer_id
JOIN Payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.username;


/*============================================================
              MISSION 4 — REVIEWS & RELATIONSHIPS
============================================================*/

-- M4-Q1
-- Display the number of reviews received by each product,
-- including products with no reviews.

-- Your query:
SELECT p.product_id,
       p.product_name,
       COUNT(r.review_id) AS number_of_reviews
FROM Products p
LEFT JOIN Reviews r 
    ON p.product_id = r.poduct_id
GROUP BY p.product_id, p.product_name;


------------------------------------------------------------

-- M4-Q2
-- Display all reviews together with:
-- customer name and product name.

-- Your query:
SELECT r.review_id,
       c.username,
       p.product_name,
       r.rating,
       r.comment,
       r.review_date
FROM Reviews r
JOIN Customers c 
    ON r.customer_id = c.customer_id
JOIN Products p  
    ON r.poduct_id = p.product_id;


------------------------------------------------------------

-- M4-Q3
-- Display customers who have placed at least one order.

-- Your query:
SELECT customer_id, username
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders);


------------------------------------------------------------

-- M4-Q4
-- Display products that have never been ordered.

-- Your query:
SELECT product_id, product_name
FROM Products
WHERE product_id NOT IN (SELECT poduct_id FROM Order_Details);


------------------------------------------------------------

-- M4-Q5
-- Display products that have never received a review.

-- Your query:
SELECT product_id, product_name
FROM Products
WHERE product_id NOT IN (SELECT poduct_id FROM Reviews);


------------------------------------------------------------

-- M4-Q6
-- Display all customers and their number of orders,
-- including customers who have never placed an order.

-- Your query:
SELECT c.customer_id,
       c.username,
       COUNT(o.order_id) AS number_of_orders
FROM Customers c
LEFT JOIN Orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.username;


/*============================================================
                       MISSION 5 — SUBQUERIES
============================================================*/

-- M5-Q1
-- Display customers who placed more orders than the average
-- number of orders among customers who placed at least one order.

-- Your query:
SELECT c.customer_id,
       c.username,
       COUNT(o.order_id) AS number_of_orders
FROM Customers c
JOIN Orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.username
HAVING COUNT(o.order_id) > (
    SELECT AVG(CAST(order_count AS FLOAT))
    FROM (
        SELECT COUNT(order_id) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS counts_per_customer
);


------------------------------------------------------------

-- M5-Q2
-- Display products whose current price is above the average
-- current product price.

-- Your query:
SELECT product_id, product_name, selling_price
FROM Products
WHERE selling_price > (SELECT AVG(selling_price) FROM Products);


------------------------------------------------------------

-- M5-Q3
-- Display customers whose total spending is greater than
-- the average total spending among customers who have made
-- at least one payment.

-- Your query:
SELECT c.customer_id,
       c.username,
       SUM(pay.amount) AS total_spent
FROM Customers c
JOIN Orders o     
    ON c.customer_id = o.customer_id
JOIN Payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.username
HAVING SUM(pay.amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(pay2.amount) AS customer_total
        FROM Orders o2
        JOIN Payments pay2 
            ON o2.order_id = pay2.order_id
        GROUP BY o2.customer_id
    ) AS totals_per_customer
);


/*============================================================
                MISSION 6 — COMMON TABLE EXPRESSIONS
============================================================*/

-- M6-Q1
-- Using a CTE, calculate total revenue by month.

-- Your query:
WITH MonthlyRevenue AS (
    SELECT YEAR(payment_date)  AS revenue_year,
           MONTH(payment_date) AS revenue_month,
           SUM(amount)         AS total_revenue
    FROM Payments
    GROUP BY YEAR(payment_date), MONTH(payment_date)
)
SELECT revenue_year, revenue_month, total_revenue
FROM MonthlyRevenue
ORDER BY revenue_year, revenue_month;


------------------------------------------------------------

-- M6-Q2
-- Using a CTE, calculate total spending by customer.
-- Return only customers whose total spending exceeds 10000.

-- Your query:
WITH CustomerSpending AS (
    SELECT c.customer_id,
           c.username,
           SUM(pay.amount) AS total_spent
    FROM Customers c
    JOIN Orders o     
        ON c.customer_id = o.customer_id
    JOIN Payments pay 
        ON o.order_id = pay.order_id
    GROUP BY c.customer_id, c.username
)
SELECT customer_id, username, total_spent
FROM CustomerSpending
WHERE total_spent > 10000;


/*============================================================
                  MISSION 7 — WINDOW FUNCTIONS
============================================================*/

-- M7-Q1
-- Rank customers by total spending using RANK(),
-- with the highest spending ranked first.

-- Your query:
SELECT c.customer_id,
       c.username,
       SUM(pay.amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(pay.amount) DESC) AS spending_rank
FROM Customers c
JOIN Orders o     
    ON c.customer_id = o.customer_id
JOIN Payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.username;


------------------------------------------------------------

-- M7-Q2
-- Rank products by total quantity sold using DENSE_RANK(),
-- with the highest quantity ranked first.

-- Your query:
SELECT p.product_id,
       p.product_name,
       SUM(od.required_quantity) AS total_quantity_sold,
       DENSE_RANK() OVER (ORDER BY SUM(od.required_quantity) DESC) AS quantity_rank
FROM Products p
JOIN Order_Details od 
    ON p.product_id = od.poduct_id
GROUP BY p.product_id, p.product_name;



------------------------------------------------------------

-- M7-Q3
-- Display each payment together with the previous payment amount
-- using LAG().
-- Order the sequence by payment date and payment ID.

-- Your query:
SELECT payment_id,
       payment_date,
       amount,
       LAG(amount) OVER (ORDER BY payment_date, payment_id) AS previous_amount
FROM Payments
ORDER BY payment_date, payment_id;


------------------------------------------------------------

-- M7-Q4
-- Display a running total of payment amounts.
-- Order the sequence by payment date and payment ID.

-- Your query:
SELECT payment_id,
       payment_date,
       amount,
       SUM(amount) OVER (ORDER BY payment_date, payment_id) AS running_total
FROM Payments
ORDER BY payment_date, payment_id;
GO



/*============================================================
                         MISSION 8 — VIEWS
============================================================*/

-- M8-Q1
-- Create a view named vw_revenue_by_month
-- that displays monthly revenue.

-- Your query:
CREATE VIEW vw_revenue_by_month AS
SELECT YEAR(payment_date)  AS revenue_year,
       MONTH(payment_date) AS revenue_month,
       SUM(amount)         AS total_revenue
FROM Payments
GROUP BY YEAR(payment_date), MONTH(payment_date);
GO


------------------------------------------------------------

-- M8-Q2
-- Create a view named vw_best_selling_products
-- that displays:
--   Product Name
--   Total Quantity Sold
--   Total Revenue

-- Your query:
CREATE VIEW vw_best_selling_products AS
SELECT p.product_name                               AS product_name,
       SUM(od.required_quantity)                    AS total_quantity_sold,
       SUM(od.required_quantity * od.selling_price) AS total_revenue
FROM Products p
JOIN Order_Details od 
    ON p.product_id = od.poduct_id
GROUP BY p.product_id, p.product_name;
GO



------------------------------------------------------------

-- M8-Q3
-- Create a view named vw_customer_summary
-- that displays:
--   Customer Name
--   Number of Orders
--   Total Amount Spent

-- Your query:
CREATE VIEW vw_customer_summary AS
SELECT c.username                 AS customer_name,
       COUNT(DISTINCT o.order_id) AS number_of_orders,
       ISNULL(SUM(pay.amount), 0) AS total_amount_spent
FROM Customers c
LEFT JOIN Orders o     
    ON c.customer_id = o.customer_id
LEFT JOIN Payments pay 
    ON o.order_id = pay.order_id
GROUP BY c.customer_id, c.username;
GO


/*============================================================
                           END
============================================================*/
