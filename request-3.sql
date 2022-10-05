use Labor_SQL;

SELECT distinct trip.ID_comp, Company.name, trip.plane 
FROM trip
INNER JOIN Company
ON trip.ID_comp = Company.ID_comp AND trip.plane = 'Boeing';
