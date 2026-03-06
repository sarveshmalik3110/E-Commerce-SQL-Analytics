WITH last_purchase AS (
    SELECT 
        customer_id,
        MAX(order_purchase_timestamp) AS last_order
    FROM orders
    GROUP BY customer_id
)
SELECT 
    customer_id,
    last_order,
    CASE 
        WHEN last_order >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
        THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status
FROM last_purchase;