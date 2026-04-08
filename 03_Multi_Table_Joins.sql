
--Order Destinations: Show me the order_id alongside the customer_city and customer_state it was shipped to. (Join orders to customers)

select od.order_id,cd.customer_city,cd.customer_state
from olist_orders_dataset od
join olist_customers_dataset cd
on od.customer_id = cd.customer_id ;

select od.order_id,cd.customer_city,cd.customer_state
from olist_customers_dataset cd
join  olist_orders_dataset od
on cd.customer_id = od.customer_id ;

--Item Categories: We need to know what category each sold item belongs to. 
--Return the order_id, price, and product_category_name. (Join order_items to products)
select oi.order_id , oi.price  , op.product_category_name 
from olist_order_items_dataset oi
join olist_products_dataset op
on oi.product_id = op.product_id ;

--Seller Locations: Show the order_id and the seller_city where the item shipped from. 
--(Join order_items to sellers)
select oi.order_id , os.seller_city 
from olist_order_items_dataset oi
join olist_sellers_dataset os
on oi.seller_id  = os.seller_id ;

--Payment Receipts: Return the order_id, order_status, and payment_type for every order. 
--(Join orders to order_payments)
select oo.order_id ,oo.order_status , op.payment_type 
from olist_orders_dataset oo
join olist_order_payments_dataset op
on oo.order_id = op.order_id ;

--Part 2: Joins + Filtering (JOIN + WHERE)
--Link the tables, then filter the results.
--Canceled Credit Cards: 
--Return the order_id and payment_value for orders that were 'canceled' AND paid for with a 'credit_card'. 
--(Join orders to order_payments)
select od.order_id , op.payment_value , od.order_status , op.payment_type 
from olist_orders_dataset od
join olist_order_payments_dataset op
on od.order_id = op.order_id 
where od.order_status = 'canceled' and op.payment_type = 'credit_card';

--Expensive Toys: 
--Return the order_id, price, and product_category_name where the category is 'brinquedos' (toys) AND the price is greater than $100. 
--(Join order_items to products)
select oi.order_id , oi.price , op.product_category_name
from olist_order_items_dataset oi
join olist_products_dataset op
on oi.product_id = op.product_id 
where op.product_category_name = 'brinquedos' and oi.price > 100;

--Rio Deliveries: 
--Return the order_id and order_delivered_customer_date strictly for customers who live in 'rio de janeiro'. 
--(Join orders to customers)
select oo.order_id , oo.order_delivered_customer_date , oc.customer_city 
from olist_orders_dataset oo
join olist_customers_dataset oc
on oo.customer_id = oc.customer_id 
where oc.customer_city = 'rio de janeiro' order by oo.order_delivered_customer_date desc;

--State Order Volume: Count the total number of orders shipped to each customer_state. 
--(Join orders to customers, group by state)
select oc.customer_state , count(oc.customer_state ) as totalcounts
from olist_orders_dataset oo
join olist_customers_dataset oc
on oo.customer_id = oc.customer_id 
group by oc.customer_state 
order by totalcounts desc;

--Category Pricing: Calculate the average price for each product_category_name. 
--(Join order_items to products, group by category)
select op.product_category_name ,  oi.price , avg (oi.price ) as average_price
from olist_order_items_dataset oi
join olist_products_dataset op
on oi.product_id = op.product_id
group by op.product_category_name,oi.price  
order by average_price desc;

--Seller Workload: Count the total number of individual items sold by each seller_id. 
--(Join order_items to sellers, group by seller)

select oi.seller_id , count (oi.product_id ) as totalcount
from olist_sellers_dataset os
join olist_order_items_dataset oi
on os.seller_id = oi.seller_id 
group by  oi.seller_id
order by totalcount desc;

--Revenue per Order: Calculate the total payment_value for each individual order_id. 
--(Join orders to order_payments, group by order_id)

select oo.order_id , SUM(op.payment_value ) as total_payment_value
from olist_orders_dataset oo
join olist_order_payments_dataset op
on oo.order_id = op.order_id
group by oo.order_id
order by total_payment_value desc;

--Part 4: The Trifecta (Filtering + Joins + Math)
--Putting everything together.
--
--Top Toy Sellers: Count the number of items sold per seller_id, but ONLY for items in the 'brinquedos' (toys) category. 
--Sort from highest to lowest. (Join order_items to products)
select  id.seller_id , pd.product_category_name , count (id.seller_id ) as totalCount
from olist_order_items_dataset id
join  olist_products_dataset pd
on id.product_id  = pd.product_id 
where pd.product_category_name ='brinquedos'
group by pd.product_category_name , id.seller_id  
order by totalCount desc;

--Late Deliveries by State: 
--Count the number of orders where the order_status is 'delivered' AND the order_delivered_customer_date is greater than the order_estimated_delivery_date. 
--Group this count by customer_state. (Join orders to customers)
 
select  cd.customer_state , od.order_status , count (od.order_status ) as totalcount
from olist_orders_dataset od
join olist_customers_dataset cd
on od.customer_id = cd.customer_id 
where od.order_status = 'delivered' and od.order_delivered_customer_date > od.order_estimated_delivery_date 
group by cd.customer_state ,od.order_status 
order by totalcount desc;

--## Part 5: Three-Table Joins (The Expert Level)
--Link Table A to Table B, and then Table B to Table C.
--Revenue by State: Calculate the total revenue (SUM(payment_value)) generated by each customer_state. 

select cd.customer_state , sum (pd.payment_value ) as total_revenue
from olist_orders_dataset od
join olist_customers_dataset cd
on od.customer_id = cd.customer_id 
join olist_order_payments_dataset pd
on od.order_id = pd.order_id 
group by cd.customer_state 
order by total_revenue desc;

--Seller Revenue: Calculate the total sum of price sold by sellers in the seller_state of 'SP'. 
--(Join sellers to order_items)

select sd.seller_state ,sd.seller_id , SUM(id.price ) as totalprice
from olist_sellers_dataset sd
join olist_order_items_dataset id
on sd.seller_id = id.seller_id 
where sd.seller_state = 'SP'
group by sd.seller_state , sd.seller_id
order by totalprice desc ;

-----------END----------------