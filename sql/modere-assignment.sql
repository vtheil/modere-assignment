
-- Create tables
CREATE TABLE customers (
	id int PRIMARY KEY,
	first_name varchar(255),
	last_name varchar(255)
);

CREATE TABLE products (
	id int PRIMARY KEY,
	product_name varchar(255),
	price int
);

CREATE TABLE purchases (
	id int PRIMARY KEY,
	customer_id int,
	product_id int,
	FOREIGN KEY (customer_id) REFERENCES customers (id),
	FOREIGN KEY (product_id) REFERENCES products (id)
);

-- Populate tables
INSERT INTO customers
VALUES ('1', 'Anna', 'Lee'), 
	   ('2', 'Bella', 'Snyder'),
	   ('3', 'Chris', 'Belmont'),
	   ('4', 'Drew', 'Cross');

INSERT INTO products
VALUES ('15', 'apple', '2'),
	   ('25', 'peach', '3'),
	   ('35', 'watermelon', '5');

INSERT INTO purchases
VALUES ('111', '1', '25'),
	   ('222', '2', '15'),
	   ('333', '3', '25'),
	   ('444', '1', '35'),
	   ('555', '3', '15');

-- Query for all information
SELECT customers.id AS customer_id, customers.first_name, customers.last_name, products.id AS product_id, products.product_name, products.price
FROM customers 
JOIN purchases ON customers.id = purchases.customer_id 
JOIN products ON products.id = purchases.product_id
ORDER BY customer_id ASC;
