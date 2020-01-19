USE join_us;

-- find earliest date a user joined
-- SELECT
-- 	CONCAT(MONTHNAME(created_at)
--     ,' ',DAY(created_at)
--     ,' ',YEAR(created_at)) AS earliest_date
-- FROM users
-- ORDER BY created_at DESC
-- LIMIT 1;

-- better solution
SELECT
	DATE_FORMAT( MIN(created_at), "%M %D %Y") AS earliest_date
FROM users;

-- find email of earlier user
-- SELECT
-- 	email,
-- 	created_at
-- FROM users
-- ORDER BY created_at DESC
-- LIMIT 1;

-- better solution
SELECT * FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);

-- table users according to month they joined
SELECT
	MONTHNAME(created_at) AS month,
    COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- count all users who use yahoo email addresses
SELECT
	COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%yahoo%';

-- count total number of users for each email host
SELECT
	CASE
		WHEN email LIKE '%@gmail.com' THEN 'gmail'
		WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;
