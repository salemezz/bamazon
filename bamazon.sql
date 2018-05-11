DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (id)
);

SELECT * FROM products; 

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("BMW i8", 147,500.00, 6);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Ferrari 488 Spider", 280,900.00, 3);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Audi R8 Spyder", 192,000.00, 5);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Porsche 911 Turbo", 189,150.00, 7);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Tesla Model S P90D", 103,000.00, 9);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Mercedes-AMG GT S", 131,200.00, 7);

