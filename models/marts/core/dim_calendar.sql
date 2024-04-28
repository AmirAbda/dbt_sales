{{ config(materialized='table', description='Dimension table for calendar data') }}

SELECT
    année AS calendar_year,
    trimestre AS calendar_quarter,
    mois AS calendar_month,
    jour AS calendar_day,
    total_orders
FROM
    {{ ref('stg_calendar') }}