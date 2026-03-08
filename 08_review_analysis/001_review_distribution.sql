WITH review_counts AS (
    SELECT 
        review_score,
        COUNT(*) AS total_reviews
    FROM order_reviews
    GROUP BY review_score
)
SELECT *
FROM review_counts
ORDER BY review_score;