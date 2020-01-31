/*
Write SQL to accomplish the following tasks using the World sample database provided with MySQL.
 Be aware that some of the commands you issue will intentionally or unintentionally change or destroy data.
 Make sure you know how to recreate the sample databases, so you can get back into a known state.
 Also, before you do attempt destructive operations,
 run a SELECT query first so you know exactly what you’re about to do
 (i.e., see what your WHERE clause filter will affect).
 */
 /*
 Attempt to these operations. When they fail,
 add a comment just after your query telling why SQL rejected the request.
 Don’t just regurgitate or paste the error message;
 say in your own words what’s going on and why it’s appropriate and expected that MySQL would reject the request.
 */

-- 1. Add a row to the City table with ID = 1, Name = Foo, CountryCode = ABW, District = Whee, and Population = 100000.

-- This insert fails because there is already a table row with ID#1 and because the ID field is the PK there cannot be a 
-- duplicate ID#1.


-- 2. Add a row to the ContryLanguage table with CountryCode = ZZZ, Language = Zebraese, IsOfficial = T, and Percentage = 34.2.

-- We cannot add a CountryCode to the CountryLanguage table - because CountryCode is a Foreign/Primary Key from a different table.
-- We would need to insert the CountryCode into the Country table prior to inserting the rest of the corresponding data.


-- 3. In the Country table, there’s a row with Code = ABW. Delete that row.

-- We cannot delete this row from Country because without the 'Code' PK we would leave orphans in the City table.


-- 4. In the Country table, there’s a row with Code = ABW. Change that row’s continent to Minionland.

-- The Continent column is an enumerated type and 'Minionland' isn't one of the allowed options so our update is rejected.



/*
5. Add a row to the City table, specifying no column names.
 Use these values, in this order: DEFAULT, ‘Whoville’, ‘ABW’, ‘DistrictX’, and NULL.
 */
 
-- The Population column of the table cannot be NULL so our insert is rejected.


 
 -- Write SQL to accomplish the following tasks:
/* 
6. You discovered the smallest incorporated city in Texas is Impact.
It has a population of 43. Add a row for this city. Use the form of the command that supplies a column list;
specify the fewest columns possible to fill in the specified data.
*/
INSERT INTO city
	(ID, Name, CountryCode, District, Population)
VALUES
	(DEFAULT, 'Impact', 'USA', 'Texas', 43);


-- 7. Write SQL to delete the row you created just above (be mindful of Safe Update Mode).
DELETE FROM city
WHERE ID = 4081;


/*
8. Now rewrite the SQL that adds Impact, TX, but write it without a column list.
In the same, single SQL statement add four more rows with sample data of your choosing.
Do not specify a specific value for the auto-incremented PK column; ask SQL to supply that.
*/
INSERT INTO city
	VALUES
		(DEFAULT, 'Impact', 'USA', 'Texas', 43),
        (DEFAULT, 'Concrete', 'USA', 'Washington', 200),
        (DEFAULT, 'Asphalt', 'USA', 'Oregon', 12000),
        (DEFAULT, 'Microsoft', 'USA', 'Washington', 10000),
        (DEFAULT, 'Boeing', 'USA', 'Washington', 777);


-- 9. Impact, Texas, had a new resident move into town. Write SQL that sets its population to 44.
UPDATE city
	SET Population = 44
WHERE Name = 'Impact';

/*
10. A baby was born in Impact, Texas.
Write SQL that increases its population by 1 without giving a specific new population 
(i.e., ask SQL to add one to what is already there).
*/

UPDATE city
	SET Population = Population + 1
WHERE Name = 'Impact';


/*
For each of the scenarios below, select an appropriate column data type and size. Choose the most
efficient (smallest) data type that suits the description (i.e., don’t waste space needlessly) and use
UNSIGNED wisely. For types where it makes sense (most types), follow the type with parentheses and the
appropriate number(s), e.g., DECIMAL(8,2).
For each answer, write a SQL comment with the question you’re answering and your response, e.g., #34,
VIN Number = YEAR(4) (but of course, with a correct answer!). Note: don’t list multiple options and expect
me to choose one to grade; YOU pick the best option and show it. If you want to discuss it, include that in
a comment as well.
*/

/*
11. VIN Number: each vehicle has a unique identifier associated with it. This is always 17 in length
and consists of number and letters.
*/
-- VIN Number: VARCHAR(17)


/*
12. MSRP: the manufacturer’s suggested price for the vehicle. At Vinnie’s this won’t be higher than
$99,999. There are no “cents” associated here; dollars only.
*/
--  MSRP:  INT(5) UNSIGNED


/*
13. Estimated MPG, City: the number of miles per gallon you may get when driving in the city. This is
a number with no more than two digits, e.g., 34 or 51.
*/
--



/*
14. Consumer Rating: the rating given to this vehicle by consumers. This is a small number with one
digit after the decimal place, e.g., 3.5 or 4.9. The maximum rating is 5.0, the minimum 0.0.
*/

-- 15. Sold: shows whether this vehicle has been sold.


-- 16. Make: the “brand” or car, e.g., Ford or Mitsubishi.


/*
17. Color: without getting specific to the manufacturer’s crazy colors (e.g., “Champagne Pearl”),
Vinnie’s lists one of these colors for each car: White, Silver, Black, Yellow, Red, Green, or Blue.
*/

/*
18. Options: cars come with one or more of these options: Stereo Upgrade, Roof Rack, Mud Guards,
Wheel Upgrade, Nav System.
*/

/*
19. Sales Ratio: gives the percent of sales this model car represents, e.g., 13.1 would indicate that
this model car represents 13.1% of all of Vinnie’s car sales. Vinnie cares about one digit after the
decimal place. This number is used for averages and gets recalculated periodically.
*/

-- 20. Purchase Date: records the date and time when Vinnie acquired the vehicle.