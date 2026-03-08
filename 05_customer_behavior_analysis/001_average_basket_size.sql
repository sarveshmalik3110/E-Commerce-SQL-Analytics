WITH basket_size AS (
    SELECT 
        order_id,
        COUNT(order_item_id) AS items
    FROM order_items
    GROUP BY order_id
)
SELECT 
    AVG(items) AS avg_basket_size
FROM basket_size;