
/*
Write SQL to accomplish the following tasks using the World sample database provided with MySQL.
 Express the full problem request. Before each SQL command,
 provide a comment giving the question number and how many rows resulted from the query.
 Unless specifically directed to do so, never look up IDs and use them yourself; let SQL do the work.
 Databases are fluid; records are added and edited all the time.
 Do not to encode your assumptions about current data in a database!
 */
  
 /*
1. You’re interested in finding the countries in which languages are spoken by over 40% of the population.
 Find these and list the country, language, and percentage. The results should be sorted by country.
 Use table names only in the FROM clause and then only when you must.
 */
 SELECT
	Name AS Country,
    Language,
    Percentage
 FROM country
 JOIN countrylanguage ON country.code = countrylanguage.CountryCode
 WHERE Percentage > 40.0
 ORDER BY Name;
 -- 190 row(s) returned
 
 
-- 2. Same as previous, but use Implicit, rather than Explicit, syntax
SELECT
	Name,
    Language,
    Percentage
FROM country
	JOIN countrylanguage
WHERE country.code = countrylanguage.CountryCode AND Percentage > 40.0
ORDER BY Name;
-- 190 row(s) returned


/*
3. You speak French and want to know all the places you can visit where that language is spoken.
 Get a list of cities and associated countries where you’ll be comfortable.
 Results should have column headers “City” and “Country”, respectively.
 Sort these by Country and, within Country, City.
*/
SELECT
	city.Name AS city,
    country.Name AS country
FROM countryLanguage
	JOIN country ON countrylanguage.CountryCode = country.Code
	JOIN city 	 ON country.Code = city.CountryCode
WHERE Language = 'French'
ORDER BY country, city;
-- 472 row(s) returned

/*
4. Get a list of cities, languages spoken in that country in which that city exists, and populations.
 Requirements: (1) do not refer to the country table in this query, and (2) make use of the USING clause.
*/
SELECT
	Name,
    Language,
    Population
FROM city
	JOIN countrylanguage USING(CountryCode);
-- 30670 row(s) returned

-- 5. Same as previous, but instead of USING do a natural join.
SELECT
	Name,
    Language,
    Population
FROM city
	NATURAL JOIN countrylanguage;
-- 30670 row(s) returned


/*
6. Generate a list of ALL cities along with the languages associated with their countries.
 Cities should be listed regardless of whether there is an associated language.
 Do not refer to the country table in this query.
 Note that existing data may not fully test the result as there may be no unassociated records.
*/
SELECT
	Name AS city,
    Language
FROM city
	JOIN countrylanguage
	USING(CountryCode);
-- 30670 row(s) returned


/*
7. Same as previous, but this time list all LANGUAGES and their associated cities.
 Do not change the order in which tables appear in the FROM clause.
*/
SELECT
	Name,
    Language
FROM city
	RIGHT JOIN countrylanguage
	USING(CountryCode);
-- 30671 row(s) returned

/*
8. Get a list of country names (with column heading CountryName)
 along with whether they are considered Small, Medium, or Large.
 Small countries are those with a population under one million.
 Medium countries are those at or above one million but under three million.
 Large countries are those at or above three million.
 The resulting list should be sorted by country name in alphabetical order.
 Hint: you’ll need a union (see the textbook’s example) for this one.
*/

SELECT
	Name AS CountryName, Population, 'Small' AS Size
FROM country
WHERE Population < 1000000
UNION
SELECT
	Name AS CountryName, Population, 'Medium' AS Size
FROM country
WHERE Population BETWEEN 1000000 AND 3000000
UNION
SELECT
	Name AS CountryName, Population, 'Large' AS Size
FROM country
WHERE Population >= 3000000
ORDER BY CountryName;
-- 239 row(s) returned


-- These next questions use the Ex database, focusing on the Employees table:

/*
9. Employees at the company each have a Manager. The manager’s manager is their Executive.
 Use the self-join example in the slides, get a list of the employees, their Manager, and their Executive.
 Show all names in a single column in the form “John Doe”.
 Label columns “Employee”, “Manager”, and “Executive”, respectively.
 Sort by the employees last name, then, within that, first name.
*/

SELECT 	
    CONCAT(Emps.first_name, ' ', Emps.last_name) AS Employee,
    CONCAT(Mgrs.first_name, ' ', Mgrs.last_name) AS Manager,
    IFNULL(Mgrs.manager_id, 'exec') AS Executive
FROM Employees Emps
	LEFT JOIN Employees Mgrs
	ON Emps.manager_id = Mgrs.employee_id
ORDER BY Emps.last_name, Emps.first_name;
-- 9 row(s) returned

SELECT *
FROM departments
JOIN employees
ON departments.department_number = employees.department_number ;
select * from departments;
select * from employees;

/*
10. You’re running a new, small company. During the upcoming month, each employee
 is expected to briefly interview every other employee to get acquainted.
 Write a query that generates a complete list of interviewers and interviewees,
 with columns titled “Interviewer” and “Interviewee,” respectively.
 Make sure employees aren’t listed as meeting with themselves.
 Note that each pair will meet twice, however, with roles reversed.
 Sort by last name, then first name, of the interviewer.
*/

SELECT
	CONCAT(interviewers.first_name,' ', interviewers.last_name) AS interviewer,
    CONCAT(interviewees.first_name,' ', interviewees.last_name) AS interviewee
FROM employees interviewers
	CROSS JOIN employees interviewees
	WHERE interviewers.employee_id != interviewees.employee_id
ORDER BY interviewers.last_name, interviewers.first_name;
-- 72 row(s) returned

-- EXPLICIT CROSS JOIN VERSION
SELECT
	CONCAT(interviewers.first_name,' ', interviewers.last_name) AS interviewer,
    CONCAT(interviewees.first_name,' ', interviewees.last_name) AS interviewee
FROM employees interviewers
	CROSS JOIN employees interviewees
WHERE interviewers.employee_id != interviewees.employee_id;



-- For these questions use the Sakila database provided as a sample with MySQL:
-- 11. Get a list of the name (first and last), city, state, and zip of all USA customers.

SELECT
	first_name,
    last_name,  
    city,
    district AS state,
    postal_code AS zip,  
    country
FROM customer
JOIN address
 ON customer.customer_id = address.address_id
JOIN city
	ON address.city_id = city.city_id
JOIN country
	ON city.country_id = country.country_id
WHERE country = 'United States'
ORDER BY state;
-- 36 row(s)

/*
12. Actors with last name of Hoffman are some of your favorite actors.
 Get a list of all the films they’ve been in, along with the length of the film.
 The list shouldn’t contain any duplicates 
 (i.e., if more than one Hoffman is in a film, the film should only be listed once).
 */
SELECT
	film.title,
	actor.first_name,
    actor.last_name,
    film_id,
    actor.actor_id
FROM film
JOIN film_actor
	USING(film_id)
JOIN actor
	USING(actor_id)
WHERE actor.last_name = 'hoffman'
GROUP BY film_id;
-- 86 row(s) returned
 
-- 13. Get a list of the titles of all the English language comedies in the database.
SELECT
	film.title,
    language.name AS language,
    category.name AS genre
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
JOIN language
ON film.language_id = language.language_id
WHERE category.name = 'comedy' AND language.name = 'english';
-- 58 row(s) returned

/*
1.2 Design Tables, Fields, Properties (2.2 points)
You want to expand the World database to track country alliances.
 Your research indicates that, surprisingly, countries can participate in more than one alliance.
 Each alliance has a name and a year in which it was created.
 You also want to track the year in which each country joined an alliance.
Come up with design for table(s) necessary to support this change.
 For each field identify a name, a data type, size, and
 whether the field must be non-null (marked as “NN”).
 Identify primary and foreign keys (with “PK” or “FK”).
 Show your results as a multiline (aka block) SQL comment.
*/
/*
	CountryAlliance
	- AllianceID INT(11) FK NN
    - CountryCode CHAR(3) FK NN
    - JoinDate DATETIME NN
    
    AllianceDetails
    - AllianceID INT(11) PK NN
    - AllianceName CHAR(52) NN
    - AllianceCreationYear	DATE NN
    
*/

/*

-- PROJECT SCORE: 9.05 out of 10.00, or 90.45% * QUERIES (7.07 OUT OF 7.80):
 - General, style could use some work on a number of these queries, esp. 
 when it comes to ONLY major clauses being at left margin, others (and wrapped lines) needing indentation, etc.
 See our Style Guide, please, and ask if you need clarifications.
 - #3, no quotation marks in SQL, please; use apostrophes around text literals.
 - #6, the wording is strongly pointing you toward an OUTER join (note the word "ALL" in caps).
		Inner join may not capture everything requested, in these cases.
 - #8, puts 3,000,000 in BOTH Medium and Large categories.
 - #8, doesn't put the desired Small, Medium, Large text in a column; see the slides for a UNION example that does this.
 - #9, this is the same code we had in the example; it needed to be extended to the three-table scenario.
 - #10, I'd rather see an explicit CROSS JOIN here than an implicit one; it makes it super clear what's going on.
 - #12, didn't need GROUP BY; we haven't even studied that yet. DISTINCT was what we wanted.
 - #13, nice work on this query. 
 * DESIGN (1.98 OUT OF 2.20): - Alliance: for year created, YEAR, DATE, TIMESTAMP, DATETIME, etc.,
 probably won't work well; there are limitations to that data type that might not work for old alliances.
 No deduction.
 - Country/Alliance: for year joined, neither DATE, YEAR, TIMESTAMP, nor DATETIME will likely work because of range issues with very old alliances.
 No deduction. - Country/Alliance: what's the PK for this table? - Otherwise, good.
 * OVERALL: - Good work on this project.
 
 */
 
 
 -- testing for midterm
 
 desc employees;
 SELECT * FROM employees;
 
 INSERT INTO employees
 VALUES(10, 'Shitty', 'Mike', 3, 2);
 
 UPDATE employees
	SET employee_id = 11
WHERE employee_id = 10;

DELETE FROM employees
WHERE employee_id = 11;