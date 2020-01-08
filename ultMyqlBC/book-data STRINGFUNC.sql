DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- DESC books;


-- SELECT CONCAT(author_fname,' ', author_lname) AS 'full name' FROM books;

-- SELECT author_fname AS first, author_lname AS last,
-- 	CONCAT(author_fname, ', ', author_lname) as full
--     FROM books;
--     
-- SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;


-- SELECT 
-- 	CONCAT_WS(' - ',title, author_fname,author_lname)
--     AS 'Title/Author'
-- FROM books;

-- SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

-- SELECT
-- 	CONCAT
-- 		(
-- 			SUBSTRING(title, 1, 10), 
--             '...'
-- 		) 
-- 		AS 'short title' FROM books;
        
-- SELECT REPLACE('Hello World', 'Hell', '@#$@!');

-- SELECT REPLACE('HellO World', 'o', 7); -- Case sensitive. Only selects the lowercase 'o'

-- SELECT REPLACE( 'cheese bread coffee milk', ' ', ' and '); 

-- SELECT REPLACE(title, 'e', '3') FROM books;

-- SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1,10) AS 'weird string' FROM books;

-- SELECT REVERSE('world');

-- SELECT CHAR_LENGTH('world');
-- SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


-- SELECT UPPER(title) from books;
-- SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;

-- SELECT UPPER(REVERSE('why does my cat look at me with such hatred?'));

-- SELECT REPLACE(title, ' ', '->') AS 'title' FROM books;

-- SELECT author_fname AS forwards, REVERSE(author_lname) AS backwards FROM books;

-- SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name in caps' FROM books;

-- SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb' FROM books;

-- -- CHARACTER LENGTH
-- SELECT title AS title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- SELECT 
-- 	CONCAT(SUBSTRING(title,1,10),'...') AS 'short title',
--     CONCAT(author_lname, ',', author_fname) AS author, 
-- 	CONCAT(stock_quantity, ' in stock') AS quantity
-- FROM books;


INSERT INTO books
     (title, author_fname, author_lname, released_year, stock_quantity, pages)
     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
        
-- -- DISTINCT 
-- SELECT DISTINCT CONCAT(author_fname, ' ', author_lname)AS 'distinct authors' FROM books;


-- -- ORDER BY
-- SELECT author_lname FROM books ORDER BY author_lname;
--  -- ascending by default
--  
--  SELECT author_lname FROM books ORDER BY author_fname DESC; -- descending

-- SELECT released_year FROM books ORDER BY released_year ASC; -- ascending


-- -- SELECT 1, 2, 3 FROM books ORDER BY 2;
-- -- order by 2 = author_fname
-- SELECT title, author_fname, author_lname FROM books ORDER BY 2;

-- -- sorts into 2 columns
-- SELECT author_fname, author_lname FROM books
-- ORDER BY author_lname, author_fname;

-- -- sorts first by lastname- but if last names match- sorts by first name
-- SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

-- DISTINCT
-- SELECT DISTINCT(author_fname) FROM books;

-- -- LIMIT 
-- SELECT title, released_year FROM books
-- ORDER BY released_year DESC LIMIT 5; 
-- -- FROM 3rd row to 5th row
-- SELECT title, released_year FROM books
-- ORDER BY released_year DESC LIMIT 3,5; 


-- LIKE


-- % = wildcards
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
-- select all titles where the title contains the word 'the'
SELECT title FROM books WHERE title LIKE '%the%';

-- escape character used to select any title with a % in the title 
SELECT title FROM books WHERE title LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%\_%';

-- underscore'_' is 'any'
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___';

-- CHALLENGES 
-- select titles that contain 'stories'
SELECT title AS 'title' FROM books WHERE title LIKE '%stories%' ;
-- find longest book - print out the title and page count
SELECT title AS 'title', pages AS 'pages' FROM books ORDER BY pages DESC LIMIT 1; 
-- print the title, year, of 3 most recent books
SELECT title, released_year AS 'summary' FROM books ORDER BY released_year DESC LIMIT 3;
-- select all authors last name that contain a space
SELECT title AS 'title', author_lname AS 'author lname' FROM books WHERE author_lname LIKE '% %';
-- select title, year , and stock of 3 books with lowest stock
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity,released_year DESC LIMIT 3;
-- print title and author_lname, sorted first by author_lname, then by title
SELECT title,author_lname FROM books ORDER BY author_lname, title DESC;
-- sort alphabetically by last name
SELECT UPPER(CONCAT('My favorite author is ', author_fname,' ', author_lname)) AS 'yell' FROM books ORDER BY author_lname;
