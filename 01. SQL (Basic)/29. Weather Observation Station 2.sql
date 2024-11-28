SELECT CAST(ROUND(SUM(LAT_N), 2) AS DECIMAL(10,2)) AS lat,
       CAST(ROUND(SUM(LONG_W), 2) AS DECIMAL(10,2)) AS lon
  FROM STATION;
