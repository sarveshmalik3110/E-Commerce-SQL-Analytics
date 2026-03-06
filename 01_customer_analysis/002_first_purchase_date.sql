WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM first_purchase;