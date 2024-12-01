SELECT student.Name
  FROM Students AS student
 INNER JOIN Friends AS friend
         ON student.ID = friend.ID
 INNER JOIN Packages AS P1
         ON student.ID = P1.ID
 INNER JOIN Packages AS P2
         ON friend.Friend_ID = P2.ID
 WHERE P1.Salary < P2.Salary
 ORDER BY P2.Salary;
