def model(dbt, session):
    df = dbt.ref('stg_sales')

    df_filtered = df.filter(df['gender'] == 'Female')

    return df_filtered