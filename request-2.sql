use Labor_SQL;

SELECT * 
FROM Trip
WHERE TIME_FORMAT(time_in, '%H:%i:%s') BETWEEN '17:00:00' AND '23:00:00';