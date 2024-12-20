SELECT CAST(ROUND(LONG_W, 4) AS DECIMAL(10,4)) AS lon
  FROM STATION
 WHERE LAT_N = (SELECT MIN(LAT_N)
                  FROM STATION
                 WHERE LAT_N > 38.7780
               );
