DROP TABLE dimProduct;
DROP TABLE dimCustomer;

CREATE TABLE dimProduct
(
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

CREATE TABLE dimCustomer
(
    CustomerID int NOT NULL,
    CompanyName varchar(500) NOT NULL
)
WITH
(
    DISTRIBUTION = REPLICATE
);