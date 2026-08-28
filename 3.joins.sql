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

SELECT p.category,SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(p.price * o.quantity) > 50000;

select c.customer_id,c.customer_name,sum(p.price*o.quantity) as top_spendings
from customers c 
inner join orders o 
on o.customer_id=c.customer_id
INNER JOIN Products p
on o.product_id = p.product_id
group by c.customer_id,c.customer_name
order by top_spendings DESC
LIMIT 5;

SELECT p.product_name,SUM(o.quantity) AS total_quantity_sold
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(o.quantity) > 2;
