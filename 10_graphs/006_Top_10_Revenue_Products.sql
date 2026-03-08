WITH product_revenue AS (
SELECT
product_id,
SUM(price) AS revenue
FROM order_items
GROUP BY product_id
)

SELECT *
FROM product_revenue
ORDER BY revenue DESC
LIMIT 10;