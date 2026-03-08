WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY month
)
SELECT 
    AVG(revenue) AS forecast_monthly_revenue
FROM monthly_revenue;