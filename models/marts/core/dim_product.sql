{{ config(materialized='table', description='Dimension table for product information') }}

WITH product_data AS (
    SELECT *
    FROM {{ ref('stg_product') }}
)

SELECT
    -- Surrogate key
    CAST(ProductKey AS VARCHAR) AS product_id,

    -- Product attributes
    ProductSKU AS product_sku,
    ProductName AS product_name,
    ModelName AS model_name,
    ProductColor AS product_color,
    ProductStyle AS product_style,
    TotalProductCost AS total_product_cost,
    TotalProductPrice AS total_product_price,
    TotalDiscountPrice AS total_discount_price,
    SKUCategory AS sku_category,
    PricePoint AS price_point,
    ProductDescription AS product_description,
    ProductSubcategoryKey AS product_subcategory_key
FROM
    product_data