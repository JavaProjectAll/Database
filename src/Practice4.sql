select status
from orders
group by status;
select status, COUNT(status) AS 'So luong status'
from orders
GROUP BY status;

select status, SUM(quantityOrdered * priceEach) AS 'amount'
FROM orders
       INNER JOIN orderdetails on orders.orderNumber = orderdetails.orderNumber;

select orderNumber, sum(quantityOrdered * priceEach) as 'total'
from orderdetails
group by orderNumber;

select status, year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders
       inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where status = 'shipped'
group by year
having year > 2000;