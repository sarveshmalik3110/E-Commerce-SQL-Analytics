WITH delay_data AS (
    SELECT 
        DATEDIFF(order_delivered_customer_date,
                 order_estimated_delivery_date) AS delay_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
)
SELECT 
    delay_days,
    COUNT(*) AS orders
FROM delay_data
GROUP BY delay_days
ORDER BY delay_days;