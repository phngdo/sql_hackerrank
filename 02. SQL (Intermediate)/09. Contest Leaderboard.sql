WITH CTE_Get_Max_Score AS (
    SELECT hacker_id,
           MAX(score) AS Max_Score
      FROM Submissions
     GROUP BY hacker_id, challenge_id
)
SELECT CTE.hacker_id,
       (
        SELECT h.name
          FROM Hackers AS h
         WHERE h.hacker_id = CTE.hacker_id
       ) AS Name,
       SUM(CTE.Max_Score) AS Total_Score
  FROM CTE_Get_Max_Score AS CTE
 GROUP BY CTE.hacker_id
 HAVING SUM(CTE.Max_Score) > 0
 ORDER BY Total_Score DESC, CTE.hacker_id;
