-- ============================================
-- JOINS
-- ===========================================

-- Calculate total sales by product category
SELECT  p.category,
SUM(p.price * o.quantity) AS total_sales 
FROM Orders o 
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.category;

-- Count customers by city
SELECT  city,
COUNT(customer_id) AS total_customers 
FROM Customers 
GROUP BY city;

-- Display customer, product, quantity, and order details
SELECT  c.customer_name,p.product_name,o.quantity,o.order_date
FROM Orders o
INNER JOIN Products p
ON o.product_id = p.product_id 
INNER JOIN Customers c 
ON c.customer_id = o.customer_id;

-- Display all customers and their orders
SELECT c.customer_name,o.order_id, o.order_date
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;

-- Find customers who purchased Electronics
SELECT DISTINCT c.customer_name
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p
ON o.product_id = p.product_id
WHERE p.category = 'Electronics';

-- Calculate total spending for each customer
SELECT  c.customer_id, c.customer_name,
SUM(p.price * o.quantity) AS total_spending
FROM Customers c 
INNER JOIN Orders o 
ON o.customer_id = c.customer_id
INNER JOIN Products p 
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;

-- Find categories with total revenue above 50,000
SELECT p.category,
SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(p.price * o.quantity) > 50000;

-- Find the top 5 customers by total spending
SELECT c.customer_id,c.customer_name,
SUM(p.price * o.quantity) AS top_spendings
FROM Customers c 
INNER JOIN Orders o 
ON o.customer_id = c.customer_id
INNER JOIN Products p
ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY top_spendings DESC
LIMIT 5;

-- Find products with more than 2 units sold
SELECT  p.product_name,
SUM(o.quantity) AS total_quantity_sold
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(o.quantity) > 2;
