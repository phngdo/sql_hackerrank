SELECT CASE
       WHEN Grades.Grade >= 8 THEN Students.Name
       ELSE 'NULL'
       END AS 'Student Name',
       Grades.Grade,
       Students.Marks
  FROM Students, Grades
 WHERE Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark
 ORDER BY Grades.Grade DESC,
          Students.Name;
