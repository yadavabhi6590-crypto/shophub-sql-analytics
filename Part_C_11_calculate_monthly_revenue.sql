



WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.order_delivered_carrier_date, '%Y-%m') AS month,
        ROUND(SUM(oi.price), 2) AS current_month_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_delivered_carrier_date IS NOT NULL
    GROUP BY DATE_FORMAT(o.order_delivered_carrier_date, '%Y-%m')
)
SELECT 
    month,
    current_month_revenue,
    LAG(current_month_revenue) OVER (ORDER BY month) AS previeous_month_revenue,
    ROUND(
        ((current_month_revenue - LAG(current_month_revenue) OVER (ORDER BY month)) 
        / LAG(current_month_revenue) OVER (ORDER BY month)) * 100, 2
    ) AS mom_growth_parcentage
FROM monthly_revenue
ORDER BY month;