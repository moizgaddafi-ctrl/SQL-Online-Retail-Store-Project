-- Find all female customers
SELECT * FROM Customers 
WHERE gender = 'F';

-- Find products priced above 10,000
SELECT * FROM Products 
WHERE price > 10000;

-- Find products priced between 5,000 and 30,000
SELECT * FROM Products 
WHERE price > 5000 AND price < 30000;

-- Find customers from Lahore or Karachi
SELECT * FROM Customers 
WHERE city IN ('Lahore', 'Karachi');

-- Sort products by price from highest to lowest
SELECT * FROM Products 
ORDER BY price DESC;

-- Display the 5 most expensive products
SELECT * FROM Products 
LIMIT 5;

-- Find all unique product categories
SELECT DISTINCT category 
FROM Products;

-- Find electronics products priced above 5,000
SELECT * FROM Products 
WHERE category = 'Electronics' 
AND price > 5000;

-- Find customers from Lahore or Karachi
SELECT * FROM Customers 
WHERE city = 'Lahore' 
OR city = 'Karachi';

-- Find products priced between 1,000 and 5,000
SELECT * FROM Products 
WHERE price BETWEEN 1000 AND 5000;


-- Find customers whose names start with 'A'
SELECT * FROM Customers 
WHERE customer_name LIKE 'A%';

-- Find customers from Lahore or Karachi
SELECT * FROM Customers  
WHERE city IN ('Lahore', 'Karachi');

-- Count the total number of customers
SELECT COUNT(customer_id) 
FROM Customers;

-- Calculate the average product price
SELECT AVG(price) AS average_price 
FROM Products;

-- Find the minimum product price
SELECT MIN(price) AS min_price 
FROM Products;

-- Find the maximum product price
SELECT MAX(price) AS max_price 
FROM Products;

-- Calculate the total quantity sold
SELECT SUM(quantity) AS quantity_sold 
FROM Orders;

-- Count customers by gender
SELECT gender, COUNT(*) AS total_customers 
FROM Customers 
GROUP BY gender;

-- Calculate average age by gender
SELECT gender, AVG(age) AS average_age 
FROM Customers 
GROUP BY gender;

-- Count products in each category
SELECT category, COUNT(*) AS total_products 
FROM Products 
GROUP BY category;

-- Find categories with more than 2 products
SELECT 
    category,
    COUNT(*) AS total_products 
FROM Products 
GROUP BY category 
HAVING COUNT(*) > 2;

-- Find categories with an average price above 10,000
SELECT 
    category,
    AVG(price) AS average_price 
FROM Products 
GROUP BY category 
HAVING AVG(price) > 10000;
