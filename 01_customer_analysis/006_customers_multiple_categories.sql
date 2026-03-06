WITH customer_categories AS (
    SELECT 
        o.customer_id,
        COUNT(DISTINCT p.product_category_name) AS category_count
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.customer_id
)
SELECT *
FROM customer_categories
WHERE category_count > 1;