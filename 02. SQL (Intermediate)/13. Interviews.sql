WITH CTE_View_Stats AS (
    SELECT challenge_id, 
           SUM(total_views) AS total_views, 
           SUM(total_unique_views) AS total_unique_views
      FROM View_Stats
     GROUP BY challenge_id
),
CTE_Submission_Stats AS (
    SELECT challenge_id, 
           SUM(total_submissions) AS total_submissions, 
           SUM(total_accepted_submissions) AS total_accepted_submissions
      FROM Submission_Stats
     GROUP BY challenge_id  
)
SELECT contest.contest_id, contest.hacker_id, contest.name, 
       SUM(total_submissions) AS total_submissions, 
       SUM(total_accepted_submissions) AS total_accepted_submissions,
       SUM(total_views) AS total_views,
       SUM(total_unique_views) AS total_unique_views
  FROM Contests AS contest
  LEFT JOIN Colleges AS college
         ON contest.contest_id = college.contest_id
  LEFT JOIN Challenges AS challenge
         ON college.college_id = challenge.college_id 
  LEFT JOIN CTE_View_Stats AS view_stat
         ON challenge.challenge_id = view_stat.challenge_id 
  LEFT JOIN CTE_Submission_Stats AS submission_stat
         ON challenge.challenge_id = submission_stat.challenge_id
 GROUP BY contest.contest_id, contest.hacker_id, contest.name
HAVING (SUM(total_submissions) + SUM(total_accepted_submissions) + SUM(total_unique_views) + SUM(total_unique_views)) > 0 
 ORDER BY contest.contest_id;
