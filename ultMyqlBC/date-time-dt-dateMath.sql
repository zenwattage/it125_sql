DROP DATABASE IF EXISTS tester;
CREATE DATABASE tester;
USE tester;

-- FLOAT and DOUBLE
-- CREATE TABLE thingies (price FLOAT);

-- INSERT INTO thingies(price) VALUES (8866.55);
-- INSERT INTO thingies(price) VALUES (8866.55321);
-- INSERT INTO thingies(price) VALUES (8866322341.55321);

-- SELECT * FROM thingies;

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Padma', '1983-11-11', '10:06:23', '1983-11-11 10:06:23'),
		('Larry', '1934-12-25', '05:23:53', '1934-12-25 05:23:53')
	;

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES
( 'microwave', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

SELECT name, birthdate,
 DAY(birthdate),
 DAYNAME(birthdate),
 DAYOFWEEK(birthdate),
 DAYOFYEAR(birthdate)
 FROM people;
 
 SELECT DATE_FORMAT('2009-10-04 22:23:00', 'Was born on a %W');
 
 SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;
 
 SELECT DATEDIFF(NOW(), birthdate) FROM people;
 
 SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
 -- or DATE_SUB
 -- or use +/-
 SELECT birthdt, birthdt + INTERVAL 5 MONTH FROM people;
 
 -- TIMESTAMPS
 
 CREATE TABLE comments (
	content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments (content) VALUES ('I found this offensive!');
INSERT INTO comments (content) VALUES ('Guess I\'ll move on!');

SELECT * FROM comments ORDER BY created_at;

UPDATE comments SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments;
 
SELECT * FROM comments ORDER BY changed_at;


-- datatype CHALLENGES

-- why would we use CHAR
-- good for text we know that has a fixed length, ie State Abbreviations, company names, sex M/F,etc

CREATE TABLE inventory (
	item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);

-- current time
SELECT CURTIME();
-- current date
SELECT CURDATE();
-- select current day of the week
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

-- print current date and time -> mm/dd/yyyy
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y'); -- can use CURDATE instead of NOW()
-- date with 2nd,1st,3rd,etc
SELECT DATE_FORMAT(NOW(), '%M, %D %h:%i');

CREATE TABLE tweets (
	content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, username) VALUES
	('This is my first tweet!', 'Scotty')
    ;
    
    SELECT * FROM tweets;

