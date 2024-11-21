{% macro average_unit_price_by_product_line(table_name) %}
    select
        Product_line,
        avg(Unit_price) as average_unit_price
    from {{ ref(table_name) }}
    group by Product_line
{% endmacro %}
