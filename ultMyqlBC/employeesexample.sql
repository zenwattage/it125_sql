DROP DATABASE IF EXISTS company_employees;
CREATE DATABASE company_employees;

USE company_employees;

CREATE TABLE employees (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100),
age INT NOT NULL,
current_status VARCHAR(100) DEFAULT('employed')
);

DESC employees;


INSERT INTO employees(last_name, first_name, middle_name, age, current_status) VALUES(
'johnson', 'joe', 'john', 34, 'employed'
);

SELECT * FROM employees;
