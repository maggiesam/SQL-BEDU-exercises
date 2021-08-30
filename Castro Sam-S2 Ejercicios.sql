-- SESIÓN 2 Ejercicios
-- María Magdalena Castro Sam
USE classicmodels;
SHOW TABLES;

-- 1. Dentro de la tabla employees, obtén el número de empleado, 
-- apellido y nombre de todos los empleados cuyo nombre empiece con A.
DESCRIBE employees;

SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName LIKE 'A%';

-- 2. Dentro de la tabla employees, obtén el número de empleado, apellido 
-- y nombre de todos los empleados cuyo apellido termina con on.

SELECT employeeNumber, firstName, lastName
FROM employees
WHERE lastName LIKE '%on';

-- 3.Dentro de la tabla employees, obtén el número de empleado, apellido 
-- y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName LIKE '%on%';

-- 4.Dentro de la tabla employees, obtén el número de empleado, apellido y 
-- nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName LIKE 'G_____';

-- 5.Dentro de la tabla employees, obtén el número de empleado, apellido y 
-- nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName NOT LIKE 'B%';

-- 6. Dentro de la tabla products, obtén el código de producto y nombre de los productos
--  cuyo código incluye la cadena _20.
DESCRIBE products;

SELECT productCode, productName
FROM products
WHERE productCode LIKE '%_20%';

-- 7. Dentro de la tabla orderdetails, obtén el total de cada orden.
DESCRIBE orderdetails;

SELECT *
FROM orderdetails;

SELECT orderNumber, sum(priceEach) AS total
FROM orderdetails
GROUP BY orderNumber;

-- 8.Dentro de la tabla orders obtén el número de órdenes por año.
SHOW TABLES;
DESCRIBE orderdetails;
DESCRIBE orders;

SELECT YEAR(orderDate) AS anio, count(*)
FROM orders
GROUP BY anio;

-- 9. Obtén el apellido y nombre de los empleados cuya oficina está ubicada en USA.
DESCRIBE employees;

DESCRIBE offices;

SELECT lastName, firstName
FROM employees 
WHERE officeCode IN 
(SELECT officeCode
FROM offices
WHERE country = 'USA');

-- 10. Obtén el número de cliente, número de cheque y cantidad del cliente que ha 
-- realizado el pago más alto.
SHOW TABLES;
DESCRIBE payments;

SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount = 
(SELECT max(amount)
FROM payments);

-- 11. Obtén el número de cliente, número de cheque y cantidad de aquellos clientes 
-- cuyo pago es más alto que el promedio.
DESCRIBE payments;

SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount = 
(SELECT avg(amount)
FROM payments);

-- 12. Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
DESCRIBE customers;

SELECT customerName
FROM customers 
WHERE customerName NOT IN 
(SELECT customerName
FROM orders);

-- 13. Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.
DESCRIBE orderdetails;

SELECT max(quantityOrdered), min(quantityOrdered), avg(quantityOrdered)
FROM orderdetails;

-- 14. Dentro de la tabla orders, Obtén el número de órdenes que hay por cada estado.
DESCRIBE orders;

SELECT status, count(*)
FROM orders
GROUP BY status;