DROP DATABASE IF EXISTS cats;
DROP TABLE cats;
CREATE DATABASE cats;

USE cats; 

CREATE TABLE cats
(
cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
breed VARCHAR(100),
age INT
);

INSERT INTO cats(name, breed, age)
VALUES	('Ringo', 'Tabby', 4),
		('Cindy', 'Maine Coon', 10),
		('Dumbledore', 'Maine Coon', 11),
        ('Egg', 'Persian', 4),
		('Misty', 'Tabby', 13),
        ('George Michael', 'Ragdoll', 9),
        ('Jackson', 'Sphynx', 7);
        
SELECT name,age FROM cats WHERE age < 9;-- 

SELECT cat_id FROM cats;--

SELECT name,breed FROM cats;-- 

SELECT name,age FROM cats WHERE breed = 'tabby';--

SELECT cat_id,age FROM cats WHERE cat_id = age;-- 

SELECT cat_id AS id, name FROM cats;-- 


UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';

UPDATE cats SET age = '15'
WHERE name = 'Misty';

UPDATE cats SET name = 'Jack'
WHERE name = 'Jackson';

UPDATE cats SET breed = 'British Shorthair'
WHERE name = 'Ringo';

UPDATE cats SET age = 12
WHERE breed = 'Maine Coon';

DELETE FROM cats WHERE age=4;

DELETE FROM cats WHERE age=cat_id;

DELETE FROM cats;
SELECT * FROM cats;

 
 