-- Lab - CASE Statement
-- Evaluates a list of conditions and returns one of multiple possible result expressions.


SELECT distinct[Event category] FROM [dbo].[logdata]

SELECT 
EventTier = CASE [Event category]
WHEN 'Administrative' THEN 'Tier 1'
WHEN 'Resource Health' THEN 'Tier 2'
WHEN 'Service Health' THEN 'Tier 3'
WHEN 'Policy' THEN 'Tier 4'
WHEN 'Recommendation' THEN 'Tier 5'
END,
COUNT([Operation name]) AS 'Count of operations'
FROM [logdata]
GROUP BY [Event category]