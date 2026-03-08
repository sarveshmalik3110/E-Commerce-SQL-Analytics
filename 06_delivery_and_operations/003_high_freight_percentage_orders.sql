WITH freight_ratio AS (
    SELECT 
        order_id,
        price,
        freight_value,
        freight_value / price AS ratio
    FROM order_items
)
SELECT *
FROM freight_ratio
WHERE ratio > 0.2;