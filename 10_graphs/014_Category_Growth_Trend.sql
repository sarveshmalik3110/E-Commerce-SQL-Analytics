WITH monthly_category_revenue AS (
SELECT
p.product_category_name,
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name, month
)

SELECT *
FROM monthly_category_revenue
ORDER BY product_category_name, month;