WITH customer_revenue AS (
    SELECT 
        o.customer_id,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT 
    customer_id,
    revenue,
    NTILE(10) OVER (ORDER BY revenue DESC) AS revenue_percentile
FROM customer_revenue;