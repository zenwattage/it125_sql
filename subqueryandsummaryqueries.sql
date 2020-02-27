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
	COUNT(*),
    zipcodecity
FROM zipcode
JOIN customer
	USING(zipCode)
GROUP BY zipCodeCity
HAVING COUNT(*) >= 7;


