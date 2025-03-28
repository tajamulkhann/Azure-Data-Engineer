SELECT 
hd.[SalesOrderID],hd.[OrderDate],hd.[CustomerID],hd.[SubTotal],hd.[TaxAmt],hd.[Freight],hd.[TotalDue],
dt.[OrderQty],dt.[ProductID],dt.[UnitPrice],dt.[UnitPriceDiscount],dt.[LineTotal]
FROM [SalesLT].[SalesOrderHeader] hd INNER JOIN [SalesLT].[SalesOrderDetail] dt
ON hd.[SalesOrderID]=dt.[SalesOrderID];


