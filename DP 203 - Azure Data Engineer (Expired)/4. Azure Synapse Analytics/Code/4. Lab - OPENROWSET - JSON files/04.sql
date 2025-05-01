-- Reads a JSON file from Azure Data Lake and stores it as a single column  

SELECT *  
FROM OPENROWSET(  
    BULK 'https://datalake50000.blob.core.windows.net/data/ActivityLog01.json'
    FORMAT = 'csv',  -- Treats the file as CSV (even though it's JSON)  
    FIELDTERMINATOR ='0x0b',  -- Specifies the field separator (not used for JSON but required for syntax)  
    FIELDQUOTE = '0x0b',  -- Specifies the quote character (not relevant for JSON)  
    ROWTERMINATOR='0x0a'  -- Defines the row termination (newline character)  
)  
WITH  
(  
    jsonContent varchar(MAX)  -- Reads the entire JSON content into a single column  
)  
AS ROWS;  -- Aliases the result set  

------------------------------------------------------------

-- Reads a JSON file from Azure Data Lake, extracts specific fields, and presents them as multiple columns.

SELECT  
   JSON_VALUE(jsonContent,'$.Correlationid') As Correlationid, 
   JSON_VALUE(jsonContent,'$.Operationname') AS Operationname, 
   JSON_VALUE(jsonContent,'$.Status') AS Status, 
   JSON_VALUE(jsonContent,'$.Eventcategory') AS Eventcategory, 
   JSON_VALUE(jsonContent,'$.Level') AS Level, 
   CAST(JSON_VALUE(jsonContent,'$.Time') AS datetimeoffset) AS Time, 
   JSON_VALUE(jsonContent,'$.Subscription') AS Subscription, 
   JSON_VALUE(jsonContent,'$.Eventinitiatedby') AS Eventinitiatedby,
   JSON_VALUE(jsonContent,'$.Resourcetype') AS Resourcetype,
   JSON_VALUE(jsonContent,'$.Resourcegroup') AS Resourcegroup,
   JSON_VALUE(jsonContent,'$.Resource') AS Resource
FROM OPENROWSET(  
    BULK 'https://datalake50000.blob.core.windows.net/data/ActivityLog01.json',
    FORMAT = 'csv',  -- Treats the file as CSV (workaround for reading JSON)  
    FIELDTERMINATOR ='0x0b',  -- Defines the field separator (not used for JSON but required)  
    FIELDQUOTE = '0x0b',  -- Defines the quote character (not relevant for JSON)  
    ROWTERMINATOR='0x0a'  -- Defines row termination (newline character)  
)  
WITH  
(  
    jsonContent varchar(MAX)  -- Reads entire JSON as a single column  
)  
AS ROWS;  -- Aliases the result set  

