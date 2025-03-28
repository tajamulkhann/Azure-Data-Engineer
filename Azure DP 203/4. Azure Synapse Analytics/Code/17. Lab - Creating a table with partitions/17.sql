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
WITH
(
    DISTRIBUTION= HASH(Operationname),
    PARTITION ( 
        Time RANGE RIGHT FOR VALUES
        ('2024-04-01','2024-05-01')
    ))

SELECT FORMAT(Time,'yyyy-MM-dd') AS 'Operation DateTime',COUNT(Operationname) AS 'Number of Operations'
FROM PoolActivityLog
GROUP BY FORMAT(Time,'yyyy-MM-dd')
ORDER BY 'Operation DateTime';
