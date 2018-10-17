CREATE DATABASE user;
USE user;
CREATE TABLE users(
  user_id INT AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(40),
  password VARCHAR(40),
  email VARCHAR(255)
);

CREATE TABLE roles(
  role_id INT AUTO_INCREMENT,
  role_name VARCHAR(50),
  PRIMARY KEY(role_id)
);

CREATE TABLE userroles(
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE notPrimaryKey(
  primary_newkey INT(30),
  primary_name VARCHAR(25) NULL
);

ALTER TABLE notPrimaryKey ADD PRIMARY KEY(primary_newkey);
ALTER TABLE notPrimaryKey MODIFY primary_newkey INT AUTO_INCREMENT;