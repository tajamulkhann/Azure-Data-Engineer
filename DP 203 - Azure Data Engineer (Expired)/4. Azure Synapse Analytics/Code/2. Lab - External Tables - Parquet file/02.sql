DROP EXTERNAL TABLE ActivityLog;
DROP EXTERNAL DATA SOURCE srcActivityLog;

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@ssword@123'

CREATE DATABASE SCOPED CREDENTIAL sasToken
WITH IDENTITY ='SHARED ACCESS SIGNATURE',
SECRET='sv=2022-11-02&ss=b&srt=sco&sp=rl&se=2024-06-12T23:18:38Z&st=2024-06-12T15:18:38Z&spr=https&sig=S4CDxjxRkRIUBYN0VEMVgkMUB3%2B7Ebm6THJYTX6MasE%3D'


CREATE EXTERNAL DATA SOURCE srcActivityLog
WITH 
(
    LOCATION='https://datalake50000.blob.core.windows.net/rawdata',
    CREDENTIAL=sasToken
)

CREATE EXTERNAL FILE FORMAT parquetFileFormat WITH
(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
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
    LOCATION='/ActivityLog01.parquet',
    DATA_SOURCE=srcActivityLog,
    FILE_FORMAT=parquetFileFormat
)

SELECT * FROM ActivityLog;

