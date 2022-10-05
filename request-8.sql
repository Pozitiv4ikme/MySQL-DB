use Labor_SQL;

-- all pc
SELECT unique_pc.maker, unique_pc.model, pc_info.price FROM Product as unique_pc
JOIN PC as pc_info
ON unique_pc.model = pc_info.model;


-- all pc maker (group by maker) with min price
SELECT maker, MIN(price) min_price
FROM (
	SELECT unique_pc.maker, unique_pc.model, pc_info.price 
	FROM Product as unique_pc
	JOIN PC as pc_info
	ON unique_pc.model = pc_info.model
) as result
GROUP BY maker;

-- min price A
SELECT maker, MIN(price) as min_price 
FROM (
	SELECT pc_A.maker, pc_A.model, pc_A_info.price
	FROM Product as pc_A
	JOIN PC as pc_A_info
	ON pc_A.model = pc_A_info.model AND maker = 'A'
) as result_A;


-- min price B
SELECT maker, MIN(price) as min_price 
FROM (
	SELECT pc_B.maker, pc_B.model, pc_B_info.price
	FROM Product as pc_B
	JOIN PC as pc_B_info
	ON pc_B.model = pc_B_info.model AND maker = 'B'
) as result_B;


-- min price E
SELECT maker, MIN(price) as min_price 
FROM (
	SELECT pc_E.maker, pc_E.model, pc_E_info.price
	FROM Product as pc_E
	JOIN PC as pc_E_info
	ON pc_E.model = pc_E_info.model AND maker = 'E'
) as result_E;


