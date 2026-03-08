WITH delivery_delay AS (
    SELECT 
        order_id,
        DATEDIFF(order_delivered_customer_date,
                 order_estimated_delivery_date) AS delay_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
)
SELECT *
FROM delivery_delay;