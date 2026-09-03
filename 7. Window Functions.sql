-- WINDOWS FUNCTIONS
-- ============================================

-- Calculate total sales across all orders
select o.order_id,c.customer_id,p.price ,
sum(o.quantity*p.price) over() as amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on o.product_id=p.product_id;

-- Calculate total, average, and highest order amount
select o.order_id,p.price,
sum(p.price*o.quantity) over() as total_sales,
avg(p.price*o.quantity) over() as average_order_amount,
max(p.price*quantity) over() as highest_order_amount 
from products p 
join orders o 
on o.product_id=p.product_id;

-- Calculate total amount for each order
select o.order_id,c.customer_id,
p.price as order_amount,
sum(p.price*o.quantity) OVER (partition by o.order_id) as total_amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC ;

-- Calculate average order amount for each customer
select o.order_id,c.customer_id,
p.price as order_amount,
avg(p.price*o.quantity) OVER (partition by c.customer_id) as average_amount
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC ;

-- Find the lowest product price in each category
select p.product_name,p.category,p.price,
min(p.price) over(partition by category) as lowest_price
from products p;

-- Calculate customer spending and order statistics
SELECT o.order_id,c.customer_id,o.quantity*p.price as order_amount,
sum(o.quantity*p.price) over(partition by customer_id) as customer_total_spending,
avg(o.quantity*p.price) over(partition by customer_id) as customer_average_spending,
count(*) over (partition by customer_id) as no_of_orders
from orders o 
join customers c on c.customer_id=o.customer_id
join products p on p.product_id=o.product_id
order by order_id ASC;

-- Assign an order number to each customer's orders
select o.order_id,c.customer_id,o.order_date,
row_number() over(partition by customer_id order by o.order_date ASC) as order_number
from orders o 
join products p on p.product_id=o.product_id
join customers c on c.customer_id = o.customer_id;

-- Assign overall and category-specific product rankings
select p.product_name,p.category,p.price,
row_number()over( order by price DESC) as overall_number,
row_number()over(partition by category order by price DESC) as category_number
from products p;

-- Rank products by price within each category
select product_name,category,price,
rank()over(partition by category order by price DESC) as rankk
from products p;

-- Rank customer orders by spending amount
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

-- Rank products by overall and category price
select p.product_name,p.category,p.price,
rank()over(order by price DESC) as overall_price_rank,
rank()over(partition by category order by price DESC ) as ctg_price_rank
from products p;

-- Assign dense rankings to products by price
select p.product_name,p.category,p.price,
dense_rank()over(order by price DESC) as dense_rankk
from products p;

-- Update a product price
update products set price=320000 where product_id=102;

-- Assign dense rankings within each category
select p.product_name,p.category,p.price,
dense_rank()over(partition by category order by price DESC) as dense_rankk
from products p;

-- Rank customers by total spending
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

-- Calculate a running total of order amounts
select o.customer_id,o.order_id,o.order_date,
(o.quantity*p.price) as order_amount,
sum(o.quantity*p.price) over(order by order_date ASC) as running_total
from orders o 
join products p
on p.product_id=o.product_id;

-- Calculate the running average of order amounts
select o.order_id,o.order_date,o.customer_id,
(o.quantity*p.price) as order_amount,
avg(o.quantity*p.price) over(partition by customer_id order by order_date)
as running_average
from orders o 
join products p
on p.product_id=o.product_id;
