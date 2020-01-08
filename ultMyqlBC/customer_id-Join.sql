DROP DATABASE IF EXISTS customers_and_orders;
CREATE DATABASE customers_and_orders;
USE customers_and_orders;


CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2), -- 8 is total number of digits, 2 is numbers after decimal
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers ( first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
		('George', 'Michae', 'gm@gmail.com'),
        ('David', 'Bowie', 'david@gmail.com'),
        ('Blue', 'Steele', 'blue@gmail.com'),
        ('Better', 'Davis', 'bette@gmail.com');
        
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
		('2017/11/11', 35.50, 1),
        ('2014/12/12', 800.67, 2),
        ('2015/01/03', 12.50, 2),
		('1999/04/11', 450.25, 5);
	
-- SELECT * FROM customers WHERE last_name = 'George';
-- SELECT * FROM orders WHERE customer_id = 1;

-- do above with a subquery
/*
SELECT * FROM orders WHERE customer_id=
	(
		SELECT id FROM customers
        WHERE last_name = 'George'
    );
    */
    
    -- crossjoin
    -- conjoins every customer with every order - basically useless but this is how it's done
    -- SELECT * FROM customers, orders;
    
    -- join 
    SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
    
    SELECT first_name, last_name, order_date, amount
    FROM customers, orders
		WHERE customers.id = orders.customer_id; -- joined where match