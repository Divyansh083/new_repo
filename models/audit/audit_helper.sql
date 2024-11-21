-- models/audit/audit_helper.sql
WITH base_data AS (
    SELECT
        *
    FROM {{ ref('stg_sales') }}
),

null_checks AS (
    SELECT
        'BRANCH' AS column_name, COUNT(*) AS null_count
    FROM base_data
    WHERE BRANCH IS NULL
    UNION ALL
    SELECT
        'CITY' AS column_name, COUNT(*) AS null_count
    FROM base_data
    WHERE CITY IS NULL
    UNION ALL
    SELECT
        'COGS' AS column_name, COUNT(*) AS null_count
    FROM base_data
    WHERE COGS IS NULL
    -- Repeat for other columns...
),

range_checks AS (
    SELECT
        COUNT(*) AS invalid_rating_count
    FROM base_data
    WHERE RATING < 1 OR RATING > 5
),

unique_checks AS (
    SELECT
        COUNT(*) - COUNT(DISTINCT INVOICE_ID) AS non_unique_invoices
    FROM base_data
)

SELECT
    -- Null checks
    column_name,
    null_count
FROM null_checks

UNION ALL

SELECT
    'Rating Out of Range' AS check_type,
    invalid_rating_count AS issues_count
FROM range_checks

UNION ALL

SELECT
    'Duplicate Invoices' AS check_type,
    non_unique_invoices AS issues_count
FROM unique_checks
