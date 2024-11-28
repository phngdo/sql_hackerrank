SELECT CAST(ROUND(LONG_W, 4) AS DECIMAL(10,4)) AS lon
  FROM STATION
 WHERE LAT_N = (
                SELECT MAX(LAT_N) 
                  FROM STATION 
                 WHERE LAT_N < 137.2345
                );
