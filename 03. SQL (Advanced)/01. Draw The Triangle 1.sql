 WITH Numbers AS (
    SELECT 20 AS Num
     UNION ALL
    SELECT Num - 1
      FROM Numbers
     WHERE Num > 1
)
SELECT REPLICATE('* ', Num) AS Stars
  FROM Numbers
 ORDER BY Num DESC
OPTION (MAXRECURSION 0);
