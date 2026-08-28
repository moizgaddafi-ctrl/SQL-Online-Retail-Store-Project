-- WINDOWS FUNCTIONS
-- ============================================

select o.order_id,c.customer_id,p.price ,
sum(o.quantity*p.price) over() as amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on o.product_id=p.product_id;

select o.order_id,p.price,
sum(p.price*o.quantity) over() as total_sales,
avg(p.price*o.quantity) over() as average_order_amount,
max(p.price*quantity) over() as highest_order_amount 
from products p 
join orders o 
on o.product_id=p.product_id;

select o.order_id,c.customer_id,
p.price as order_amount,
sum(p.price*o.quantity) OVER (partition by o.order_id) as total_amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC ;

select o.order_id,c.customer_id,
p.price as order_amount,
avg(p.price*o.quantity) OVER (partition by c.customer_id) as average_amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC ;

select p.product_name,p.category,p.price,
min(p.price) over(partition by category) as lowest_price
from products p;

SELECT o.order_id,c.customer_id,o.quantity*p.price as order_amount,
sum(o.quantity*p.price) over(partition by customer_id) as customer_total_spending,
avg(o.quantity*p.price) over(partition by customer_id) as customer_average_spending,
count(*) over (partition by customer_id) as no_of_orders
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC;

select o.order_id,c.customer_id,o.order_date,
row_number() over(partition by customer_id order by o.order_date ASC) as order_number
from orders o 
join products p on p.product_id=o.product_id
join customers c on c.customer_id = o.customer_id;

select p.product_name,p.category,p.price,
row_number()over( order by price DESC) as overall_number,
row_number()over(partition by category order by price DESC) as category_number
from products p;
select product_name,category,price,
rank()over(partition by category order by price DESC) as rankk
from products p;

with customer_spendings AS(
select c.customer_id,c.customer_name,
sum(o.quantity*p.price) as total_spending
from customers c 
join orders o on o.customer_id=c.customer_id
join products p on p.product_id=o.product_id
group by o.customer_id
)

select customer_id,order_id,order_amount,
rank()over(partition by customer_id order by order_amount DESC) as order_rank
from customer_spendings;

select p.product_name,p.category,p.price,
rank()over(order by price DESC) as overall_price_rank,
rank()over(partition by category order by price DESC ) as ctg_price_rank
from products p;

select p.product_name,p.category,p.price,
dense_rank()over(order by price DESC) as dense_rankk
from products p;

update products set price=320000 where product_id=102;

select p.product_name,p.category,p.price,
dense_rank()over(partition by category order by price DESC) as dense_rankk
from products p;

with total_spending AS(
select o.customer_id,sum(p.price*o.quantity) as total_spendings 
from orders o 
join products p
on o.product_id=p.product_id
group by o.customer_id
)
select customer_id,total_spendings,
dense_rank()over(order by total_spendings DESC) as ranking
from total_spending;

select o.customer_id,o.order_id,o.order_date,
(o.quantity*p.price) as order_amount,
sum(o.quantity*p.price) over(order by order_date ASC) as running_total
from orders o 
join products p
on p.product_id=o.product_id;

select o.order_id,o.order_date,o.customer_id,
(o.quantity*p.price) as order_amount,
avg(o.quantity*p.price) over(partition by customer_id order by order_date)
as running_average
from orders o 
join products p
on p.product_id=o.product_id;

-- Comprehensive query (Window functions)
-- ============================================
select o.order_id,
o.customer_id,
o.order_date,
(o.quantity*p.price)
 as order_amount,
sum(o.quantity*p.price)
 over(partition by customer_id) 
 as total_spendings,
avg(o.quantity*p.price)
over(partition by customer_id )
 as avg_order_amount,
count(*) over (partition by o.customer_id)
as no_of_orders ,
row_number()
 over(partition by o.customer_id order by o.order_date  )
 as order_number,
rank()
 over(partition by o.customer_id order by o.quantity * p.price )
 as order_amount_rank,
sum(o.quantity * p.price)
 over(partition by o.customer_id order by o.order_date )
 as customer_running_total
from orders o 
join products p 
on o.product_id=p.product_id;