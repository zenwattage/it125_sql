USE book_shop;

SELECT title FROM books WHERE title LIKE '%W%';

SELECT title FROM books WHERE title NOT LIKE '%W%';

SELECT 54 <= 54 && 'a' = 'A';

SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 THEN 'modern lit'
        ELSE '20th Century Lit'
	END AS GENRE
FROM books;


SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
	END AS STOCK
FROM books;


-- challenges
SELECT 10 != 10; -- false

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- true

-- select all books written before 1980 (non inclusive)
SELECT * FROM books WHERE released_year < 1980;

-- select all books written by eggers or chabon
SELECT title, author_fname, author_lname FROM books WHERE author_lname LIKE '%chabon%';

-- select all books written by lahiri published after 2000
SELECT * FROM books WHERE released_year > 2000 AND author_lname = 'lahiri';

-- select all books with page count between 100 - 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200; 
-- select all books where author_lname starts with a 'C' or an 'S'
SELECT * FROM books WHERE author_lname LIKE 'C%''S%';


-- if title contains 'stories' -> Short stories
-- just kids and a heartbreaking work -> memoir
-- else novel
SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short stories'
        WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work of Staggering Genius%' THEN 'memoir'
        ELSE 'novel'
	END AS 'TYPE'    
FROM books;

SELECT author_lname, author_fname,
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
    FROM books
GROUP BY author_lname, author_fname;