
--Task 1: Weight Classes
--Using the olist_products_dataset, return the product_id, the product_weight_g, and create a custom CASE column. 
--If the product_weight_g is strictly less than 1000, label it 'Light'. Otherwise, label it 'Heavy'.
select product_id , product_weight_g,
case 
when product_weight_g < 1000 then 'Light' else 'Heavy'
end as Productweight
from olist_products_dataset opd 
where product_weight_g is not null
order by productweight desc;

--Task 2: Payment Tiers
--Using the olist_order_payments_dataset, return the order_id, the payment_value, and create a CASE column. 
--If the payment_value is strictly greater than 150, label it 'High Value'. Otherwise, label it 'Standard'.
select order_id , payment_value,
case
	when payment_value > 150 then 'High Value' else 'Standard' 
end as Amount_Value
from olist_order_payments_dataset pd
where payment_value is not null
order by pd.payment_value  desc ;

--Task 3: The "Whale" Filter (CTE)
--The Prep Bowl: Create a CTE that calculates the total amount spent (SUM(payment_value)) by every single customer_id. 
--You will need to join the orders and order_payments tables to do this.

with total_amount_spent as (
select ood.customer_id , sum(payment_value) as  totals
from olist_orders_dataset ood 
join olist_order_payments_dataset oopd
on ood.order_id  = oopd.order_id 
group by ood.customer_id 
)
select * 
from total_amount_spent 
where totals > 1000
order by totals desc;

-----------END----------------
 


