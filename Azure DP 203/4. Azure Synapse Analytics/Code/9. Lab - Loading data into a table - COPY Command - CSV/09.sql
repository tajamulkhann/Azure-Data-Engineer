DROP TABLE PoolActivityLog;

-- Other way : COPY INTO

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
)

COPY INTO PoolActivityLog
FROM 'https://datalaketiku.blob.core.windows.net/bigdata/ActivityLog-01.csv'
WITH (
    FILE_TYPE = 'CSV',
    FIRSTROW = 2,
    CREDENTIAL = (
        IDENTITY = 'Shared Access Signature',
        SECRET = 'sv=2024-11-04&ss=bfqt&srt=o&sp=rwdlacupy&se=2025-03-30T05:08:36Z&st=2025----------'
    )
);

SELECT * FROM PoolActivityLog
