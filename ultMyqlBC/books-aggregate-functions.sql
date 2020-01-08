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
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343),
('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
('fake_book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


-- SELECT COUNT(*) FROM books;

-- SELECT COUNT(DISTINCT author_fname) FROM books;

-- SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

-- SELECT COUNT(*) title FROM books WHERE title LIKE '%the%';

-- GROUP BY
SELECT title, author_lname FROM books
GROUP BY author_lname;

SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;

SELECT title, author_lname, author_fname, COUNT(*) FROM books
GROUP BY author_lname, author_fname; 

SELECT released_year, COUNT(*) FROM books
GROUP BY released_year;

SELECT CONCAT('In ', released_year,' ',  COUNT(*), ' book(s) released ') AS 'Released Year' FROM books
GROUP BY released_year;

-- MIN & MAX
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

-- to get book with max pages and a SUBQUERY to get title and page
SELECT title,pages FROM books
WHERE pages = (SELECT MAX(pages)
				FROM books);
-- do same thing without subquery (which is faster) 
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;

-- USE MIN/MAX WITH GROUP BY

-- find year each author published their first book
SELECT author_fname,author_lname,MIN(released_year)
FROM books
GROUP BY author_lname,author_fname;

SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;

SELECT
	CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname, author_fname;


-- SUM 
SELECT SUM(pages) FROM books;

SELECT author_fname, author_lname,SUM(pages) FROM books
GROUP BY author_lname;

-- AVG
SELECT AVG(pages) FROM books;

SELECT AVG(stock_quantity) FROM books GROUP BY released_year;

SELECT released_year,AVG(stock_quantity) FROM boooks GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_fname, author_lname;

-- CHALLENGES
-- print the number of books in the database
SELECT COUNT(*) FROM books;
-- print the number of books released in each year
SELECT DISTINCT(released_year), COUNT(title) FROM books GROUP BY released_year;
-- print the total number of books in stock
SELECT SUM(stock_quantity) AS 'total # in stock' FROM books;
-- find the average released_year for each author
SELECT AVG(released_year), author_fname FROM books GROUP BY author_fname;
-- find the full name of the author who wrote the longest book
SELECT CONCAT(author_fname,' ', author_lname) AS 'author', MAX(pages) FROM books LIMIT 1;
-- year, #books, avg pages -  in asc year order
SELECT released_year AS 'year',
 COUNT(title) AS '# books',
 AVG(pages) AS 'pages'
 FROM books
 GROUP BY released_year;

