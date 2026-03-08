WITH city_revenue AS (
SELECT
c.customer_city,
SUM(oi.price) AS revenue
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_city
)

SELECT *
FROM city_revenue
ORDER BY revenue DESC
LIMIT 10;