WITH monthly_customers AS (
    SELECT 
        DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
        customer_id
    FROM orders
),
retention AS (
    SELECT 
        a.month,
        COUNT(DISTINCT a.customer_id) AS current_customers,
        COUNT(DISTINCT b.customer_id) AS returning_customers
    FROM monthly_customers a
    LEFT JOIN monthly_customers b
    ON a.customer_id = b.customer_id
    AND b.month = DATE_FORMAT(
        DATE_ADD(STR_TO_DATE(a.month,'%%Y-%%m'), INTERVAL 1 MONTH),
        '%Y-%m'
    )
    GROUP BY a.month
)
SELECT *
FROM retention;