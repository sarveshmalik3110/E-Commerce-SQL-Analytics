WITH daily_revenue AS (
    SELECT 
        DATE(o.order_purchase_timestamp) AS order_date,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE(o.order_purchase_timestamp)
)
SELECT 
    order_date,
    revenue,
    SUM(revenue) OVER (ORDER BY order_date) AS running_revenue
FROM daily_revenue;