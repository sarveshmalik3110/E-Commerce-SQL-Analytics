WITH customer_revenue AS (
    SELECT 
        o.customer_id,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
),
ranked AS (
    SELECT 
        customer_id,
        revenue,
        SUM(revenue) OVER (ORDER BY revenue DESC) /
        SUM(revenue) OVER () AS cumulative_ratio
    FROM customer_revenue
)
SELECT *
FROM ranked
WHERE cumulative_ratio <= 0.5;