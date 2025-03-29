-- Loading Data From External Table into Synapse SQL Pool using POLYBASE

CREATE TABLE PoolActivityLog
WITH(
    DISTRIBUTION=ROUND_ROBIN
)
AS 
SELECT * FROM ActivityLog1;

SELECT * FROM PoolActivityLog;
