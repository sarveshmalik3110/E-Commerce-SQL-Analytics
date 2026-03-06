WITH customer_revenue AS (
    SELECT 
        o.customer_id,
        SUM(oi.price) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;