SELECT Start_Date, X
  FROM (
    SELECT 
        A.Start_Date, 
        MIN(B.End_Date) AS X
    FROM 
        (SELECT Start_Date 
         FROM Projects 
         WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
        ) AS A
    CROSS JOIN 
        (SELECT End_Date 
         FROM Projects 
         WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
        ) AS B
    WHERE A.Start_Date < B.End_Date
    GROUP BY A.Start_Date
 ) AS P
 ORDER BY DATEDIFF(DAY, Start_Date, X), Start_Date;
