WITH RankedHackers AS (
    SELECT submission_date,
           hacker_id,
           COUNT(submission_id) AS count_submission,
           ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY COUNT(submission_id) DESC, hacker_id
        ) AS RowRank
    FROM Submissions
    GROUP BY submission_date, hacker_id
),
TMPHackers AS (
    SELECT RH.submission_date, RH.hacker_id
      FROM RankedHackers AS RH
     WHERE RH.RowRank = 1
)
SELECT S1.submission_date,
       (SELECT COUNT(DISTINCT S2.hacker_id)
          FROM Submissions AS S2
         WHERE S2.submission_date = S1.submission_date 
           AND
        (SELECT COUNT(DISTINCT S3.submission_date)
           FROM Submissions AS S3
          WHERE S3.hacker_id = S2.hacker_id 
            AND S3.submission_date < S1.submission_date) = DATEDIFF(DAY, '2016-03-01', S1.submission_date)) AS HackerCount,
       T.HACKER_ID,
       H.NAME
  FROM (SELECT DISTINCT submission_date FROM Submissions) AS S1
  LEFT JOIN TMPHackers AS T ON S1.submission_date = T.submission_date
  LEFT JOIN Hackers AS H ON T.hacker_id = H.hacker_id
 GROUP BY S1.submission_date, T.hacker_id, H.name;
