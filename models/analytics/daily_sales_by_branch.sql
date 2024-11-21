SELECT
    invoice_id,
    branch,
    purchase_date,
    SUM(total) AS daily_total_sales,
    SUM(gross_income) AS daily_gross_income
FROM {{ ref('stg_sales') }}
GROUP BY branch, purchase_date, invoice_id
