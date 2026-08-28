-- CTE's
-- ============================================

with customer_lahore AS (
select * from customers where city='Lahore'
)
select * from customer_lahore ;

with customer_total_spending AS(
select c.customer_name,sum(p.price*o.quantity) as total_spending 
from customers c inner join orders o on o.customer_id=c.customer_id
inner join products p  on o.product_id=p.product_id

group by customer_name
)
select * from customer_total_spending;

with expensive_products AS(
select * from products where price >50000
)
select * from expensive_products;

with customer_order_count AS(
select c.customer_name,count(o.quantity) as no_of_orders from customers c
inner join orders o on c.customer_id=o.customer_id
group by customer_name
)
select * from customer_order_count;

with product_quantity_sold AS(
select p.product_id,count(o.quantity) as total_quantity_sold
from products p 
inner join orders o on o.product_id=p.product_id
group by p.product_id order by product_id ASC
)
select * from product_quantity_sold;

with high_order_customers AS(
select c.customer_id,c.customer_name,count(o.order_id) as total_orders 
from customers c 
inner join orders o on o.customer_id=c.customer_id
group by customer_id,customer_name
)
select * from  high_order_customers where total_orders >3 ;

with customer_orders AS(
select c.customer_name,c.city,o.order_id,o.order_date
from customers c  
inner join orders o on o.customer_id=c.customer_id
)
select * from customer_orders;

with customer_spending AS(
select c.customer_id,sum(o.quantity*p.price) as total_spent 
from customers c 
inner join orders o on o.customer_id=c.customer_id
inner join products p on o.product_id=p.product_id
group by customer_name,customer_id
)
select * from customer_spending;

with product_revenue AS(
select p.product_id,p.product_name,sum(o.quantity*p.price) as total_revenue
from products p 
inner join orders o on o.product_id=p.product_id
group by product_name,product_id
)
select * from product_revenue;

WITH customer_total_spending AS (
SELECT 
o.customer_id,
SUM(o.quantity * p.price) AS total_spent
FROM orders o
INNER JOIN products p 
ON o.product_id = p.product_id
GROUP BY o.customer_id
)
SELECT 
c.customer_name,
c.city,
cts.total_spent
FROM customers c
INNER JOIN customer_total_spending cts
ON c.customer_id = cts.customer_id
ORDER BY cts.total_spent DESC;

with customer_orders AS(
select o.customer_id,count(o.order_id) as total_orders 
from orders o 
group by customer_id
),
customer_spending AS(
select o.customer_id, sum(o.quantity*p.price) as total_spent
from orders o 
inner join products p on p.product_id=o.product_id
group by customer_id
)
select co.customer_id,co.total_orders,cs.total_spent
from customer_orders co
inner join customer_spending cs
on cs.customer_id=co.customer_id;

with product_quantity AS(
select p.product_name,sum(o.quantity) as quantity_sold 
from products p 
inner join orders o on o.product_id=p.product_id
group by product_name
),
high_selling_products AS(
select product_name,quantity_sold
from product_quantity
where quantity_sold>3
)

select* from high_selling_products;

with product_revenue AS (
select p.product_name,sum(p.price*o.quantity) as total_revenue 
from products p 
inner join orders o on o.product_id=p.product_id
group  by product_name
),
average_revenue AS(
select avg(total_revenue) as average
from product_revenue
)
select * from product_revenue
where total_revenue>
(select average  
from average_revenue);

WITH customer_orders AS (
SELECT c.customer_id,c.customer_name,c.city,
COUNT(o.order_id) AS no_of_orders
FROM customers c 
INNER JOIN orders o 
ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
),
customer_spending AS (
SELECT c.customer_id,
SUM(o.quantity * p.price) AS total_spending
FROM customers c 
JOIN orders o 
ON o.customer_id = c.customer_id
JOIN products p 
ON o.product_id = p.product_id
GROUP BY c.customer_id
)
SELECT co.customer_name,co.city,co.no_of_orders,
cs.total_spending 
FROM customer_orders co
JOIN customer_spending cs 
ON co.customer_id = cs.customer_id
ORDER BY cs.total_spending DESC;

with product_revenue AS(
select p.product_id,p.product_name,
sum(p.price*o.quantity) as revenue
from products p 
join orders o 
on o.product_id=p.product_id
group by p.product_name,p.product_id
),
average_revenue AS
(
select avg (revenue) AS avg_revenue
from product_revenue
),
above_average_products AS (
select pr.product_id,pr.product_name,pr.revenue
from product_revenue pr
cross join  average_revenue ar
where pr.revenue > ar.avg_revenue
)
select * from above_average_products ;

