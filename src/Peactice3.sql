select * from customers;
select customerNumber, contactFirstName, contactLastName, phone, city from customers
where contactFirstName = "Peter" AND city = "Melbourne";

select customerNumber, contactFirstName, contactLastName, phone, city from customers
where contactLastName LIKE "%A%" AND city LIKE "%an%";

# tìm từ số a đến số b
SELECT customerNumber, contactFirstName, city FROM customers
WHERE customerNumber BETWEEN 125 AND 350;

SELECT customerNumber, contactFirstName, contactLastName, phone, city FROM customers
WHERE city IN ('NYC', 'Dublin');

SELECT customerNumber, contactFirstName, country, phone, city FROM customers
WHERE country = 'France' OR country = 'USA';

SELECT customerNumber, contactFirstName, country, phone, city FROM customers
ORDER BY contactFirstName ASC;

SELECT customerNumber, contactFirstName, country, phone, city FROM customers
ORDER BY contactFirstName DESC LIMIT 10;

SELECT count(country) AS 'Có bao nhiêu người sống ở France'
FROM customers WHERE country = 'USA';

insert into customers ( customername, contactfirstname, contactlastname, phone, addressline1, city, country)
values ('AgileLead', 'Lan', 'Trần', '0978822683', 'Hàm Nghi', 'Hà Nội', 'Việt Nam' );

update customers set customername = 'Baane Mini Imports'
where customernumber = 103;

DELETE FROM customers WHERE city = 'Nantes' ;