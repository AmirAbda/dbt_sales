{{ config(materialized='table') }}

SELECT
    CAST(OrderDate AS DATE) AS order_date,
    OrderNumber AS order_number,
    CAST(ProductKey AS INTEGER) AS product_key,
    CAST(CustomerKey AS INTEGER) AS customer_key,
    CAST(StockDate AS DATE) AS stock_date,
    CAST(TerritoryKey AS INTEGER) AS territory_key,
    CAST("OrderLineItem" AS INTEGER) AS order_line_item,
    CAST("OrderQuantity" AS INTEGER) AS order_quantity,
    CAST(Benefice AS DECIMAL(18,2)) AS profit,
    CAST(TotalCost AS DECIMAL(18,2)) AS total_cost,
    CAST(TotalRevenue AS DECIMAL(18,2)) AS total_revenue
FROM
    {{ ref('stg_sales') }}