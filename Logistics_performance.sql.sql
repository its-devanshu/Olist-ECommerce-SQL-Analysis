--Logistics Performance & SLA Monitoring 🚚
--Focuses on operational efficiency. We'll calculate delivery delays by comparing estimated vs. actual delivery dates across different Brazilian states to find supply chain bottlenecks.
WITH performance_table AS (
    SELECT 
        c.customer_state,
        c.customer_city,
        CASE 
            WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 'On-time'
            ELSE 'Late'
        END AS delivery_performance,
        COUNT(*) AS total_orders
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY 1, 2, 3
)
SELECT 
    customer_state,
    SUM(total_orders) AS total_delivery_volume,
    SUM(CASE WHEN delivery_performance = 'Late' THEN total_orders ELSE 0 END) AS late_order_count,
    ROUND(
        SUM(CASE WHEN delivery_performance = 'Late' THEN total_orders ELSE 0 END) * 100.0 / SUM(total_orders), 
        2
    ) AS late_percentage
FROM performance_table
GROUP BY customer_state
ORDER BY late_percentage DESC; -- Shows the worst performing states at the top