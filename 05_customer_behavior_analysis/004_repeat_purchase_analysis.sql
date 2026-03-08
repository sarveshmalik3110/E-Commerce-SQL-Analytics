WITH purchase_dates AS (
    SELECT
        customer_id,
        DATE(order_purchase_timestamp) AS purchase_date
    FROM orders
),

ordered_purchases AS (
    SELECT
        customer_id,
        purchase_date,
        LAG(purchase_date) OVER(
            PARTITION BY customer_id
            ORDER BY purchase_date
        ) AS previous_purchase
    FROM purchase_dates
),

purchase_intervals AS (
    SELECT
        customer_id,
        DATEDIFF(purchase_date, previous_purchase) AS days_between_orders
    FROM ordered_purchases
    WHERE previous_purchase IS NOT NULL
)

SELECT
    customer_id,
    AVG(days_between_orders) AS avg_days_between_purchases
FROM purchase_intervals
GROUP BY customer_id
ORDER BY avg_days_between_purchases;