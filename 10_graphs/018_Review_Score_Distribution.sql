WITH payment_distribution AS (
SELECT
payment_type,
COUNT(*) AS orders
FROM order_payments
GROUP BY payment_type
)

SELECT *
FROM payment_distribution
ORDER BY orders DESC;