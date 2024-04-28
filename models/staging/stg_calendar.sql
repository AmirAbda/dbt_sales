{{ config(materialized='view', description='Transforms the Calendar data into a clean format') }}

WITH calendar_data AS (
    SELECT
        TRY_CAST(Année AS INTEGER) AS année,
        TRY_CAST(Trimestre AS INTEGER) AS trimestre,
        TRY_CAST(Mois AS INTEGER) AS mois,
        TRY_CAST(Jour AS INTEGER) AS jour,
        TRY_CAST("Total Orders" AS INTEGER) AS total_orders
    FROM
        {{ ref('Calendar') }}
)

SELECT
    année,
    trimestre,
    mois,
    jour,
    total_orders
FROM
    calendar_data