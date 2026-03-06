WITH last_purchase AS (
    SELECT 
        customer_id,
        MAX(order_purchase_timestamp) AS last_order
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM last_purchase
WHERE last_order < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);