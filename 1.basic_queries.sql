-- BASIC SQL QUERIES
-- ============================================

select* From Customers Where gender ='F';

select* From  Products Where price>10000;

select* From  Products Where price>5000 and price<30000;

select* From Customers where city in ('Lahore','Karachi');

select * from products order by price DESC;

select * from products limit 5;

select distinct category from Products;

SELECT *FROM products
WHERE category = 'Electronics'
AND price > 5000;

SELECT *FROM customers
WHERE city = 'Lahore'
OR city = 'Karachi';

SELECT *FROM products
WHERE price BETWEEN 1000 AND 5000;

SELECT *FROM customers
WHERE customer_name LIKE 'A%';

SELECT *FROM customers 
WHERE city IN ('Lahore', 'Karachi');

select count(customer_id) from customers;

select avg(price) as average_price from products;

select min(price) as min_price from products;

select max(price) as max_price from products;

select sum(quantity) as quantity_sold from orders;

SELECT gender, COUNT(*) AS total_customers
FROM Customers
GROUP BY gender;

SELECT gender, AVG(age) AS average_age
FROM Customers
GROUP BY gender;

SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category;

SELECT
category,COUNT(*) AS total_products
FROM Products
GROUP BY category
HAVING COUNT(*) > 2;

SELECT
category,AVG(price) AS average_price
FROM Products
GROUP BY category
HAVING AVG(price) > 10000;
