SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS Name
  FROM OCCUPATIONS
 ORDER BY Name;
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
  FROM OCCUPATIONS
 GROUP BY Occupation
 ORDER BY COUNT(Occupation), Occupation;
