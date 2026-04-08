--
--    Customer Geography: The marketing team wants a simple list of where our customers live. 
--                          Write a query that returns only the customer_city and customer_state. (Table: olist_customers_dataset)
select customer_state,customer_city from olist_customers_dataset;

--All Seller Info: The partnerships team wants to see the raw data for all sellers. Return every column. (Table: olist_sellers_dataset)
select * from olist_sellers_dataset;

--Delivered Orders: Customer service wants a list of successful shipments. 
--Return all columns where the order_status is exactly 'delivered'. (Table: olist_orders_dataset)
 select * from olist_orders_dataset where order_status = 'delivered';

--Credit Card Payments: Finance wants to audit credit card usage. 
--Return the order_id and payment_value where the payment_type is 'credit_card'. 
select order_id,payment_value,payment_type from olist_order_payments_dataset where payment_type = 'credit_card';

--Heavy Freight: Logistics is auditing expensive shipping. Return the order_id and freight_value where the freight cost is greater than $50. 
--(Table: olist_order_items_dataset)
select order_id, freight_value from olist_order_items_dataset where freight_value > 50 order by freight_value ;

--Specific Category: Merchandising needs a list of toys. 
--Return the product_id and product_weight_g where the product_category_name is 'brinquedos' (the Portuguese word for toys). 
--(Table: olist_products_dataset)
select product_id, product_weight_g, product_category_name from olist_products_dataset where product_category_name = 'brinquedos';

--São Paulo Customers: The regional manager wants to see local customers.
-- Return the customer_id and customer_city where the customer_state is 'SP'. 
select customer_id, customer_city , customer_state from olist_customers_dataset ocd where customer_state = 'SP';

--High-Value Payments: The VIP team is looking for big spenders. 
--Return all columns where the payment_value is strictly greater than or equal to $1,000.
select * from olist_order_payments_dataset where payment_value >= 1000 order by payment_value;

--Part 2: Sorting the Data (ORDER BY)
--Cheap Products: Pricing wants to see our lowest-priced items. Return the product_id and price, sorted from lowest price to highest. 
select product_id, price from olist_order_items_dataset ooid order by  price;

--Recent Orders: The operations team wants to see the newest orders first. 
--Return the order_id and order_purchase_timestamp, sorted by date from newest to oldest (descending).
select order_id, order_purchase_timestamp from olist_orders_dataset order by order_purchase_timestamp desc ;

--Long Product Names: Content reviewers are looking at product descriptions. 
--Return the product_id and product_category_name, sorted by product_name_lenght from longest to shortest. 
--(Table: olist_products_dataset)
select product_id, product_category_name from olist_products_dataset where product_name_lenght is not null order by product_name_lenght desc;

--Part 3: Restricting Results (LIMIT)
--Top 10 Heaviest Items: Logistics needs to plan freight space. 
--Return the product_id and product_weight_g, sorted by weight descending, but only show the top 10 rows. 
--(Table: olist_products_dataset)
select product_id, product_weight_g from olist_products_dataset where product_weight_g is not null order by product_weight_g desc limit 10;

--Top 5 Expensive Freights: Finance is looking at the highest shipping costs. Return the order_id and freight_value, sorted by freight descending, limited to 5 rows. 
--(Table: olist_order_items_dataset)
select order_id, freight_value from olist_order_items_dataset order by freight_value desc limit 5;

--First 20 Customers: The tech team needs a small sample of customer data to test a new app. Return all columns, limited to just 20 rows. 
--(Table: olist_customers_dataset)
select * from olist_customers_dataset limit 20;

--Part 4: Putting It All Together
--Top Vouchers: Return the order_id and payment_value for orders paid using a 'voucher', sorted by the payment value from highest to lowest. 
--(Table: olist_order_payments_dataset)
select order_id, payment_value, payment_type from olist_order_payments_dataset where payment_type = 'voucher' order by payment_value desc;

--Canceled Orders Timeline: Return the order_id and order_purchase_timestamp for 'canceled' orders, sorted by the timestamp from newest to oldest. 
--(Table: olist_orders_dataset)
select order_id, order_purchase_timestamp , order_status from 
olist_orders_dataset where order_status = 'canceled' order by order_purchase_timestamp desc;

--Lightweight Sports Items: Return the product_id and product_weight_g where the category is 'esporte_lazer' (sports & leisure), sorted from lightest to heaviest. 
--(Table: olist_products_dataset)
select product_id, product_weight_g , product_category_name from olist_products_dataset where product_category_name = 'esporte_lazer' order by product_weight_g;

--High Installment Plans: Return the order_id and payment_installments where the customer used 10 or more installments, sorted by the highest number of installments at the top. 
--(Table: olist_order_payments_dataset)
select order_id, payment_installments, payment_type from olist_order_payments_dataset where payment_type = 'credit_card' and payment_installments > 10 order by payment_installments desc;

--Premium Items: Return the order_id and price where the price is greater than $500, sorted from most expensive to least expensive, showing only the top 15 rows. 
--(Table: olist_order_items_dataset)
select order_id, price from olist_order_items_dataset where price > 500 order by price desc limit 15;

--Rio Sellers: Return the seller_id and seller_zip_code_prefix where the seller_city is 'rio de janeiro', sorted by the zip code ascending. 
--(Table: olist_sellers_dataset)
select seller_id,seller_zip_code_prefix,seller_city from olist_sellers_dataset where seller_city = 'rio de janeiro' order by seller_zip_code_prefix asc;

-----------END----------------






