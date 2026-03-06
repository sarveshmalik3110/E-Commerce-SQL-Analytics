WITH category_revenue AS (
    SELECT 
        p.product_category_name,
        SUM(oi.price) AS revenue
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY p.product_category_name
)
SELECT 
    product_category_name,
    revenue,
    ROUND(revenue / SUM(revenue) OVER () * 100,2) AS contribution_percent
FROM category_revenue;