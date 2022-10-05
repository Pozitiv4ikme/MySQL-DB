use Labor_SQL;

SELECT model, speed, ram, cd, price 
FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price <= 600;