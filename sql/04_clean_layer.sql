-- Product Clean
CREATE OR REPLACE TABLE product_clean AS
SELECT
    "c1"  AS ProductID,
    "c2"  AS Name,
    "c3"  AS ProductNumber,
    "c4"  AS MakeFlag,
    "c5"  AS FinishedGoodsFlag,
    "c6"  AS Color,
    "c7"  AS SafetyStockLevel,
    "c8"  AS ReorderPoint,
    "c9"  AS StandardCost,
    "c10" AS ListPrice,
    "c11" AS Size,
    "c12" AS SizeUnitMeasureCode,
    "c13" AS WeightUnitMeasureCode,
    "c14" AS Weight,
    "c15" AS DaysToManufacture,
    "c16" AS ProductLine,
    "c17" AS Class,
    "c18" AS Style,
    "c19" AS ProductSubcategoryID,
    "c20" AS ProductModelID,
    "c21" AS SellStartDate,
    "c22" AS SellEndDate,
    "c23" AS DiscontinuedDate,
    "c24" AS rowguid,
    "c25" AS ModifiedDate
FROM product_raw;

-- SalesOrderDetail Clean
CREATE OR REPLACE TABLE salesorderdetail_clean AS
SELECT
    "c1" AS SalesOrderID,
    "c2" AS SalesOrderDetailID,
    "c3" AS CarrierTrackingNumber,
    "c4" AS OrderQty,
    "c5" AS ProductID,
    "c6" AS SpecialOfferID,
    "c7" AS UnitPrice,
    "c8" AS UnitPriceDiscount,
    "c9" AS LineTotal,
    "c10" AS rowguid,
    "c11" AS ModifiedDate
FROM salesorderdetail_raw;