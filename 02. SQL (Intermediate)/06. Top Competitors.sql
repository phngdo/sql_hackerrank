SELECT hacker.hacker_id, hacker.name
  FROM Hackers AS hacker
 INNER JOIN Submissions AS submission
         ON hacker.hacker_id = submission.hacker_id
 INNER JOIN Challenges AS challenge
         ON submission.challenge_id = challenge.challenge_id
 INNER JOIN Difficulty AS difficulty
         ON challenge.difficulty_level = difficulty.difficulty_level
 WHERE submission.score = difficulty.score
   AND difficulty.difficulty_level = challenge.difficulty_level
 GROUP BY hacker.hacker_id, hacker.name
 HAVING COUNT(submission.hacker_id) > 1
 ORDER BY COUNT(hacker.hacker_id) DESC,
          hacker.hacker_id ASC;
  
