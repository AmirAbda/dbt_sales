{{ config(materialized='view') }}

WITH sales_data AS (
    SELECT * FROM {{ ref('Sales') }}
)
SELECT
    CAST(OrderDate AS DATE) AS OrderDate,
    OrderNumber,
    CAST(ProductKey AS INTEGER) AS ProductKey,
    CAST(CustomerKey AS INTEGER) AS CustomerKey,
    CAST(StockDate AS DATE) AS StockDate,
    CAST(TerritoryKey AS INTEGER) AS TerritoryKey,
    CAST("Sum of OrderLineItem" AS INTEGER) AS OrderLineItem,
    CAST("Sum of OrderQuantity" AS INTEGER) AS OrderQuantity,
    CAST(BENEFICE AS DECIMAL(18,2)) AS Benefice,
    CAST("TOTAL COST" AS DECIMAL(18,2)) AS TotalCost,
    CAST("TOTAL REVENUE" AS DECIMAL(18,2)) AS TotalRevenue
FROM
    sales_data