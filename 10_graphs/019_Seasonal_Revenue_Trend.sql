WITH seasonal_sales AS (
SELECT
MONTH(order_purchase_timestamp) AS month_number,
MONTHNAME(order_purchase_timestamp) AS month,
SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month_number, month
)

SELECT *
FROM seasonal_sales
ORDER BY month_number;