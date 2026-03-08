WITH payment_counts AS (
    SELECT 
        payment_type,
        COUNT(*) AS total
    FROM order_payments
    GROUP BY payment_type
)
SELECT *
FROM payment_counts
ORDER BY total DESC;