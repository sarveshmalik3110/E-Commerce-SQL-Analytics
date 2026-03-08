WITH daily_revenue AS (
SELECT
DATE(o.order_purchase_timestamp) AS order_date,
SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY order_date
)

SELECT
order_date,
revenue,
AVG(revenue) OVER(
ORDER BY order_date
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS moving_avg_7_day
FROM daily_revenue;