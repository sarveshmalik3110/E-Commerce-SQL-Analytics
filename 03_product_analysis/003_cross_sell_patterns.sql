SELECT 
    a.product_id AS product_1,
    b.product_id AS product_2,
    COUNT(*) AS times_bought_together
FROM order_items a
JOIN order_items b
ON a.order_id = b.order_id
AND a.product_id < b.product_id
GROUP BY product_1, product_2
ORDER BY times_bought_together DESC;