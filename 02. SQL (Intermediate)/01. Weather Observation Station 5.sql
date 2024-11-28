SELECT TOP 1
       MIN(CITY) AS min_name_city,
       LEN(CITY) AS length_name
  FROM STATION
 GROUP BY CITY
 ORDER BY length_name;
SELECT TOP 1
       MAX(CITY) AS max_name_city,
       LEN(CITY) AS length_name
  FROM STATION
 GROUP BY CITY
 ORDER BY length_name DESC;
