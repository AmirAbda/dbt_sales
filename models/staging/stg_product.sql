{{ config(materialized='view') }}

WITH product_data AS (
    SELECT * FROM {{ ref('Product') }}
)
SELECT
    ProductKey,
    ProductSubcategoryKey,
    ProductSKU,
    ProductName,
    ModelName,
    ProductColor,
    ProductStyle,
    SUM("Sum of ProductCost") AS TotalProductCost,
    SUM("Sum of ProductPrice") AS TotalProductPrice,
    SUM("Sum of DiscountPrice") AS TotalDiscountPrice,
    "SKU Category" AS SKUCategory,
    "Price Point" AS PricePoint,
    ProductDescription
FROM 
    product_data
GROUP BY
    ProductKey,
    ProductSubcategoryKey,
    ProductSKU,
    ProductName,
    ModelName,
    ProductColor,
    ProductStyle,
    "SKU Category",
    "Price Point",
    ProductDescription