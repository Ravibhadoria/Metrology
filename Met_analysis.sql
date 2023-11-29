Create Database Covid19_records;

use Covid19_records;

CREATE table STATION (ID INT primary key, CITY  VARCHAR (20), State Char (2), LAT_N INT, LAT_W INT);

      insert into station values (13, 'PHOENIX', 'AZ', 33, 112);
      insert into station values (44, 'DENVER', 'CO', 40, 105);
      insert into station values (66, 'CARIBOU', 'ME', 47, 68);

      SELECT * from STATION;

      SELECT * from STATION where LAT_N > 39.7;

      CREATE TABLE STATS 
      (
      ID INT,
      MONTH INT CHECK (MONTH BETWEEN 1 AND 12),
      TEMP_F FLOAT CHECK (TEMP_F BETWEEN -80 AND 150),
      RAIN_I FLOAT CHECK (RAIN_I BETWEEN 0 AND 100),
      CONSTRAINT PK_STATS PRIMARY KEY (ID, MONTH)
      ); 

       insert into STATS values (13,1,57.4,.31);
       insert into STATS values (13,7,91.7,5.15);
       insert into STATS values (44,1,27.3,.18);
       insert into STATS values (44,7,74.8,2.11);
       insert into STATS values (66,1,6.7,2.1);
       insert into STATS values (66,7,65.8,4.52);

       SELECT CITY, TEMP_F from STATS
       inner join station on Station.ID=Stats.id;

       SELECT c.CITY, c.LAT_N, s.TEMP_F from STATS s
       JOIN STATION c ON c.ID = s.ID
       WHERE Month = 7
       ORDER BY TEMP_F ASC;

       SELECT c.CITY, MAX(s.TEMP_F) AS Max_Temperature, 
       MIN(s.TEMP_F) AS Min_Temperature, AVG(s.RAIN_I) AS Avg_Rainfall
       FROM STATS s 
       JOIN STATION c ON s.ID = c.ID
       GROUP BY c.CITY;

       SELECT c.CITY,
       (s.TEMP_F - 32) * 5/9 AS Temperature_Celsius,
       s.RAIN_I * 2.54 AS Rainfall_Centimeters
       FROM STATS s
       JOIN STATION c ON s.ID = c.ID;

       UPDATE STATS
       SET TEMP_F = 74.9
       WHERE ID IN (SELECT ID FROM STATION WHERE CITY = 'Denver')
       AND MONTH = 7;