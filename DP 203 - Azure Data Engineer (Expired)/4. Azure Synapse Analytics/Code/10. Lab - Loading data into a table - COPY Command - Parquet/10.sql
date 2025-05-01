DROP TABLE PoolActivityLog;

CREATE TABLE PoolActivityLog
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
   [Resource] varchar(2000)
)
WITH(
    DISTRIBUTION=ROUND_ROBIN
);

SELECT * FROM PoolActivityLog;

COPY INTO PoolActivityLog
FROM 'https://datalake50000.blob.core.windows.net/data/ActivityLog01.parquet'
WITH(
    FILE_TYPE='PARQUET',
    CREDENTIAL=
    (
        IDENTITY='Shared Access Signature',
        SECRET='sv=2022-11-02&ss=b&srt=sco&sp=rl&se=2024-06-13T11:24:49Z&st=2024-06-13T03:24:49Z&spr=https&sig=PL01eMQrJ1hUwlMFz%2FC9weQVD6WrTQPH9UuTOaQH4iE%3D'
    )
)