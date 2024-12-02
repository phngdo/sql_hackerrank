SELECT F1.X, F1.Y
  FROM Functions AS F1
 WHERE EXISTS(
              SELECT F2.X, F2.Y
                FROM Functions AS F2
               WHERE F2.X = F1.Y
                 AND F2.Y = F1.X
                 AND F2.X > F1.X
             )
   AND (F1.X != F1.Y)
 UNION
SELECT F1.X, F1.Y
  FROM Functions AS F1
 WHERE (F1.X = F1.Y)
   AND (
        (
         SELECT COUNT(*)
           FROM Functions AS F2
          WHERE F2.X = F1.X
            AND F2.Y = F1.X
        ) > 1
       )
 ORDER BY F1.X;
