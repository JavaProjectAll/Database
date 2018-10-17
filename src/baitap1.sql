create database AccountBank;
use AccountBank;
create table Customers(
  customer_number INT NOT NULL AUTO_INCREMENT,
  fullname NVARCHAR(50) NOT NULL ,
  address NVARCHAR(255),
  phone INT(13) unique ,
  email NVARCHAR(20) unique,
  PRIMARY KEY (customer_number)
);

create table Account(
  account_number INT AUTO_INCREMENT PRIMARY KEY ,
  account_type INT(5) NOT NULL ,
  date DATE,
  amounts INT(50) DEFAULT 0,
  description NVARCHAR(255),
  custom_id INT,
  FOREIGN KEY (custom_id) REFERENCES Customers(customer_number)
);

ALTER TABLE Account DROP COLUMN amounts, DROP COLUMN description;
ALTER TABLE Account ADD balance INT(50) DEFAULT 0;

create table Transaction(
  tran_number INT NOT NULL AUTO_INCREMENT,
  account_number INT NOT NULL ,
  date DATE NOT NULL ,
  amounts INT(50) NOT NULL ,
  desciption NVARCHAR(512),
  PRIMARY KEY (tran_number),
  FOREIGN KEY (account_number) REFERENCES Account(account_number)
);