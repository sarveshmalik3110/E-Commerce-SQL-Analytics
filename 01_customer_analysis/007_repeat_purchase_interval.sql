WITH purchase_dates AS (
    SELECT 
        customer_id,
        order_purchase_timestamp,
        LAG(order_purchase_timestamp) 
        OVER(PARTITION BY customer_id ORDER BY order_purchase_timestamp) AS prev_purchase
    FROM orders
),
purchase_diff AS (
    SELECT 
        customer_id,
        DATEDIFF(order_purchase_timestamp, prev_purchase) AS days_between
    FROM purchase_dates
    WHERE prev_purchase IS NOT NULL
)
SELECT 
    customer_id,
    AVG(days_between) AS avg_days_between_orders
FROM purchase_diff
GROUP BY customer_id;