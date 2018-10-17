CREATE DATABASE custom;
USE custom;
CREATE TABLE customer(
  id INT AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(30) NOT NULL ,
  address VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders(
  order_id INT AUTO_INCREMENT ,
  staff VARCHAR(255),
  customer_id INT,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customer(id)
);