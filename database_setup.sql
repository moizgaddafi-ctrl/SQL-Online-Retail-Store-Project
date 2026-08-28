-- DATABASE & TABLE CREATION
-- ============================================

CREATE DATABASE retail_storedb;
USE retail_storedb;
CREATE TABLE Customers(
customers_id INT auto_increment,
customer_name VARCHAR(50),
city VARCHAR(50),
gender enum('F','M'),
age INT 
);
CREATE TABLE Products(
product_id INT auto_increment,
product_name VARCHAR(50),
category VARCHAR(50),
price decimal
);
CREATE TABLE Orders(
order_id INT auto_increment,
customer_id int,
product_id int,
quantity int,
order_date date
);
ALTER TABLE Customers
MODIFY customer_id int;

ALTER TABLE Products
MODIFY product_id INT;

ALTER TABLE Orders
MODIFY order_id INT;

ALTER TABLE orders
DROP PRIMARY KEY;