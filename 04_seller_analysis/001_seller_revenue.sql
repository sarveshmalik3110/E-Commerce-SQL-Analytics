WITH seller_revenue AS (
    SELECT 
        seller_id,
        SUM(price) AS total_revenue
    FROM order_items
    GROUP BY seller_id
)
SELECT *
FROM seller_revenue
ORDER BY total_revenue DESC;