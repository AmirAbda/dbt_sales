{{ config(materialized='view') }}

WITH customer_data AS (
    SELECT
        CAST(CustomerKey AS INTEGER) AS customer_key,
        Prefix,
        FirstName,
        LastName,
        CAST("Sum of CurrentAge" AS INTEGER) AS current_age,
        MaritalStatus,
        Gender,
        EmailAddress,
        CAST("Sum of AnnualIncome" AS DECIMAL(18,2)) AS annual_income,
        CAST("Sum of TotalChildren" AS INTEGER) AS total_children,
        EducationLevel,
        Occupation,
        FullName,
        UserName,
        Domain,
        IncomLevel,
        CAST("Sum of BirthYear" AS INTEGER) AS birth_year
    FROM
        {{ ref('Customer') }}
)

SELECT
    customer_key,
    Prefix,
    FirstName,
    LastName,
    current_age,
    MaritalStatus,
    Gender,
    EmailAddress,
    annual_income,
    total_children,
    EducationLevel,
    Occupation,
    FullName,
    UserName,
    Domain,
    IncomLevel,
    birth_year
FROM
    customer_data