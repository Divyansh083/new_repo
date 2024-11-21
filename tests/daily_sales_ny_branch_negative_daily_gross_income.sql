SELECT invoice_id
FROM {{ref('daily_sales_by_branch')}}
WHERE daily_gross_income<0