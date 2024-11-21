import pandas as pd

def model(dbt, session):
    # Load the cleaned data model or table
    raw_data = dbt.ref('stg_sales').to_pandas()

    # Group by GENDER and calculate total sales and total gross income
    gender_data = raw_data.groupby('GENDER').agg(
        total_sales=('TOTAL', 'sum'),
        total_gross_income=('GROSS_INCOME', 'sum')
    ).reset_index()

    # Round off the results
    gender_data['total_sales'] = gender_data['total_sales'].round(2)
    gender_data['total_gross_income'] = gender_data['total_gross_income'].round(2)

    # Return the resulting DataFrame to DBT
    return gender_data
