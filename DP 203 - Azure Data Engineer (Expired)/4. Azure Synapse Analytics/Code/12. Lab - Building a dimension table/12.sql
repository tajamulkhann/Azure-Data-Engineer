
-- For the Product dimension table

SELECT pd.[ProductID],pd.[ProductNumber],pd.[Color],pd.[ProductCategoryID],
ct.[Name] AS 'ProductCategoryName'
FROM [SalesLT].[Product] pd INNER JOIN [SalesLT].[ProductCategory] ct
ON pd.[ProductCategoryID]=ct.[ProductCategoryID]
WHERE pd.[Color] IS NOT NULL

-- For the Customer dimension table

SELECT [CustomerID],[CompanyName] FROM [SalesLT].[Customer];