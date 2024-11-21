{% test test_positive_values(model, column_name) %}
SELECT 
    *
FROM {{ model }}
WHERE {{ column_name }} < 100
{% endtest %}
