SELECT CEILING(ABS(
                    AVG(CAST(Salary AS DECIMAL(6,2))) - 
                    AVG(CAST(REPLACE(CAST(Salary AS VARCHAR), '0', '') AS DECIMAL(6,2))))
              )
  FROM EMPLOYEES;
