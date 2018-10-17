select productCode, productName, buyPrice, quantityInStock from products
where buyPrice > 56.65 AND quantityInStock > 1000;

SELECT productCode, productName, buyPrice, textDescription
FROM products INNER JOIN productlines
         ON products.productLine = productlines.productLine
WHERE buyPrice > 56.76 AND buyPrice < 95.59;

SELECT productCode, productName, buyPrice, quantityInStock, productVendor, productLine
FROM products
WHERE productLine = 'Classic Cars' OR productVendor = 'Min Lin Diecast';

