use Labor_SQL;

SELECT Product.maker, Product.model, Product.type
FROM Product
INNER JOIN PC
ON Product.model = PC.model;


SELECT COUNT(Product.maker) as amount_of_A_PC FROM Product
WHERE maker = 'A' and type = 'PC';

SELECT COUNT(product_table.maker) as amount_of_A_PC FROM 
(	SELECT pc_product.maker, pc_product.model, pc_product.type
	FROM Product as pc_product
    INNER JOIN PC as pc_table
    ON pc_product.model = pc_table.model) as product_table
WHERE maker = 'A' and type = 'PC';
    