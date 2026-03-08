WITH delivery_time AS (
    SELECT 
        c.customer_state,
        DATEDIFF(
            o.order_delivered_customer_date,
            o.order_purchase_timestamp
        ) AS delivery_days
    FROM orders o
    JOIN customers c
    ON o.customer_id = c.customer_id
    WHERE o.order_delivered_customer_date IS NOT NULL
)
SELECT 
    customer_state,
    AVG(delivery_days) AS avg_delivery_days
FROM delivery_time
GROUP BY customer_state;