WITH seller_orders AS (
    SELECT 
        oi.seller_id,
        o.order_status
    FROM order_items oi
    JOIN orders o
    ON oi.order_id = o.order_id
)
SELECT 
    seller_id,
    COUNT(*) AS total_orders,
    SUM(order_status='canceled') AS canceled_orders,
    ROUND(SUM(order_status='canceled') / COUNT(*) * 100,2) AS cancel_rate
FROM seller_orders
GROUP BY seller_id;