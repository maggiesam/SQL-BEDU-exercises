-- SESIÓN 2 RETOS
-- María Magdalena Castro Sam

USE tienda;

-- Reto 1
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE '%Pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

--  ¿Qué nombres están separados por un guión?
SELECT *
FROM articulo
WHERE nombre LIKE '% - %';

-- Reto 2
SHOW TABLES;
DESCRIBE puesto;

-- ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario)
FROM puesto;

-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*)
FROM articulo
WHERE nombre LIKE '%pasta%';

-- ¿Cuál es el salario mínimo y máximo?
SELECT max(salario), min(salario)
FROM puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario)
FROM puesto
ORDER BY id_puesto DESC
LIMIT 5;

-- RETO 3
-- ¿Cuántos registros hay por cada uno de los puestos?
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE puesto;

SELECT nombre, count(*) AS numero_puestos
FROM puesto
GROUP BY nombre;

-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario)
FROM puesto
GROUP BY nombre;

-- ¿Cuál es el número total de ventas por vendedor?
DESCRIBE venta;

SELECT id_empleado, sum(clave) AS ventas
FROM venta
GROUP BY id_empleado;

-- ¿Cuál es el número total de ventas por artículo?
DESCRIBE venta;

SELECT id_articulo, count(*)
FROM venta
GROUP BY id_articulo;

-- RETO 4
-- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SHOW TABLES;

DESCRIBE empleado;

DESCRIBE puesto;

SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN
(SELECT id_puesto
	FROM puesto
    WHERE salario > 10000);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
DESCRIBE empleado;

DESCRIBE venta;

SELECT id_empleado, min(total), max(total)
FROM
(SELECT clave, id_empleado, count(*) total
FROM venta
GROUP BY clave, id_empleado) 
GROUP BY id_empleado;

-- ¿Cuál es el nombre del puesto de cada empleado?
DESCRIBE puesto;
SELECT nombre, apellido_paterno, 
(SELECT nombre 
FROM puesto 
WHERE id_puesto = e.id_puesto) AS puesto
FROM empleado AS e;	
