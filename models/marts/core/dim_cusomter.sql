{{ config(materialized='table', description='Dimension table for customer information') }}

WITH customer_data AS (
    SELECT *
    FROM {{ ref('stg_customer') }}
)

SELECT
    -- Surrogate key
    CAST(customer_key AS VARCHAR) AS customer_id,

    -- Customer attributes
    Prefix,
    FirstName,
    LastName,
    FullName,
    current_age,
    MaritalStatus,
    Gender,
    EmailAddress,
    annual_income,
    total_children,
    EducationLevel,
    Occupation,
    UserName,
    Domain,
    IncomLevel,
    birth_year
FROM
    customer_data