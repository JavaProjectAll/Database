CREATE DATABASE SaleManager;
use SaleManager;

CREATE TABLE Customers (
  customerNumber   INT          NOT NULL,
  customerName     NVARCHAR(50) NOT NULL,
  contactLastName  NVARCHAR(50) NOT NULL,
  contactFirstName NVARCHAR(50) NOT NULL,
  phone            INT(11)      NOT NULL,
  addressLine1     NVARCHAR(50) NOT NULL,
  addressLine2     NVARCHAR(50),
  city             NVARCHAR(50) NOT NULL,
  state            NVARCHAR(50),
  postalCode       INT(15)      NOT NULL,
  country          NVARCHAR(50) NOT NULL,
  creditLimit      DOUBLE DEFAULT 0
);
ALTER TABLE Customers
  MODIFY customerNumber INT PRIMARY KEY AUTO_INCREMENT;

CREATE TABLE Orders (
  orderNumber     INT          NOT NULL,
  orderDate       DATE         NOT NULL,
  requiredDate    DATE         NOT NULL,
  shippedDate     DATE         NOT NULL,
  status          NVARCHAR(15) NOT NULL,
  `comment`       TEXT,
  quantityOrdered INT(10)      NOT NULL,
  priceEach       DOUBLE       NOT NULL
);
ALTER TABLE Orders
  ADD customer_number INT,
  ADD FOREIGN KEY (customer_number) REFERENCES Customers (customerNumber);

ALTER TABLE Orders
  MODIFY orderNumber INT PRIMARY KEY AUTO_INCREMENT;

CREATE TABLE payments (
  customerNumber INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
  checkNumber    NVARCHAR(50) NOT NULL,
  paymentDate    DATE         NOT NULL,
  amount         DOUBLE                            DEFAULT 0
);

CREATE TABLE products (
  productCode        NVARCHAR(15) NOT NULL PRIMARY KEY,
  productName        NVARCHAR(70) NOT NULL,
  productScale       NVARCHAR(10) NOT NULL,
  productVendor      NVARCHAR(50) NOT NULL,
  productDescription TEXT         NOT NULL,
  quantityInStock    INT          NOT NULL,
  buyPrice           DOUBLE       NOT NULL,
  MSRP               DOUBLE       NOT NULL
);

ALTER TABLE products
  ADD productLine NVARCHAR(50),
  ADD FOREIGN KEY (productLine) REFERENCES productlines (productLine);

CREATE TABLE productlines (
  productLine     NVARCHAR(50)  NOT NULL PRIMARY KEY,
  textDescription NVARCHAR(256) NOT NULL,
  image           NVARCHAR(10)  NOT NULL
);

CREATE TABLE employees (
  employeeNumber NVARCHAR(50)  NOT NULL PRIMARY KEY,
  lastName       NVARCHAR(50)  NOT NULL,
  firstName      NVARCHAR(50)  NOT NULL,
  email          NVARCHAR(100) NOT NULL,
  jobTitle       NVARCHAR(50)  NOT NULL
);

CREATE TABLE OrdersDetail (
  orderNumber     INT          NOT NULL,
  productCode     NVARCHAR(15) NOT NULL,
  quantityOrdered INT(10)      NOT NULL,
  priceEach       DOUBLE       NOT NULL,
  orderLineNumber INT          NOT NULL,
  PRIMARY KEY (orderNumber, productCode)
);
ALTER TABLE OrdersDetail
  ADD FOREIGN KEY (orderNumber) REFERENCES Orders (orderNumber);
ALTER TABLE OrdersDetail
  ADD FOREIGN KEY (productCode) REFERENCES products (productCode);

CREATE TABLE offices (
  officeCode   NVARCHAR(10) NOT NULL PRIMARY KEY,
  city         NVARCHAR(50) NOT NULL,
  phone        NVARCHAR(50) NOT NULL,
  addressLine1 NVARCHAR(50) NOT NULL,
  addressLine2 NVARCHAR(50),
  state        NVARCHAR(50),
  country      NVARCHAR(50) NOT NULL,
  postalCode   NVARCHAR(15) NOT NULL
);

ALTER TABLE Customers
  ADD salesRepEmployeeNumber NVARCHAR(50) NOT NULL,
  ADD FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber);

ALTER TABLE employees
  ADD reportTo NVARCHAR(50) NOT NULL,
  ADD FOREIGN KEY (reportTo) REFERENCES employees (employeeNumber);

ALTER TABLE Customers
  ADD officeCode NVARCHAR(10) NOT NULL,
  ADD FOREIGN KEY (officeCode) REFERENCES offices (officeCode);