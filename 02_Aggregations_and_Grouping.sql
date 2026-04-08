
--Total Customer Base: The CEO wants a headcount. Count the total number of records in the customer database. (Table: olist_customers_dataset)
select count(*) from olist_customers_dataset;

--All-Time Revenue: The Finance team needs the lifetime gross revenue. Calculate the sum of all payment_value. (Table: olist_order_payments_dataset)
select sum(payment_value) from olist_order_payments_dataset;

--Record High Price: Merchandising wants to know the ceiling of our pricing. Find the absolute maximum price ever charged for a single item. 
--(Table: olist_order_items_dataset)
select max(price)from olist_order_items_dataset;

--Average Installments: Finance is analyzing credit risk. What is the overall average number of payment_installments used across all orders? 
--(Table: olist_order_payments_dataset)
select avg(payment_installments) from olist_order_payments_dataset;

--Lightest Item: Logistics is reviewing shipping minimums. Find the minimum product_weight_g in the catalog. (Table: olist_products_dataset)
select min (product_weight_g) from olist_products_dataset;

--Part 2: Basic Grouping (COUNT + GROUP BY)
--Focus on tallying up items into buckets.
--
--Customer Footprint: Marketing wants a breakdown of customer locations. 
--Count the total number of customers in each customer_state. (Table: olist_customers_dataset)
select customer_state, count(customer_state) from olist_customers_dataset group by customer_state;

--Order Health: Customer Service is checking the pipeline. Count the total number of orders grouped by their order_status. 
--(Table: olist_orders_dataset)
select order_status, count (*) from olist_orders_dataset group by 
order_status;

--Payment Preferences: Finance is auditing payment gateways. 
--Count the number of transactions for each payment_type. (Table: olist_order_payments_dataset)
select payment_type,count(*) from olist_order_payments_dataset group by payment_type;

--Sellers per State: The Partnerships team is looking at seller distribution. 
--Count how many sellers are located in each seller_state. (Table: olist_sellers_dataset)
select seller_state, count (*) from olist_sellers_dataset group by seller_state;

--Catalog Size: Merchandising wants to see catalog diversity. Count the number of products grouped by their product_category_name. 
--(Table: olist_products_dataset)
select product_category_name , count (*) from olist_products_dataset group by product_category_name;

--Part 3: Grouping + Math (SUM/AVG/MAX + GROUP BY)
--Focus on calculating values for specific buckets.
--
--Revenue by Payment Type: Finance needs the gross revenue split by method. Calculate the total sum of payment_value for each payment_type. 
--(Table: olist_order_payments_dataset)
select payment_type, sum(payment_value), count (*) from olist_order_payments_dataset group by payment_type;

--Average Freight per Order: Logistics wants to see shipping costs per package. 
--Calculate the average freight_value grouped by order_id. (Table: olist_order_items_dataset)
select order_id, avg(freight_value) from olist_order_items_dataset group by order_id;

--Max Installments by Method: Finance is looking at lending limits. Find the maximum number of payment_installments allowed for each payment_type. 
--(Table: olist_order_payments_dataset)
select payment_type, max(payment_installments) from olist_order_payments_dataset group by payment_type;

--Weight by Category: Logistics is planning warehouse shelving. Calculate the average product_weight_g for each product_category_name. 
--(Table: olist_products_dataset)
select product_category_name, avg(product_weight_g) from olist_products_dataset group by product_category_name;

--Total Value per Order: The Sales team wants to see the total item revenue per cart. Calculate the sum of price grouped by order_id. 
--(Table: olist_order_items_dataset)
select order_id , SUM(price)from olist_order_items_dataset group by order_id;

--Part 4: Putting it Together (GROUP BY + ORDER BY + LIMIT)
--Focus on finding the top/bottom performers.
--Top 5 Customer States: Marketing wants to target ads. 
--Find the top 5 customer_states with the highest count of customers, sorted from most to least. 
--(Table: olist_customers_dataset)
select customer_state, count(*) as N0_of_customers from olist_customers_dataset group by customer_state  order by N0_of_customers desc limit 5;

--Top 10 Largest Categories: Merchandising wants to see our biggest departments. 
--Find the top 10 product_category_names with the highest count of products, sorted descending. 
--(Table: olist_products_dataset)
select product_category_name, count(*) as no_category_name from olist_products_dataset group by product_category_name order by no_category_name desc limit 10;

--Bottom 3 Revenue Streams: Finance wants to cut unpopular payment methods. 
--Find the 3 payment_types with the lowest total sum of payment_value, sorted ascending. 
--(Table: olist_order_payments_dataset)
select * from olist_order_payments_dataset;
select payment_type , sum (payment_value )as totalvalues from olist_order_payments_dataset group by payment_type order by totalvalues limit 3;

--Top 5 Most Expensive Shipping Orders: Logistics is auditing freight anomalies. 
--Calculate the total sum of freight_value for each order_id, and show the top 5 highest orders. (Table: olist_order_items_dataset)
select order_id, sum(freight_value)as total_fv from olist_order_items_dataset group by order_id order by total_fv desc limit 5;

--Top 5 Seller Cities: Partnerships wants to host local seller events. 
--Find the top 5 seller_citys with the highest count of sellers. (Table: olist_sellers_dataset)
select seller_city, count(*) as total_sellers from olist_sellers_dataset group by seller_city  order by total_sellers desc limit 5;

-----------END----------------
