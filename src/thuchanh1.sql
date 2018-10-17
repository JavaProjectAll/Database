CREATE DATABASE mydata;
USE mydata;
CREATE TABLE contact(
  contact_id INT(20) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL ,
  first_name VARCHAR(30),
  birthday DATE,
  CONSTRAINT contact_pk PRIMARY KEY (contact_id)
);

CREATE TABLE suppliers(
  suppliers_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  suppliers_name VARCHAR(100) NOT NULL ,
  account_rep VARCHAR(50) NOT NULL DEFAULT 'TBD'
);

DROP TABLE contact, suppliers;

ALTER TABLE suppliers
  ADD suppliers_id int(20) NOT NULL AUTO_INCREMENT
  AFTER suppliers_name,
  ADD CONSTRAINT suppliers_pk PRIMARY KEY (suppliers_id);

ALTER TABLE suppliers
  MODIFY suppliers_home NVARCHAR(100) NULL ;

ALTER TABLE suppliers
  MODIFY suppliers_home NVARCHAR(10),
  MODIFY suppliers_car NVARCHAR(10),
  MODIFY account_rep NVARCHAR(10);

ALTER TABLE suppliers DROP suppliers_id;
ALTER TABLE contact DROP contact_id;

ALTER TABLE suppliers
  CHANGE COLUMN suppliers_home supplie_school NVARCHAR(30);

ALTER TABLE contact RENAME contactV2;