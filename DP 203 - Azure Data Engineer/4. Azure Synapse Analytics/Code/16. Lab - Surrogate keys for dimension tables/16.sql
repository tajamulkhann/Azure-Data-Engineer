DROP TABLE dimProduct;

CREATE TABLE dimProduct
(
    ProductSK INT IDENTITY(1,1) NOT NULL,
    ProductID int NOT NULL,
    ProductNumber varchar(100) NOT NULL,
    Color varchar(20) NOT NULL,
    ProductCategoryID int NOT NULL,
    ProductCategoryName varchar(200) NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
);
