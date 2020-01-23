-- get customer last, first name and orders , id order date, type
SELECT
	customer.CustomerId,
	CONCAT(CustomerLastName, ' ', CustomerFirstName ) AS name,
    CakeOrderDateOrdered AS order_date,
    CakeOrderType AS type
FROM customer
JOIN cakeorder ON customer.CustomerId = cakeorder.CustomerId
ORDER BY name, order_date DESC;

-- using => USING 
-- when the tables have a common field name
SELECT
	customer.CustomerId,
	CONCAT(CustomerLastName, ' ', CustomerFirstName ) AS name,
    CakeOrderDateOrdered AS order_date,
    CakeOrderType AS type
FROM customer
JOIN cakeorder USING(customerId)
ORDER BY name, order_date DESC;


-- GET A LIST OF CUSTOMERS WHO LIVE IN BELLEVUE,WASHINGTON
-- INCLUDE CUST NAME PHONE NUMBER, AND CITY, STATE, AND ZIP
-- SORT BY ZIPCODE, THEN LASTNAME, THEN FIRST NAME

SELECT
	CONCAT(customer.CustomerFirstName,' ', customer.CustomerLastName) AS name,
    CustomerPhone,
    ZipCodeCity,
    ZipCodeState,
    ZipCode
FROM customer
JOIN zipcode
USING (ZipCode)
WHERE ZipCodeCity = 'Bellevue' AND ZipCodeState = 'WA'
ORDER BY ZipCode, name;

-- GET ALL CUST WHO NEVER ORDEREED
-- get names and phone 
-- sort by last name, then first name

SELECT
	CustomerFirstName,
    CustomerLastName,
    CustomerPhone
FROM customer
LEFT JOIN cakeorder
USING(CustomerId)
WHERE CakeOrderId IS NULL
ORDER BY CustomerLastName, CustomerFirstName;

-- get litst of products & ingredients
-- and allergen
-- sort by ingredient , thenproduct name

SELECT
	productName,
    IngredientName,
    IngredientIsAllergen
FROM product
JOIN productingredient USING(productId)
JOIN ingredient USING(ingredientId)
ORDER BY IngredientName, productName;
