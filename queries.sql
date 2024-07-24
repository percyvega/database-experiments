use classic_models;

-- COUNT(*)
SELECT COUNT(*) FROM product_lines; -- 7
SELECT COUNT(*) FROM products; -- 36
SELECT COUNT(*) FROM order_details; -- 990
SELECT COUNT(*) FROM orders; -- 242
SELECT COUNT(*) FROM customers; -- 122
SELECT COUNT(*) FROM payments; -- 216
SELECT COUNT(*) FROM employees; -- 23
SELECT COUNT(*) FROM offices; -- 7

-- INNER JOINs
SELECT COUNT(*) FROM product_lines pl JOIN products p ON p.productLine = pl.productLine; -- 36
SELECT COUNT(*) FROM products p JOIN order_details od ON od.productCode = p.productCode; -- 990
SELECT COUNT(*) FROM order_details od JOIN orders o ON od.orderNumber = o.orderNumber; -- 990
SELECT COUNT(*) FROM orders o JOIN customers c ON o.customerNumber = c.customerNumber; -- 242
SELECT COUNT(*) FROM payments p JOIN customers c ON p.customerNumber = c.customerNumber; -- 216
SELECT COUNT(*) FROM customers c JOIN employees e ON c.customerNumber = e.supportsCustomerNumber; -- 17
SELECT COUNT(*) FROM employees e JOIN offices o ON e.officeCode = o.officeCode; -- 16


-- INNER JOIN
-- Lists every Customer with every associated Employee when both exist -- 17
SELECT *
FROM customers c
  JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber;

-- Lists every SalesRep with every associated Customer when both exist -- 17
SELECT *
FROM employees e
  JOIN customers c
    ON c.customerNumber = e.supportsCustomerNumber;


-- INNER JOIN (SELF JOIN)
-- Lists every Employee with every associated Manager when they both exist -- 22
SELECT *
FROM employees e
  JOIN employees e2
    ON e.reportsTo = e2.employeeNumber;

-- Lists every Manager with every associated Employee when they both exist -- 22
SELECT *
FROM employees e
  JOIN employees e2
    ON e.reportsTo = e2.employeeNumber;


-- INNER JOIN (Two INNER JOINs)
-- Lists the combination of every Customer with every associated Employee and Order -- 108
SELECT *
FROM customers c
  JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber
  JOIN orders o
    ON c.customerNumber = o.customerNumber;


-- LEFT JOIN
-- Lists every Customer with 0 or more associated  Employees -- 124
SELECT *
FROM customers c
  LEFT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber;

-- Lists every Employee with 0 or more associated Customers -- 23
SELECT *
FROM employees e
  LEFT JOIN customers c
    ON c.customerNumber = e.supportsCustomerNumber;


-- LEFT JOIN (WITH EXCLUSION)
-- Lists every Customer with 0 associated Employees -- 107
SELECT *
FROM customers c
  LEFT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber
WHERE e.supportsCustomerNumber IS NULL;


-- LEFT JOIN (Two LEFT JOINs)
-- Lists the combination of every Customer with 0 or more associated Employees and Orders -- 301
SELECT *
FROM customers c
  LEFT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber
  LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber;


-- RIGHT JOIN
-- Lists 0 or more Customers associated to every Employee -- 23
SELECT *
FROM customers c
  RIGHT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber;

-- Lists 0 or more Employees associated to every Customer -- 124
SELECT *
FROM employees e
  RIGHT JOIN customers c
    ON c.customerNumber = e.supportsCustomerNumber;


-- FULL JOIN
-- The non-repeated list of every Customer with 0 or more associated Employees and every Employee with 0 or more associated Customers -- 130 
SELECT *
FROM customers c
  LEFT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber
UNION
SELECT *
FROM customers c
  RIGHT JOIN employees e
    ON c.customerNumber = e.supportsCustomerNumber;
