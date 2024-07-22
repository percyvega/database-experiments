use classic_models;

-- COUNT(*)
SELECT COUNT(*) FROM product_lines; -- 7
SELECT COUNT(*) FROM products; -- 110
SELECT COUNT(*) FROM order_details; -- 2996 
SELECT COUNT(*) FROM orders; -- 326
SELECT COUNT(*) FROM customers; -- 122
SELECT COUNT(*) FROM payments; -- 216
SELECT COUNT(*) FROM employees; -- 23
SELECT COUNT(*) FROM offices; -- 7

-- INNER JOINs
SELECT COUNT(*) FROM product_lines pl JOIN products p ON p.productLine = pl.productLine; -- 110
SELECT COUNT(*) FROM products p JOIN order_details od ON od.productCode = p.productCode; -- 2996
SELECT COUNT(*) FROM order_details od JOIN orders o ON od.orderNumber = o.orderNumber; -- 2996
SELECT COUNT(*) FROM orders o JOIN customers c ON o.customerNumber = c.customerNumber; -- 326
SELECT COUNT(*) FROM payments p JOIN customers c ON p.customerNumber = c.customerNumber; -- 216
SELECT COUNT(*) FROM customers c JOIN employees e ON c.customerNumber = e.supportsCustomerNumber; -- 17
SELECT COUNT(*) FROM employees e JOIN offices o ON e.officeCode = o.officeCode; -- 16


-- Lists the combination of Customers with their associated CustReps and Orders -- 143
SELECT *
FROM customers c
  JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber
  JOIN orders o
  	ON c.customerNumber = o.customerNumber;
  	
  
SELECT *
FROM customers c, employees e, orders o
WHERE c.customerNumber = e.supportsCustomerNumber
  AND c.customerNumber = o.customerNumber;
