WITH last_sale AS (
    SELECT 
        seller_id,
        MAX(o.order_purchase_timestamp) AS last_sale_date
    FROM order_items oi
    JOIN orders o
    ON oi.order_id = o.order_id
    GROUP BY seller_id
)
SELECT *
FROM last_sale
WHERE last_sale_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);