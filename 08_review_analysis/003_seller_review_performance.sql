WITH seller_reviews AS (
    SELECT 
        oi.seller_id,
        AVG(r.review_score) AS avg_score
    FROM order_reviews r
    JOIN order_items oi
    ON r.order_id = oi.order_id
    GROUP BY oi.seller_id
)
SELECT *
FROM seller_reviews
WHERE avg_score > 4;