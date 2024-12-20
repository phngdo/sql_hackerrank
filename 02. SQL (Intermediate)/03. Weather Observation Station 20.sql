SELECT CAST(ROUND(S.LAT_N, 4) AS DECIMAL(10,4)) AS lat
  FROM STATION AS S
 WHERE (
        SELECT COUNT(LAT_N)
          FROM STATION
         WHERE LAT_N > S.LAT_N
       ) =
       (
        SELECT COUNT(LAT_N)
          FROM STATION
         WHERE LAT_N < S.LAT_N
       );
