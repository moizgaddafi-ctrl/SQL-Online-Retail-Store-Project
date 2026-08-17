-- BASIC QUERIES
-- ============================================

-- FILTERING
-- ============================================
select* From Customers Where gender ='F';
select* From  Products Where price>10000;
select* From  Products Where price>5000 and price<30000;
select* From Customers where city in ('Lahore','Karachi');
select * from products order by price DESC;
select * from products limit 5;
select distinct category from Products;

-- AGGREGATE FUNCTIONS
-- ============================================
select count(customer_id) from customers;

select avg(price) as average_price from products;

select min(price) as min_price from products;

select max(price) as max_price from products;

select sum(quantity) as quantity_sold from orders;

-- GROUP BY & HAVING
-- ============================================

SELECT city, COUNT(*) AS total_customers
FROM Customers
GROUP BY city;

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

SELECT p.product_name,SUM(o.quantity) AS total_quantity_sold
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(o.quantity) > 2;

SELECT p.category,SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(p.price * o.quantity) > 50000;

-- JOINS
-- ============================================

select p.category,
sum(p.price*o.quantity) as total_sales 
from orders o 
join products p
on o.product_id = p.product_id
group by p.category;

select city,
sum(customer_id) as total_customers 
from customers 
group by city  ;


select c.customer_name,
p.product_name,
o.quantity,
o.order_date
from orders o
inner join products p
on o.product_id=p.product_id 
inner join customers c 
on c.customer_id=o.customer_id;

select c.customer_name,
o.order_id ,
o.order_date
from customers c
left join orders o
on c.customer_id = o.customer_id;

SELECT DISTINCT
c.customer_name
FROM Customers c
INNER JOIN Orders o
on c.customer_id = o.customer_id
INNER JOIN Products p
on o.product_id = p.product_id
WHERE p.category = 'Electronics';

SELECT c.customer_id,
c.customer_name,
sum(p.price*o.quantity)
as total_spending
from customers c 
inner join orders o 
on o.customer_id=c.customer_id
inner join products p on
o.product_id =p.product_id
group by c.customer_id,c.customer_name;
;

select c.customer_id,c.customer_name,sum(p.price*o.quantity) as top_spendings
from customers c 
inner join orders o 
on o.customer_id=c.customer_id
INNER JOIN Products p
on o.product_id = p.product_id
group by c.customer_id,c.customer_name
order by top_spendings DESC
LIMIT 5;

-- CASE STATEMENTS
-- ============================================

Select product_name,price, (
CASE
WHEN price>12000 THEN 'Premium'
WHEN price between 8000 and 12000 THEN 'Standard'
ELSE 'Budget'
END
) as ctg
 From products;
 
-- VIEWS
-- ============================================ 

CREATE VIEW customer_orderss AS
select c.customer_name,p.product_name,o.quantity,p.price,o.order_date
from products p
inner join orders o on p.product_id=o.product_id
inner join customers c on c.customer_id=o.customer_id;

-- INDEXES
-- ============================================

CREATE INDEX idx_customer_name
on customers (customer_id);

-- BUSINESS ANALYSIS
-- ============================================
select c.customer_name,c.city,p.product_name,
p.category,o.quantity,p.price,
(p.price*o.quantity) as total_amount,
case 
when (p.price*o.quantity)>120000 then 'high value'
when (p.price*o.quantity)<120000 then 'medium value'
else 'Low Value'
End as purchase_type,
o.order_date
from orders o 
inner join customers c
on c.customer_id=o.customer_id
inner join products p
on o.product_id=p.product_id
order by total_amount DESC;

select c.customer_name,sum(p.price*o.quantity) as money_spent
from customers c 
inner join orders o
on o.customer_id=c.customer_id 
inner join products p
on p.product_id=o.product_id
group by c.customer_id,c.customer_name
order by money_spent DESC 
LIMIT 1;

select p.product_id,p.product_name
from products p
left join orders o 
on o.product_id=p.product_id 
where o.order_id is null;  

-- Subqueries
-- ============================================

select product_name,price 
from products 
where price> (select avg(price) 
from products) ;

select product_name,price 
from products 
where price < (select avg(price) 
from products) ;

select product_name,price 
from products
where price = (select max(price) 
from products) order by price DESC limit 1;

select product_name,price 
from products
where price > (select min(price) 
from products);

select customer_name,age 
from customers 
where age > (select avg(age) from customers);

select c.customer_name,c.city,c.age
from customers c 
where age > (select avg(c2.age) from customers c2 where c.city=c2.city);


-- FINAL CHALLENGE
-- ============================================

select c.customer_name, c.city,p.product_name,p.category,o.quantity,p.price
,(p.price*o.quantity) as total_amount ,
case 
when price> 200000 then'Premium'
when price between 100000 and 199000 then 'Standard'
else 'Budget'
end as ctg 
, 
case 
when (p.price*o.quantity) > 200000 then 'high purchase'
when (p.price*o.quantity) >= 100000 then 'medium purchase'
else 'Low purchase'
end as purchase_category,
o.order_date 
from customers c 
inner join orders o
on o.customer_id=c.customer_id
inner join products p
on o.product_id=p.product_id
where (p.price*o.quantity) >50000
order by total_amount DESC 
limit 10;