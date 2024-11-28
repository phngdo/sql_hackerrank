SELECT CAST(ROUND(
                  SQRT(
                        POWER(MIN(LAT_N) - MAX(LAT_N), 2) +
                        POWER(MIN(LONG_W) - MAX(LONG_W), 2)
                      )
                 , 4) 
            AS DECIMAL(10,4))
  FROM STATION;
