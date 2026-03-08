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
month,
revenue,
LAG(revenue) OVER(ORDER BY month) AS previous_month,
((revenue - LAG(revenue) OVER(ORDER BY month))
/ LAG(revenue) OVER(ORDER BY month))*100 AS growth_percent
FROM monthly_revenue;