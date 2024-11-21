SELECT
    PRODUCT_LINE,
    ROUND(SUM(TOTAL), 2) AS total_sales,
    ROUND(AVG(GROSS_MARGIN_PERCENTAGE), 2) AS avg_margin_percentage
FROM {{ ref('stg_sales') }}  
GROUP BY PRODUCT_LINE
ORDER BY total_sales DESC
