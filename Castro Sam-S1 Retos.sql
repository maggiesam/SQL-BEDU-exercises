-- SESIÓN 1 RETOS
-- María Magdalena Castro Sam

SHOW DATABASES;
USE tienda;
SHOW tables;

-- RETO 1. Por cada tipo de dato que encuentres llena la tabla
DESCRIBE articulo; 
DESCRIBE puesto;
DESCRIBE venta;

-- TIPO // DESCRIPCIÓN
-- int // Guarda números enteros
-- varchar(45) // Guarda cadenas de caracteres no mayores a 45 caracteres
-- double // Guarda números que no son enteros
-- Timestamp // Guarda fechas y horas

-- RETO 2.
SHOW DATABASES;
USE tienda;
SHOW TABLES;

-- ¿Cuál es el nombre de los empleados con el puesto 4? 
SELECT id_puesto, nombre
FROM empleado
WHERE id_puesto = 4;

-- ¿Qué puestos tienen un salario mayor a $10,000? 
SELECT *
FROM puesto
WHERE salario > 10000;

-- ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100? 
SELECT *
FROM articulo
WHERE precio > 1000
AND iva > 100;

-- ¿Qué ventas incluyen los artículos 135 o 693 y fueron hechas por los empleados 835 o 369? 
SELECT *
FROM venta
WHERE id_articulo = 135 OR id_articulo = 953
AND id_empleado = 835 OR id_empleado = 369;

-- RETO 3. Usando tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
SELECT *
FROM puesto
ORDER BY salario DESC
LIMIT 5;
