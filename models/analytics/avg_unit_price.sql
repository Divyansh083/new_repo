select
    Product_line,
    average_unit_price
from (
    {{ average_unit_price_by_product_line('stg_sales') }}
) as average_prices

