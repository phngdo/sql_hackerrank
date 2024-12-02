WITH Numbers AS (
    SELECT 1 AS Num
     UNION ALL
    SELECT Num + 1
      FROM Numbers
     WHERE Num < 20
)
SELECT REPLICATE('* ', Num) AS Stars
  FROM Numbers
 ORDER BY Num
OPTION (MAXRECURSION 0);
