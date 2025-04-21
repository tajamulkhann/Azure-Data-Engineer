DROP TABLE factSales;

CREATE TABLE factSales
(
    SalesOrderID int NOT NULL,
    OrderDate datetime NOT NULL,
    CustomerID int NOT NULL,
    SubTotal money NOT NULL,
    TaxAmt money NOT NULL,
    Freight money NOT NULL,
    TotalDue money NOT NULL,
    OrderQty int,
    ProductID int NOT NULL,
    UnitPrice money NOT NULL,
    UnitPriceDiscount money NOT NULL,
    LineTotal decimal NOT NULL
)
WITH
(
    DISTRIBUTION=HASH(ProductID)
)


SELECT ProductID,COUNT(SalesOrderID) AS 'Count of Sales Orders' FROM factSales
GROUP BY ProductID
ORDER BY ProductID;