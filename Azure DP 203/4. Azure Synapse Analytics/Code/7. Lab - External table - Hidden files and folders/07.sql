DROP EXTERNAL TABLE ActivityLog;
DROP EXTERNAL DATA SOURCE srcActivityLog;
DROP DATABASE SCOPED CREDENTIAL sasToken;

CREATE DATABASE SCOPED CREDENTIAL sasToken
WITH IDENTITY ='SHARED ACCESS SIGNATURE',
SECRET='sv=2022-11-02&ss=b&srt=sco&sp=rl&se=2024-06-19T22:01:42Z&st=2024-06-19T14:01:42Z&spr=https&sig=%2FDd2uuN3c1ICEIMpAgjOTn6f%2BNGfgJD9agEFQtmC0cI%3D'

-- Make sure that we use the dfs.core.windows.net
-- This will make use of the directory feature of data lake
-- When using blob.core.windows.net , it would work for a single file
CREATE EXTERNAL DATA SOURCE srcActivityLog
WITH 
(
    LOCATION='abfss://data@datalake4000050.dfs.core.windows.net',
    TYPE = HADOOP,
     CREDENTIAL=sasToken
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
    LOCATION='/csv/',
    DATA_SOURCE=srcActivityLog,
    FILE_FORMAT=delimitedTxtFileFormat
)

SELECT * FROM ActivityLog;

