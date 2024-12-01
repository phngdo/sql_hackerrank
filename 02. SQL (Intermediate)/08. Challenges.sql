SELECT hacker.hacker_id, hacker.name,
       COUNT(challenge.challenge_id) AS count_challenge
  FROM Hackers AS hacker
 INNER JOIN Challenges AS challenge
         ON hacker.hacker_id = challenge.hacker_id
 GROUP BY hacker.hacker_id, hacker.name
 HAVING COUNT(challenge.challenge_id) = (SELECT TOP(1) COUNT(challenge_id) AS max_challenge
                                           FROM Challenges
                                          GROUP BY hacker_id
                                          ORDER BY max_challenge DESC
                                        )
     OR COUNT(challenge.challenge_id) IN(
        SELECT DISTINCT compare_challenge
          FROM (SELECT h.hacker_id, h.name,
                       COUNT(c.challenge_id) AS compare_challenge
                  FROM Hackers AS h
                 INNER JOIN Challenges AS c
                         ON h.hacker_id = c.hacker_id
                 GROUP BY h.hacker_id, h.name
               ) Counts
         GROUP BY compare_challenge
         HAVING COUNT(compare_challenge) = 1
     )
 ORDER BY count_challenge DESC,
          hacker.hacker_id;
