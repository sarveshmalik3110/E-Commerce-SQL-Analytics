WITH customer_revenue AS (
SELECT
o.customer_id,
SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.customer_id
),

ranked_customers AS (
SELECT
customer_id,
revenue,
SUM(revenue) OVER(ORDER BY revenue DESC) AS cumulative_revenue
FROM customer_revenue
)

SELECT *
FROM ranked_customers;