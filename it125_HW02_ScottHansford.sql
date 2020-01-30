/*
Write SQL to accomplish the following tasks using the World sample database provided with MySQL.
 Before each SQL command, provide a comment giving the question number and how many result rows are returned from the query.
 Don’t use regular expressions; use SQL’s wildcards instead.
 */
 
-- 1. Show a list of cities (by name), along with their districts and populations.
SELECT
	name,
    district,
    population
FROM city
ORDER BY name;
-- 4079 row(s) returned


-- 2. Show a list of countries (by name), along with their areas and continents. 
-- The resulting report should name the columns “Country”, “Area”, and “Continent”, respectively.
SELECT
	name AS 'Country',
	surfacearea AS 'Area',
    continent AS 'Continent'
FROM country
ORDER BY name;
-- 239 row(s) returned


-- 3. Show a list of countries and expected populations (assuming an 11% population growth).
 -- Expected population should have a friendly name. Show no decimal places in the expected populations.
SELECT
	name,
    ROUND(population * (1 + .11),0) AS '11% increase assumption'
FROM country;
-- 239 row(s) returned


-- 4. Show a list of countries and their populations, but only show countries having populations of at least fifteen million people.
SELECT
	name,
    population
FROM country
WHERE population >= 15000000;
-- 60 row(s) returned


-- 5. Show a list of all the languages spoken in various countries, with no duplicates (e.g., English appears only once).
SELECT DISTINCT
	language
FROM countrylanguage;
-- 457 row(s) returned


-- 6. You’re curious about countries with GNPs of more than 200,000.
 -- Get a list of countries that have current or old GNPs in that range.
SELECT
	GNP,
    GNPOld
FROM country
WHERE GNP > 200000 AND GNPOld > 200000;
-- 22 row(s) returned


-- 7. Get a list of all the official languages that are spoken by more than 90% of the country’s population.
SELECT
	language,
    isOfficial,
    Percentage
FROM countrylanguage
WHERE isOfficial = 'T' AND Percentage > 90.0;
-- 59 row(s) returned


-- 8. Your neighbor is doing a report on forms of government and is interested in both republics and constitutional monarchies.
 -- Produce one results list that shows the countries, along with their forms of government, that fall into those categories.
 -- Do not use logical operators (AND or OR) in this query, but instead provide a list of the forms of government you’re interested in.
SELECT
	name,
    governmentform
FROM country
WHERE GovernmentForm IN ('republic', 'constitutional monarchy')
ORDER BY GovernmentForm;
-- 151 row(s) returned


-- 9. Show the name and independence year for all countries that achieved their independence in the years 1900 through 1950 (inclusive).
 -- Do not use logical operators (AND or OR) in this query, but instead use BETWEEN and a range.
SELECT
	name,
    IndepYear
FROM country
WHERE IndepYear BETWEEN 1900 AND 1950;
-- 39 row(s) returned


-- 10. Get a list of all the languages that start with the letters “Ne”. Show no duplicates.
SELECT DISTINCT
	Language
FROM countrylanguage
WHERE Language LIKE'Ne%';
-- 2 row(s) returned


-- 11. Show the name and region of all countries for which there is no life expectancy data.
SELECT
	name,
    region,
    LifeExpectancy
FROM country
WHERE LifeExpectancy IS NULL;
-- 17 row(s) returned


-- 12. Get a list of all the spoken languages of the world that start with the letter “Y”.
 -- Show them in alphabetical order with no duplicates.
SELECT DISTINCT
	language
FROM countrylanguage
WHERE Language LIKE 'Y%'
ORDER BY language;
-- 5 row(s) returned


-- 13. Show a list of all the countries whose populations have a life expectancy at or over 80 years of age.
 -- The highest life expectancy should be shown first, the lowest one last.
SELECT
	name,
    LifeExpectancy
FROM country
WHERE LifeExpectancy >= 80
ORDER BY LifeExpectancy DESC;
-- 5 row(s) returned


-- 14. Get a list of cities where the name of the city matches the name of the district in which it is located.
 -- But only show cities with populations under 40,000. The city with the highest population should be first in the list.
SELECT
	Name,
    District,
    Population
FROM city
WHERE Name = District AND population < 40000
ORDER BY Population DESC;
-- 15 row(s) returned


-- 15. Get a list of the “tiny” Caribbean countries along with their surface areas and populations.
--  Your definition of “tiny” means countries with either (1) populations under 100000, (2) surface areas under 500, or countries with both.
SELECT
	name,
    population,
    surfacearea
FROM country
WHERE (population < 100000 OR SurfaceArea < 500)
OR (population < 100000 AND surfacearea < 500);
-- 54 row(s) returned



/*You want to expand the World database to track city postal codes.
 Each city has one or more postal codes.
 These codes can be up to six characters long, a combination of digits and alphabetic characters.
 These codes are not unique in the world, i.e., the same code might appear in a different country—but
 certainly they are unique for that city.
 For each postal code, we also want to maintain the number of households that exist within that postal code,
 and a way to know whether that postal code is active (i.e., sometimes we find they have “decommissioned” that postal code, 
 but still want to track it for historical reasons).
 Come up with a table design for a new table called postalcodes.
 For each field identify a name, a data type, size, and whether the field must be non-null (marked as “NN”). 
 Identify primary and foreign keys (if any), e.g., with “PK” or “FK”. Show your results as a multiline (aka “block”) SQL comment.
 */
 
 
/*
	
    postalCode VARCHAR(6) PRIMARY KEY NOT NULL,
    cityId INT(11) FOREIGN KEY NOT NULL,
    CountryCode CHAR(3) FOREIGN KEY NOT NULL,
    householdCount INT(11),
    status ENUM('decomissioned','active') DEFAULT 'decomissioned'
   
    
*/
