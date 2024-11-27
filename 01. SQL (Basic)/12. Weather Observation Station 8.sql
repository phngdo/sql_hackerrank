SELECT DISTINCT CITY
  FROM STATION
 WHERE (
       CITY LIKE 'a%'
    OR CITY LIKE 'o%'
    OR CITY LIKE 'e%'
    OR CITY LIKE 'u%'
    OR CITY LIKE 'i%'
 ) AND (
       CITY LIKE '%a'
    OR CITY LIKE '%o'
    OR CITY LIKE '%e'
    OR CITY LIKE '%u'
    OR CITY LIKE '%i'
 );