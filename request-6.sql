use Labor_SQL;

SELECT SUBSTR(trip.place, 1, 1) as line, SUBSTR(trip.place, 2, 1) as place
FROM (
	SELECT * FROM Pass_in_trip
) as trip;

SELECT trip_no, date, ID_psg, SUBSTR(place, 1, 1) as line, SUBSTR(place, 2) as place
FROM Pass_in_trip;