WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY month
),
growth AS (
    SELECT 
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS prev_revenue
    FROM monthly_revenue
)
SELECT 
    month,
    revenue,
    prev_revenue,
    ROUND((revenue - prev_revenue) / prev_revenue * 100,2) AS growth_percent
FROM growth;