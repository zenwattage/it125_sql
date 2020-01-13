DROP DATABASE IF EXISTS tv_review;

CREATE DATABASE tv_review;

USE tv_review;

CREATE TABLE reviewers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4), -- 4 DIGIT YEAR
    genre VARCHAR(100)
);

CREATE TABLE reviews (
	id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1), -- '5.5' '2 TOTAL NUMBERS AND 1 PAST THE DECIMAL'
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),(8,4,8.5),(8,2,7.8),(8,6,8.8),
    (8,5,9.3),(9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),
    (9,5,4.5),(10,5,9.9),(13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
-- join 2 tables to retrieve title and rating of series
SELECT title,
		rating
FROM series
JOIN reviews
	ON series.id = reviews.series_id;

-- retrieve title and rating of series then group by rating then average
SELECT
	-- series_id,
	title,
	AVG(rating) AS avg_rating
FROM series
JOIN reviews
	ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-- INNER JOIN 3 tables
-- retrieve first_name, last_name and rating
SELECT
	first_name,
    last_name,
    rating
FROM reviewers
JOIN reviews
	ON reviewers.id = reviews.reviewer_id;
    
-- get series that are not reviewed
-- INNER JOIN only finds the 'innersection' of data that matches - so this will not get the un-reviewed series
 -- so we want to use a LEFT JOIN - everything from the series(left table) inluding the NULL data from reviews
SELECT
	title AS unreviewed_series
FROM series
LEFT JOIN reviews -- left join finds where there ISN'T an overlap of data
	ON series.id = reviews.series_id
WHERE rating IS NULL;


-- get genre and avg_rating
SELECT
    genre,
    ROUND(
		AVG(rating),
        2 -- round to 2 decimals
        ) AS avg_rating
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
GROUP BY genre;

/*
 get first and last name of reviewers with count of reviews,
 lowest and highest reviews, avg review, and status of the reviewer
 - including reviewers with null entries
 */
 
SELECT
	first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating),0) AS min,
    IFNULL(MAX(rating),0) as max,
    IFNULL(AVG(rating),0) as avg_rating,
    -- IF(COUNT(rating) >=1, 'Active', 'Inactive') AS Status
    CASE
		WHEN COUNT(rating) >= 10 THEN 'Power User'
		WHEN COUNT(rating) > 0 THEN 'Active' 
        ELSE 'Inactive'
     END AS status
FROM reviewers
LEFT JOIN reviews 
	ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


-- get title of series rating and reviewer first&last name
SELECT
	title,
    rating,
    CONCAT(first_name,' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series
	ON series.id = reviews.series_id
ORDER BY title;


 
 