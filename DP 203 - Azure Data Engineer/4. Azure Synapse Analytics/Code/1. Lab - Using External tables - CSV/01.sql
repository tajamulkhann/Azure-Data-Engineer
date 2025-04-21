CREATE DATABASE [appdb]

CREATE EXTERNAL DATA SOURCE srcActivityLog
WITH 
(
    LOCATION='https://datalake50000.blob.core.windows.net/data'
)

CREATE EXTERNAL FILE FORMAT delimitedTxtFileFormat WITH
(
    FORMAT_TYPE=DELIMITEDTEXT,
    FORMAT_OPTIONS(
        FIELD_TERMINATOR=',',
        FIRST_ROW=2
    )
)

CREATE EXTERNAL TABLE ActivityLog
(
   [Correlationid] varchar(200),
   [Operationname] varchar(300),
   [Status] varchar(100),
   [Eventcategory] varchar(100),
   [Level] varchar(100),
   [Time] varchar(100),
   [Subscription] varchar(200),
   [Eventinitiatedby] varchar(1000),
   [Resourcetype] varchar(300),
   [Resourcegroup] varchar(1000),
   [Resource] varchar(2000))
WITH (
    LOCATION='/ActivityLog01.csv',
    DATA_SOURCE=srcActivityLog,
    FILE_FORMAT=delimitedTxtFileFormat
)

SELECT * FROM ActivityLog;

SELECT COUNT(Operationname) AS 'Count of operations',Status FROM ActivityLog
GROUP BY Status;
