WITH installment_data AS (
    SELECT 
        payment_installments,
        AVG(payment_value) AS avg_value
    FROM order_payments
    GROUP BY payment_installments
)
SELECT *
FROM installment_data
ORDER BY payment_installments;