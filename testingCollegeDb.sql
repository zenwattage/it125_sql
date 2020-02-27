DROP DATABASE IF EXISTS collegeDb;
CREATE DATABASE collegeDb;
USE collegeDb;


CREATE TABLE quarter (
	quarterId INT Primary Key AUTO_INCREMENT,
    name VARCHAR(45),
    year SMALLINT
);
INSERT INTO quarter
VALUES (DEFAULT, 'Fall', '2019');

CREATE TABLE section (
	sectionId INT PRIMARY KEY AUTO_INCREMENT,
    name	ENUM('Day','Night', 'Online')    
);
INSERT INTO section
VALUES (DEFAULT, 'Night');

-- designation should be our primary key?
CREATE TABLE course (
	courseId INT PRIMARY KEY AUTO_INCREMENT,
    designation VARCHAR(7),
    name	VARCHAR(45),
    credits	TINYINT
);
INSERT INTO course
VALUES (DEFAULT, 'MATH101', 'GEOMETRY', 5);

SELECT * FROM course;
SELECT * FROM section;
SELECT * FROM quarter;

