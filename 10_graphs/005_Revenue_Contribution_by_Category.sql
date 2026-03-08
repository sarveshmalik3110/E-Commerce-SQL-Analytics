WITH category_revenue AS (
SELECT
p.product_category_name,
SUM(oi.price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
),

total_revenue AS (
SELECT SUM(revenue) AS total FROM category_revenue
)

SELECT
cr.product_category_name,
cr.revenue,
(cr.revenue / tr.total)*100 AS revenue_percent
FROM category_revenue cr
JOIN total_revenue tr;