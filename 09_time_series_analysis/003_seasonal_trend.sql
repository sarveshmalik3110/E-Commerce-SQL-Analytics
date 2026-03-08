WITH monthly_revenue AS (
    SELECT
        MONTH(order_purchase_timestamp) AS month_number,
        MONTHNAME(order_purchase_timestamp) AS month_name,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY month_number, month_name
)

SELECT
    month_number,
    month_name,
    revenue
FROM monthly_revenue
ORDER BY month_number;