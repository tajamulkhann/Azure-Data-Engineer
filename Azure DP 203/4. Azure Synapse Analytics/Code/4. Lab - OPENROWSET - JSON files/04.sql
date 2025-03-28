SELECT * 
FROM OPENROWSET(
    BULK 'https://datalake50000.blob.core.windows.net/data/ActivityLog01.json',
    FORMAT = 'csv',
    FIELDTERMINATOR ='0x0b',
    FIELDQUOTE = '0x0b',
    ROWTERMINATOR='0x0a') 
    WITH
    (
        jsonContent varchar(MAX)
    )
    AS ROWS


SELECT JSON_VALUE(jsonContent,'$.Correlationid') As Correlationid,
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
    FORMAT = 'csv',
    FIELDTERMINATOR ='0x0b',
    FIELDQUOTE = '0x0b',
    ROWTERMINATOR='0x0a') 
    WITH
    (
        jsonContent varchar(MAX)
    )
    AS ROWS
