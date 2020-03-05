USE cathcakes;

SELECT 
	COUNT(*) ,
	SUM(productPrice) as Total,
	AVG(productPrice) as Average,
    MIN(productPrice) as Lowest,
    MAX(productPrice) as Highest
FROM product;

-- COUNT THE NUMBER OF CUSTOMERS IN EACH CITY
SELECT 
	COUNT(*),
    zipcodecity
FROM zipcode
JOIN customer
	USING(zipCode)
GROUP BY zipCodeCity
WITH ROLLUP;

-- HAVING MORE THAN 7 CUSTOMERS
SELECT 
	COUNT(*) AS `Cust count`,
    zipcodecity
FROM zipcode
JOIN customer
	USING(zipCode)
GROUP BY zipCodeCity
HAVING `Cust count` >= 7
ORDER BY `Cust count` DESC;

-- GET ALL CUSTOMERS FROM REDMOND WITH MORE THAN 5 ORDERS, GET MOST ORDERS
SELECT 
	COUNT(*) AS `Order total`,
    CONCAT(customerFirstName, ' ', customerLastName) AS `Customer`,
    customerId
FROM cakeorder
JOIN customer
	USING(customerId)
JOIN zipcode
	USING(ZipCode)
WHERE zipCodeCity = 'Redmond'
GROUP BY customerId
HAVING `order total` >= 5
ORDER BY `Order total` DESC;

select * from customer;
SELECT * FROM zipcode;
select * from cakeorder;
select * from productorder;




-- SELECT 
-- 	unit_price
-- FROM items
-- WHERE unit_price > 
-- 	(SELECT
--     AVG(unit_price) AS avgPrice
-- 	FROM items);

SELECT 
	AVG(ProductPrice)
FROM product;

SELECT
	ProductName,
	ProductPrice
FROM product
WHERE productPrice > 130.60;


SELECT
	ProductName,
	ProductPrice
FROM product
WHERE productPrice > 
	(SELECT 
	AVG(ProductPrice)
FROM product);







SELECT DISTINCT 
	CustomerLastName,
    CustomerFirstName,
    CustomerEmail
FROM Customer 
JOIN CakeOrder
    USING (CustomerId)
JOIN ProductOrder
	USING (CakeOrderId)
WHERE ProductId IN 
(    SELECT
	ProductId 
    FROM Ingredient 
    JOIN ProductIngredient 
    USING (IngredientId)
    JOIN Product       
    USING (ProductId) 
    WHERE IngredientName = 'Cinnamon' )
ORDER BY CustomerLastName, CustomerFirstName;