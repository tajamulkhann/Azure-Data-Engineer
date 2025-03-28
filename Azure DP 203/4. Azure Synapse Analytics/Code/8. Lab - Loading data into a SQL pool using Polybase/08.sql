
CREATE TABLE PoolActivityLog
WITH(
    DISTRIBUTION=ROUND_ROBIN
)
AS 
SELECT * FROM ActivityLog;

SELECT * FROM PoolActivityLog;
