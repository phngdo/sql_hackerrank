SELECT SUM(city.POPULATION) AS sum_population
  FROM CITY AS city
 INNER JOIN COUNTRY AS country
         ON city.COUNTRYCODE = country.CODE
 WHERE CONTINENT = 'Asia';
