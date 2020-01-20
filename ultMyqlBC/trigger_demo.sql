DROP DATABASE IF EXISTS trigger_demo;
CREATE DATABASE trigger_demo;

USE trigger_demo;

CREATE TABLE users (
	username VARCHAR(100),
    age int
);

INSERT INTO users(username, age) VALUES("Bobby", 25);
INSERT INTO users(username, age) VALUES("Steve", 15);

DELIMITER //
CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
	BEGIN
		IF NEW.age < 18
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an adult!';
		END IF;
	END;
    
//

SELECT *
FROM users;
