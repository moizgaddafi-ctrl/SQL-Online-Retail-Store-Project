-- CASE STATEMENTS,VIEWS and INDEXES
-- ============================================
-- Classify products based on price
Select product_name,price, (
CASE
WHEN price>12000 THEN 'Premium'
WHEN price between 8000 and 12000 THEN 'Standard'
ELSE 'Budget'
END
) as ctg
From products;

-- Create a view combining customer, product, and order details
CREATE VIEW customer_orderss AS
select c.customer_name,p.product_name,o.quantity,p.price,o.order_date
from products p
inner join orders o on p.product_id=o.product_id
inner join customers c on c.customer_id=o.customer_id;

-- Create an index on customer ID
CREATE INDEX idx_customer_name
on customers (customer_id);
