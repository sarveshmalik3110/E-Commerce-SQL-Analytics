WITH last_purchase AS (
    SELECT 
        customer_id,
        MAX(order_purchase_timestamp) AS last_purchase_date
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM last_purchase;