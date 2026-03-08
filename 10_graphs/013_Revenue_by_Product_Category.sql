WITH category_sales AS (
SELECT
p.product_category_name,
SUM(oi.price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
)

SELECT *
FROM category_sales
ORDER BY revenue DESC;