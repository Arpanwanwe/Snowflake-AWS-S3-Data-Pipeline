CREATE OR REPLACE TABLE product_sales AS
SELECT
    sod.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalSales,
    SUM(sod.OrderQty) AS TotalQuantity
FROM salesorderdetail_clean sod
JOIN product_clean p
ON sod.ProductID = p.ProductID
GROUP BY sod.ProductID, p.Name;