WITH product_revenue AS (
    SELECT 
        p.product_id,
        SUM(oi.price) AS revenue
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY p.product_id
)
SELECT 
    product_id,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS product_rank
FROM product_revenue;