-- SESIÓN 3 Ejercicios
-- María Magdalena Castro Sam

-- Para estas consultas usa INNER JOIN
-- 1. Obtén la cantidad de productos de cada orden.
USE classicmodels;

SHOW TABLES;
DESCRIBE orders;
DESCRIBE orderdetails;

SELECT o.orderNumber, sum(od.quantityOrdered)
FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
GROUP BY orderNumber;

-- 2. Obtén el número de orden, estado y costo total de cada orden.
DESCRIBE orders;
DESCRIBE orderdetails;

SELECT o.orderNumber, o.status, sum(od.quantityOrdered*od.priceEach) AS total
FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
GROUP BY orderNumber;

-- 3. Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
SHOW TABLES;
DESCRIBE orders;
DESCRIBE products;
DESCRIBE orderdetails; 

SELECT o.orderNumber, o.orderDate, od.orderLineNumber, p.productName ,od.quantityOrdered, od.priceEach
FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
JOIN products AS p
  ON p.productCode = od.productCode;
  
-- 4. Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
DESCRIBE orders;
DESCRIBE products;
DESCRIBE orderdetails; 

SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
 FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
JOIN products AS p
  ON p.productCode = od.productCode;
  
-- Para estas consultas usa LEFT JOIN
-- 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden 
-- hecha por cada cliente. ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?alter

-- LEFT JOIN es útil para tener los datos globales de una tabla (izq) y juntar solo los datos de otra tabla
-- bajos las condiciones que queremos. 
 
SHOW TABLES;
DESCRIBE customers;
DESCRIBE orderdetails;
DESCRIBE orders;

SELECT c.customerNumber, c.customerName, o.orderNumber, c.state
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customerNumber = o.customerNumber;
  
-- 6. Obtén los clientes que no tienen una orden asociada.
DESCRIBE customers;
DESCRIBE orders;

SELECT c.customerName
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

-- 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y 
-- total, es decir, los clientes asociados a cada empleado.
SHOW TABLES;

DESCRIBE employees;
DESCRIBE customers;
DESCRIBE payments; 

SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM employees AS e
LEFT JOIN customers AS c
  ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
  ON p.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

-- Para estas consultas usa RIGHT JOIN
-- 8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? Explica las diferencias 
-- en un comentario. Para poner comentarios usa --.

-- Con left join estan todos los clientes y no necesariamente tienen ordenes, asi que hay algunos numeros de orden vacíos
-- Con right join no están todos los clientes, solo los que hicieron ordenes por lo tanto toda la columna de
-- ordernumber tiene valores int
SELECT c.customerNumber, c.customerName, o.orderNumber, c.state
FROM customers AS c
RIGHT JOIN orders AS o
  ON c.customerNumber = o.customerNumber;
  
-- left join incluye todos los clientes y excluye los que tienen orden asignada
-- mientras que en el caso de right join no hay porque el comando excluye los clientes que no tienen numero 
-- de orden asignado 
SELECT c.customerName
FROM customers AS c
RIGHT JOIN orders AS o
  ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

-- con left join tenemos todos los empleados incluso los que no estaban asociados a un cliente, por lo tanto hay algunos 
-- registros de cliente, cheque y monto que estan en null, igualmente pasa con el segundo joins, no todos los clientes
-- hicieron pagos asi que hay pagos en null.
-- Con right join solo vienen los clientes que están asociados a los empleados, por lo tanto no hay empleados
-- sin cliente y la tabala tiene todos los registros llenos
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM employees AS e
RIGHT JOIN customers AS c
  ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments AS p
  ON p.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber;

-- 9. Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.

CREATE VIEW total_366 AS
(SELECT o.orderNumber, o.status, sum(od.quantityOrdered*od.priceEach) AS total
FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
GROUP BY orderNumber);

SELECT status, total
FROM total_366
WHERE total >= 50000;

CREATE VIEW pricescomparison_366 AS
(SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
 FROM orders AS o
JOIN orderdetails as od
  ON o.orderNumber = od.orderNumber
JOIN products AS p
  ON p.productCode = od.productCode);

SELECT *
FROM pricescomparison_366
WHERE productName LIKE '%Mercedes%';

CREATE VIEW checks_366 AS
(SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM employees AS e
LEFT JOIN customers AS c
  ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
  ON p.customerNumber = c.customerNumber
ORDER BY customerName, checkNumber);

SELECT customerName, sum(amount)
FROM checks_366
GROUP BY customerName;