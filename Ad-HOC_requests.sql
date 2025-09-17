Use retail_events_db;
SELECT DISTINCT f.product_code,dp.product_name
FROM fact_events AS f 
JOIN dim_products AS dp ON dp.product_code = f.product_code
where f.base_price > 500 AND f.promo_type = 'BOGOF';

SELECT DISTINCT city , COUNT(DISTINCT(store_id)) AS store_count
FROM dim_stores 
GROUP BY city 
ORDER BY store_count DESC ;

SELECT 
    dc.campaign_name,
    ROUND(SUM(f.base_price * f.`quantity_sold(before_promo)`) / 1000000.0, 2) 
        AS Total_revenue_Before_promotion_Millions,
    ROUND(SUM(f.base_price * f.`quantity_sold(after_promo)`) / 1000000.0, 2)  
        AS Total_revenue_After_promotion_Millions
FROM fact_events AS f
JOIN dim_campaigns AS dc 
    ON dc.campaign_id = f.campaign_id
GROUP BY f.campaign_id, dc.campaign_name;

WITH category_summary AS (
    SELECT 
        dp.category,
        (SUM(f.`quantity_sold(after_promo)`) - SUM(f.`quantity_sold(before_promo)`)) * 100.0 / 
         SUM(f.`quantity_sold(before_promo)`) AS ISU_percent
    FROM fact_events AS f
    JOIN dim_products AS dp 
        ON dp.product_code = f.product_code
    GROUP BY dp.category
)
SELECT 
    category,
    ISU_percent,
    DENSE_RANK() OVER (ORDER BY ISU_percent DESC) AS rnk
FROM category_summary;

WITH product_summary AS (
    SELECT 
        dp.category,
        dp.product_name,
        (SUM(f.base_price * f.`quantity_sold(after_promo)`) - SUM(f.base_price * f.`quantity_sold(before_promo)`)) * 100.0 / 
         SUM(f.base_price * f.`quantity_sold(before_promo)`) AS IR_percent
    FROM fact_events AS f
    JOIN dim_products AS dp 
        ON dp.product_code = f.product_code
    GROUP BY dp.product_name, dp.category
)
SELECT 
    product_name,
    category,
    IR_percent,
    DENSE_RANK() OVER (ORDER BY IR_percent DESC) AS rnk
FROM product_summary
LIMIT 5;








