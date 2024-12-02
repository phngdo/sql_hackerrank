DECLARE @N INT = 1000;

WITH Numbers AS (
    SELECT 2 AS Num
     UNION ALL
    SELECT Num + 1
      FROM Numbers
     WHERE Num < @N
),
Primes AS (
    SELECT Num
      FROM Numbers AS A
     WHERE NOT EXISTS (
                        SELECT 1
                          FROM Numbers AS B
                         WHERE B.Num > 1 
                           AND B.Num < A.Num 
                           AND A.Num % B.Num = 0
    )
)
SELECT STRING_AGG(Num, '&') AS Prime_Numbers
  FROM Primes
OPTION (MAXRECURSION 0);
