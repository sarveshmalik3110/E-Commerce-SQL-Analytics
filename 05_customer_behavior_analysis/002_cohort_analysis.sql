WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase
    FROM orders
    GROUP BY customer_id
),
cohort_data AS (
    SELECT 
        customer_id,
        DATE_FORMAT(first_purchase,'%Y-%m') AS cohort_month
    FROM first_purchase
)
SELECT 
    cohort_month,
    COUNT(customer_id) AS customers
FROM cohort_data
GROUP BY cohort_month
ORDER BY cohort_month;