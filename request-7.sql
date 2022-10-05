use Labor_SQL;


SELECT * 
FROM TRIP
WHERE town_to = 'Moscow';


SELECT * 
FROM Trip as trip
JOIN Pass_in_trip as trip_with_pass
ON trip.trip_no = trip_with_pass.trip_no;

-- get all trip to Moscow
SELECT DISTINCT trip.trip_no, DATE_FORMAT(date, "%Y-%m-%d") as date
FROM Pass_in_trip as trip_with_pass
JOIN Trip as trip
ON trip_with_pass.trip_no = trip.trip_no AND town_to = 'Moscow';

-- get amount of passanger for every trip to Moscow
SELECT DATE_FORMAT(date, "%Y-%m-%d") as date, COUNT(*) as amout_of_passanger
FROM Pass_in_trip as trip_with_pass
JOIN Trip as trip
ON trip_with_pass.trip_no = trip.trip_no AND town_to = 'Moscow'
GROUP BY date;

-- desired result when I change one row in table Pass_in_trip
SELECT DATE_FORMAT(date, "%Y-%m-%d") as date, COUNT(*) as amount_of_trip 
FROM( 
	SELECT DISTINCT trip.trip_no, DATE_FORMAT(date, "%Y-%m-%d") as date
	FROM Pass_in_trip as trip_with_pass
	JOIN Trip as trip
	ON trip_with_pass.trip_no = trip.trip_no AND town_to = 'Moscow'
) as result
GROUP BY result.date;

