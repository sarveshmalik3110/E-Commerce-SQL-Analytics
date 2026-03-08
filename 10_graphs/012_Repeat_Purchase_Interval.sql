WITH purchase_dates AS (
SELECT
customer_id,
DATE(order_purchase_timestamp) AS purchase_date
FROM orders
),

ordered_dates AS (
SELECT
customer_id,
purchase_date,
LAG(purchase_date) OVER(
PARTITION BY customer_id
ORDER BY purchase_date
) AS previous_purchase
FROM purchase_dates
)

SELECT
customer_id,
AVG(DATEDIFF(purchase_date, previous_purchase)) AS avg_days_between_orders
FROM ordered_dates
WHERE previous_purchase IS NOT NULL
GROUP BY customer_id;