WITH seller_state_revenue AS (
    SELECT 
        s.seller_state,
        oi.seller_id,
        SUM(oi.price) AS revenue
    FROM order_items oi
    JOIN sellers s
    ON oi.seller_id = s.seller_id
    GROUP BY s.seller_state, oi.seller_id
)
SELECT 
    seller_state,
    seller_id,
    revenue,
    RANK() OVER(PARTITION BY seller_state ORDER BY revenue DESC) AS state_rank
FROM seller_state_revenue;