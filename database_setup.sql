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

-- DATA INSERTION
-- ============================================

INSERT INTO Customers (customer_id, customer_name, city, gender, age) VALUES
(1, 'Ali Khan', 'Lahore', 'M', 22),
(2, 'Ayesha Malik', 'Karachi', 'F', 25),
(3, 'Usman Ahmed', 'Islamabad', 'M', 30),
(4, 'Fatima Noor', 'Lahore', 'F', 28),
(5, 'Hamza Tariq', 'Faisalabad', 'M', 35),
(6, 'Zainab Ali', 'Multan', 'F', 24),
(7, 'Bilal Hassan', 'Karachi', 'M', 27),
(8, 'Hira Shah', 'Rawalpindi', 'F', 29),
(9, 'Saad Iqbal', 'Lahore', 'M', 31),
(10, 'Maham Raza', 'Islamabad', 'F', 26),
(11, 'Ahmed Saleem', 'Peshawar', 'M', 33),
(12, 'Iqra Siddique', 'Sialkot', 'F', 21),
(13, 'Danish Khan', 'Quetta', 'M', 36),
(14, 'Sara Aslam', 'Karachi', 'F', 23),
(15, 'Talha Javed', 'Lahore', 'M', 28);

INSERT INTO Products (product_id, product_name, category, price) VALUES
(101, 'iPhone 15', 'Electronics', 320000),
(102, 'Samsung Galaxy S24', 'Electronics', 260000),
(103, 'Dell Laptop', 'Electronics', 180000),
(104, 'HP Laptop', 'Electronics', 165000),
(105, 'Wireless Mouse', 'Accessories', 2500),
(106, 'Mechanical Keyboard', 'Accessories', 7000),
(107, 'Office Chair', 'Furniture', 18000),
(108, 'Study Table', 'Furniture', 22000),
(109, 'LED Monitor', 'Electronics', 45000),
(110, 'USB Flash Drive', 'Accessories', 1800),
(111, 'Bluetooth Speaker', 'Electronics', 8500),
(112, 'Smart Watch', 'Electronics', 12000),
(113, 'Gaming Headset', 'Accessories', 9500),
(114, 'Backpack', 'Fashion', 3500),
(115, 'Sports Shoes', 'Fashion', 9000),
(116, 'Coffee Maker', 'Home Appliances', 15000),
(117, 'Air Fryer', 'Home Appliances', 24000),
(118, 'Vacuum Cleaner', 'Home Appliances', 28000),
(119, 'Water Bottle', 'Lifestyle', 1200),
(120, 'Notebook Pack', 'Stationery', 900);

INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1001,1,105,2,'2026-01-05'),
(1002,2,101,1,'2026-01-06'),
(1003,3,103,1,'2026-01-07'),
(1004,4,114,3,'2026-01-08'),
(1005,5,117,1,'2026-01-09'),
(1006,6,110,5,'2026-01-10'),
(1007,7,112,2,'2026-01-11'),
(1008,8,118,1,'2026-01-12'),
(1009,9,109,2,'2026-01-13'),
(1010,10,111,1,'2026-01-14'),
(1011,11,102,1,'2026-01-15'),
(1012,12,120,10,'2026-01-16'),
(1013,13,107,2,'2026-01-17'),
(1014,14,115,1,'2026-01-18'),
(1015,15,116,1,'2026-01-19'),
(1016,1,113,2,'2026-01-20'),
(1017,2,108,1,'2026-01-21'),
(1018,3,119,6,'2026-01-22'),
(1019,4,106,2,'2026-01-23'),
(1020,5,105,1,'2026-01-24'),
(1021,7,114,2,'2026-01-26'),
(1022,9,120,8,'2026-01-28'),
(1023,10,101,1,'2026-01-29'),
(1024,12,118,1,'2026-02-01'),
(1025,15,103,1,'2026-02-03');