use Labor_SQL;


SELECT all_products.type, result.model, result.price
FROM (
	SELECT model, price FROM PC
	UNION
	SELECT model, price FROM Laptop
	UNION 
	SELECT model, price FROM Printer
) as result
JOIN Product as all_products
ON result.model = all_products.model;

SELECT type, model, MIN(price) 
FROM (
	SELECT all_products.type, result.model, result.price
	FROM (
		SELECT model, price FROM PC
		UNION
		SELECT model, price FROM Laptop
		UNION 
		SELECT model, price FROM Printer
	) as result
	JOIN Product as all_products
	ON result.model = all_products.model
) as result
GROUP BY model;