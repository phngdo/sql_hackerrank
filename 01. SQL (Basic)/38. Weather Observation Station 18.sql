SELECT CAST(
            ROUND(
                  ABS(MIN(LAT_N) - MAX(LAT_N)) +
                  ABS(min(LONG_W) - MAX(LONG_W))
              , 4) AS DECIMAL(10,4)
            )
  FROM STATION;
