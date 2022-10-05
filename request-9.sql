use Labor_SQL;

SELECT trip.trip_no, company.name, trip.plane, trip.town_from, trip.town_to, TIME_FORMAT(time_out, "%H:%i:%S") as time_out, TIME_FORMAT(time_in, "%H:%i:%S") as time_in
FROM Company as company
JOIN Trip as trip
ON company.ID_comp = trip.ID_comp;

SELECT trip.trip_no, company.name, trip.plane, trip.town_from, trip.town_to,
CASE
	WHEN TIMEDIFF(time_out, time_in) < 0 THEN TIMEDIFF(time_in, time_out)
    WHEN TIMEDIFF(time_out, time_in) > 0 THEN TIMEDIFF(ADDTIME(time_in, "24:0:0"), time_out)
END as trip_time
FROM Company as company
JOIN Trip as trip
ON company.ID_comp = trip.ID_comp;