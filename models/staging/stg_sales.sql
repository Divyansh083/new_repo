SELECT
    CAST(invoice_id AS STRING) AS invoice_id,
    branch,
    city,
    customer_type,
    gender,
    product_line,
    unit_price,
    quantity,
    tax_5,
    total,
    DATE(date) AS purchase_date,
    TO_TIME(time) AS purchase_time,
    payment,
    cogs,
    gross_margin_percentage,
    gross_income,
    rating
FROM {{ source('PUBLIC', 'DIVTABLE') }}
