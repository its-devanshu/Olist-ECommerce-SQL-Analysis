--Task 1: Ranking the Heaviest Items
--We want a list of all products, but we want to assign them a rank from heaviest to lightest.
--Write a query returning product_id and product_weight_g from the products table.
--Add a third column using the RANK() window function: RANK() OVER(ORDER BY product_weight_g DESC) AS weight_rank.

select product_id, product_weight_g,
Rank() over (order by product_weight_g DESC) as Weight_rank
from olist_products_dataset
where product_weight_g is not null;

--Task 2: The Most Expensive Item per Category (The Partition)
--We don't just want the most expensive item overall; we want to rank items within their own categories.
--Return product_category_name, product_id, and price from a joined items and products query.
--Use RANK() OVER(PARTITION BY product_category_name ORDER BY price DESC) AS category_price_rank.
select opd.product_category_name , opd.product_id ,ooid.price, 
dense_rank() Over(partition by product_category_name order by ooid.price DESC) as category_price_rank
from olist_products_dataset opd
join olist_order_items_dataset ooid 
on opd.product_id = ooid.product_id 
where opd.product_category_name is not null
and opd.product_category_name != '';

--Task 3: Cumulative Sums (Running Totals)
--The Table: olist_order_payments_dataset
--The Goal: Write a query that returns the order_id and the payment_value.
--The Challenge: Create a third column named cumulative_revenue. 
--This column should use a Window Function to calculate the running total of the payment_value, 
--stacking up row by row, sorted by the order_id.
select order_id , payment_value,
sum(payment_value) over (order by order_id) as cumulative_revenue
from olist_order_payments_dataset oopd ;

