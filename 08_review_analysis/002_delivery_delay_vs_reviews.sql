WITH delivery_data AS (
    SELECT 
        o.order_id,
        CASE 
            WHEN o.order_delivered_customer_date >
                 o.order_estimated_delivery_date
            THEN 'Delayed'
            ELSE 'On Time'
        END AS delivery_status
    FROM orders o
),
review_analysis AS (
    SELECT 
        d.delivery_status,
        AVG(r.review_score) AS avg_score
    FROM delivery_data d
    JOIN order_reviews r
    ON d.order_id = r.order_id
    GROUP BY d.delivery_status
)
SELECT *
FROM review_analysis;