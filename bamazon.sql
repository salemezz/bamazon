DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
  item_id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(45) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY (item_id)
);


INSERT INTO products (product_name, price, stock_quantity)
VALUES ("BMW i8", 147500.00,6);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Ferrari 488 Spider", 280900.00, 3);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Audi R8 Spyder", 192000.00, 5);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Porsche 911 Turbo", 189150.00, 7);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Tesla Model S P90D", 103000.00, 9);

INSERT INTO products (product_name, price, stock_quantity)
VALUES ("Mercedes-AMG GT S", 131200.00, 7);

