WITH stats AS (
    SELECT 
        AVG(payment_value) AS avg_payment,
        STDDEV(payment_value) AS std_payment
    FROM order_payments
),
anomalies AS (
    SELECT 
        op.*
    FROM order_payments op
    JOIN stats s
    ON op.payment_value > s.avg_payment + 3 * s.std_payment
)
SELECT *
FROM anomalies;