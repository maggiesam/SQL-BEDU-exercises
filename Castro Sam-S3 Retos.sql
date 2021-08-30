-- SESIÓN 2 Retos
-- María Magdalena Castro Sam
USE tienda;
SHOW TABLES;

-- Reto 1
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
DESCRIBE empleado;
DESCRIBE venta;

SELECT nombre
FROM empleado AS e
JOIN venta AS v
  ON e.id_empleado = v.id_empleado;
  
-- ¿Cuál es el nombre de los artículos que se han vendido?
DESCRIBE articulo;

SELECT nombre 
FROM articulo AS a
JOIN venta AS v
	ON a.id_articulo = v.id_articulo;

-- ¿Cuál es el total de cada venta?
DESCRIBE articulo;

DESCRIBE venta;

SELECT precio 
FROM articulo AS a
JOIN venta AS v
	ON a.id_articulo = v.id_articulo;

-- Reto 2
-- Obtener el puesto de un empleado.
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE puesto;

CREATE VIEW puestoEmpleado_366 AS
(SELECT p.nombre, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM empleado e
JOIN puesto p
  ON p.id_puesto = e.id_puesto);
  
-- Saber qué artículos ha vendido cada empleado.
DESCRIBE empleado;
DESCRIBE venta;
DESCRIBE articulo;

CREATE VIEW articuloEmpleado_366 AS
(SELECT a.nombre, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v 
	JOIN articulo a
    ON a.id_articulo = v.id_articulo
    JOIN empleado e
    ON v.id_empleado = e.id_empleado);
    
-- Saber qué puesto ha tenido más ventas.
DESCRIBE puesto;
DESCRIBE venta;
-- puesto id_puesto
-- empleado id_empleado, nombre
-- venta id_empleado,

CREATE VIEW puestoVenta_366 AS
(SELECT p.nombre, count(v.clave) AS ventas_por_puesto
FROM venta v 
	JOIN empleado e
    ON v.id_empleado = e.id_empleado
    JOIN puesto p
    ON p.id_puesto = e.id_puesto
GROUP BY nombre);