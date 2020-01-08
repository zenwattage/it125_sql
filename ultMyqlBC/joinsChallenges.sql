DROP TABLE IF EXISTS students, papers;

CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
	title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


-- challenges

-- select first_name, title, and grades of the students with papers turned in

SELECT first_name, title, grade
FROM students
RIGHT JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC;

-- select all students and corresponding papers or lack thereof

SELECT first_name,title,grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;



-- same as above but replace 'null' with 'MISSING' as title and '0' for grade
SELECT first_name,
        IFNULL(title, 'MISSING'),
        IFNULL(grade, 0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

-- print first_name and grade averages
-- if grade = null -> '0'
SELECT first_name,
        IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- if grade average is 75 or higher passing_status = 'PASSING'
-- if not passing_status = 'FAILING'
SELECT first_name,
        IFNULL(AVG(grade), 0) AS average,
        CASE
		WHEN AVG(grade) BETWEEN 75 AND 100 THEN 'PASSING'
        ELSE 'FAILING'
	END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;
