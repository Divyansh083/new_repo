{% set payment_methods = ["Cash", "Credit Card", "Ewallet"] %}

select
    INVOICE_ID,
    {% for payment_method in payment_methods %}
    sum(case when PAYMENT = '{{ payment_method }}' then TOTAL end) as {{ payment_method | replace(" ", "_") | lower }}_total
    {% if not loop.last %},{% endif %}
    {% endfor %}
    ,
    sum(TOTAL) as total_amount
from {{ ref('stg_sales') }}
group by INVOICE_ID
