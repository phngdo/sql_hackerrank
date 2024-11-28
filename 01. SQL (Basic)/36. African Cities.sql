SELECT city.NAME
  FROM CITY AS city
 INNER JOIN COUNTRY AS country
         ON city.COUNTRYCODE = country.CODE
 WHERE CONTINENT = 'Africa';
