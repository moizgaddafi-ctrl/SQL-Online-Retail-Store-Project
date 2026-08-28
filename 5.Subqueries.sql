-- Subqueries
-- ============================================

select product_name,price 
from products
where price = (select max(price) 
from products) order by price DESC limit 1;

select product_name,price 
from products
where price > (select min(price) 
from products);

select c.customer_name,c.city,c.age
from customers c 
where age > (select avg(c2.age) from customers c2 where c.city=c2.city);

select p.product_name,p.category,p.price
from products p 
where p.price> (select avg(p2.price)
from products p2
where p2.category=p.category);

select c.customer_name,c.city,c.age
from customers c 
where c.age>(select avg(c2.age)
from customers c2 where c.city=c2.city);


SELECT c.customer_id,c.customer_name,
    SUM(p.price * o.quantity) AS total_spending
FROM Customers c
INNER JOIN Orders o
    ON o.customer_id = c.customer_id
INNER JOIN Products p
    ON p.product_id = o.product_id
GROUP BY c.customer_id, c.customer_name;


SELECT AVG(total_spending)
FROM (
SELECT
c.customer_id, SUM(p.price * o.quantity) AS total_spending
FROM Customers c
INNER JOIN Orders o
ON o.customer_id = 
c.customer_id
INNER JOIN Products p
ON p.product_id = o.product_id
GROUP BY c.customer_id
) AS customer_spending;

select category,avg(price)
as average_price
from products p
group by category 
having avg(price) > (
select avg ( average_price) 
from (select category,avg(price)
as average_price
from products p
group by category) as xx
);

select product_name,price
from products 
where price >
(select avg(price) as avg_price
from products); 

select c.customer_id,c.customer_name
from customers c
where c.customer_id
in (select o.customer_id
from orders o); 

select p.product_id,p.product_name
from products p
where p.product_id
not in (select o.product_id 
from orders o);

select c.customer_id,c.customer_name,c.city
from customers c  
where c.age > (select avg(c2.age)
from customers c2 where c2.city=c.city ) ;

SELECT
c.customer_id,
customer_name,
COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > (
SELECT AVG(total_orders)
FROM (
        SELECT COUNT(order_id) AS total_orders
        FROM Orders
        GROUP BY customer_id
    ) AS customer_order_counts
);

SELECT p.category,SUM(p.price * o.quantity) AS total_revenue
FROM Products p
INNER JOIN Orders o
ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(p.price * o.quantity) > (
SELECT AVG(total_revenue)
FROM (
SELECT
p2.category,
SUM(p2.price * o2.quantity) AS total_revenue
FROM Products p2
INNER JOIN Orders o2
ON o2.product_id = p2.product_id
GROUP BY p2.category
    ) AS above_average
);