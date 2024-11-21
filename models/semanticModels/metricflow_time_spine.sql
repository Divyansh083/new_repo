{{ config(materialized = 'table') }}

with days as (
    {{ dbt_utils.date_spine(
        datepart='day',
        start_date="to_date('01/01/2000','mm/dd/yyyy')",
        end_date="to_date('01/01/2027','mm/dd/yyyy')"
    ) }}
),
final as (
    select cast(date_day as date) as date_day
    from days
)
select * from final