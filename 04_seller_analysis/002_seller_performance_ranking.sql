WITH seller_revenue AS (
    SELECT 
        seller_id,
        SUM(price) AS revenue
    FROM order_items
    GROUP BY seller_id
)
SELECT 
    seller_id,
    revenue,
    RANK() OVER(ORDER BY revenue DESC) AS seller_rank
FROM seller_revenue;