use Labor_SQL;

SELECT DISTINCT maker, type 
FROM Product as laptop
WHERE EXISTS 
(	SELECT DISTINCT maker, type as printer_type 
	FROM Product as printer
	WHERE laptop.maker = printer.maker AND laptop.type = 'Laptop' AND printer.type = 'Printer');
    