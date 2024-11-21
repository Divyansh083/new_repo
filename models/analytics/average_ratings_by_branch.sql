SELECT
    branch,
    AVG(rating) AS average_rating
FROM {{ ref('stg_sales') }}
GROUP BY branch
