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
	INSERT INTO city
    VALUES(1, 'Foo', 'ABW', 'Whee', 100000);
-- This insert fails because there is already a table row with ID#1 and because the ID field is the PK there cannot be a 
-- duplicate ID#1.


-- 2. Add a row to the ContryLanguage table with CountryCode = ZZZ, Language = Zebraese, IsOfficial = T, and Percentage = 34.2.
	INSERT INTO countrylanguage
    VALUES('ZZZ', 'Zebraese', 'T', 34.2);
-- We cannot add a CountryCode to the CountryLanguage table - because CountryCode is a Foreign/Primary Key from a different table.
-- We would need to insert the CountryCode into the Country table prior to inserting the rest of the corresponding data.


-- 3. In the Country table, there’s a row with Code = ABW. Delete that row.
	DELETE
    FROM country
	WHERE Code = 'ABW';    
-- We cannot delete this row from Country because without the 'Code' PK we would leave orphans in the City table.


-- 4. In the Country table, there’s a row with Code = ABW. Change that row’s continent to Minionland.
UPDATE country
	SET Continent = 'Minionland'
WHERE Code = 'ABW';
-- The Continent column is an enumerated type and 'Minionland' isn't one of the allowed options so our update is rejected.



/*
5. Add a row to the City table, specifying no column names.
 Use these values, in this order: DEFAULT, ‘Whoville’, ‘ABW’, ‘DistrictX’, and NULL.
 */
 INSERT INTO city
 VALUES(DEFAULT, 'Whoville', 'ABW', 'DistrictX', NULL);
-- The Population column of the table cannot be NULL so our insert is rejected.


 
 -- Write SQL to accomplish the following tasks:
/* 
6. You discovered the smallest incorporated city in Texas is Impact.
It has a population of 43. Add a row for this city. Use the form of the command that supplies a column list;
specify the fewest columns possible to fill in the specified data.
*/
INSERT INTO city
	(Name, CountryCode, District, Population)
VALUES
	('Impact', 'USA', 'Texas', 43);


-- 7. Write SQL to delete the row you created just above (be mindful of Safe Update Mode).
DELETE FROM city
WHERE ID = 4087;


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
--  MSRP:  SMALLINT UNSIGNED


/*
13. Estimated MPG, City: the number of miles per gallon you may get when driving in the city. This is
a number with no more than two digits, e.g., 34 or 51.
*/
-- MPG: TINYINT UNSIGNED



/*
14. Consumer Rating: the rating given to this vehicle by consumers. This is a small number with one
digit after the decimal place, e.g., 3.5 or 4.9. The maximum rating is 5.0, the minimum 0.0.
*/

-- Rating: DECIMAL(2,1) UNSIGNED DEFAULT(0.0)

-- 15. Sold: shows whether this vehicle has been sold.

-- Sold: ENUM('Sold','Owned')

-- 16. Make: the “brand” or car, e.g., Ford or Mitsubishi.
-- Make:  VARCHAR(45)

/*
17. Color: without getting specific to the manufacturer’s crazy colors (e.g., “Champagne Pearl”),
Vinnie’s lists one of these colors for each car: White, Silver, Black, Yellow, Red, Green, or Blue.
*/
-- Color:  ENUM('White','Silver','Black','Yellow','Red','Green','Blue')

/*
18. Options: cars come with one or more of these options: Stereo Upgrade, Roof Rack, Mud Guards,
Wheel Upgrade, Nav System.
*/
-- Options: SET('Stereo Upgrade', 'Roof Rack', 'Mud Guards', 'Wheel Upgrade', 'Nav System')

/*
19. Sales Ratio: gives the percent of sales this model car represents, e.g., 13.1 would indicate that
this model car represents 13.1% of all of Vinnie’s car sales. Vinnie cares about one digit after the
decimal place. This number is used for averages and gets recalculated periodically.
*/
-- Sales Ratio: DECIMAL(3,1) 


-- 20. Purchase Date: records the date and time when Vinnie acquired the vehicle.
-- Purchase Date: DATETIME


/*


Questions #1-5 need to show the SQL that goes with them; that's part of the exercise.  Please add that and resubmit, then I'll take another look.  50% for now, since it appears most of the other work is here.
William Barry , Feb 9 at 7:09am
PROJECT SCORE: 8.43 out of 10.00, or 84.25%

*  TRY THESE (1.25 OUT OF 2.50):  
    -  Missing SQL for each; 50% credit for this part until I see a new submission to grade.

*  DO THESE (2.45 OUT OF 2.50):  
    -  #6, doesn't quite get to "fewest fields possible" here.  You didn't need to include the Id column.
    -  Otherwise, good.

*  DATA TYPES (4.73 OUT OF 5.00):  
    -  #11, CHAR would be better here; these are all the same length, so CHAR would be a bit more efficient.
    -  #12, INT is wasteful/inefficient here; you don't need 2 billion dollars.  DECIMAL or even SMALLINT UNSIGNED would be fine.  And parens don't keep it from being wasteful; those are for display only, remember.
    -  #13, INT is really inefficient here; even a TINYINT is enough!  There are lots of data types to choose from; look carefully at their ranges.
    -  #14, too small; needs TWO digits, one of them being after the decimal, so needs (2,1) here.
    -  #16, the problem doesn't say we have a complete list of all present and future makes of cars.  ENUM forces editing of SCHEMA if something new comes on the scene.  Either make this a VARCHAR (has its own issues), or a separate table, if you really want to list them.  No deduction.
    -  #17, can't set a SET when it can only be ONE of these at a time; need ENUM.
    -  #19, too small; needs to be at least (3,1), perhaps even (4,1).
    -  Otherwise, good.

*  OVERALL:  
    -  Questions #1-5 need to show the SQL that goes with them; that's part of the exercise. Please add that and resubmit, then I'll take another look.
William Barry , Feb 9 at 1:45pm
Thanks for the reminder! I'm not sure why I removed the #1-5 statements after I tested them
SCOTT HANSFORD , Feb 9 at 3:22pm
PROJECT SCORE: 9.68 out of 10.00, or 96.75%

*  TRY THESE (2.50 OUT OF 2.50):  
    -  Great work on questions in this section.

*  OVERALL:  
    -  Great work on this project. */