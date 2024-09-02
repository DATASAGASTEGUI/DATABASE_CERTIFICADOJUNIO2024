-- 1. ELIMINAR LA BASE DATOS SI EXISTE

DROP DATABASE IF EXISTS Test0001;

-- 2. CREAR LA BASE DE DATOS

CREATE DATABASE Test0001;

-- 3. SELECCIONARA LA BASE DE DATOS A USAR

USE Test0001;

-- 4. CREAR LA TABLA

CREATE TABLE Cliente (
    id_cliente        INT           NOT NULL PRIMARY KEY,
    nombre            VARCHAR(50)   NOT NULL,
    edad              INT           NOT NULL,
    ingresos          DECIMAL(10,2) NOT NULL,
    historial_compras INT           NOT NULL 
);

-- 5. MOSTRAR LA ESTRUCTURA DE LA TABLA

DESCRIBE Cliente; 

-- 5. INSERTAR REGISTROS

INSERT INTO Cliente VALUES
(1, 'Juan', 25, 50000, 3),
(2, 'María', 30, 75000, 5),
(3, 'Pedro', 22, 40000, 2),
(4, 'Ana', 35, 90000, 7),
(5, 'Luis', 28, 60000, 2),
(6, 'Juan', 25, 60000, 1),
(7, 'Ana', 25, 90000, 7),
(8, 'Ismael', 28, 75000, 2),
(9, 'María', 30, 40000, 2),
(10, 'Liz', 30, 50000, 5);

-- 6. MOSTRAR TODOS LOS REGISTROS

SELECT * FROM Cliente;

-- 7. APUNTES

-- historial_compras: Indica la frecuencia o cantidad de compras que un cliente ha realizado

-- 1. CUANTOS CLIENTES HAY POR CADA GRUPO DE EDAD

SELECT edad, COUNT(*) AS cantidad
FROM Cliente
GROUP BY edad
ORDER BY edad ASC;

-- 2. CALCULAR EL INGRESO(DINERO) PROMEDIO POR CADA GRUPO DE EDAD

SELECT edad, AVG(ingresos) AS media_ingresos
FROM Cliente
GROUP BY edad
ORDER BY edad ASC;

-- 3. OBTENER LA SUMA TOTAL DE INGRESOS EN CADA GRUPO. ORDENADO ASCENDENTE.

SELECT edad, SUM(ingresos) AS suma_ingresos
FROM Cliente
GROUP BY edad
ORDER BY edad ASC;

-- 4. AGRUPAR POR RANGO DE INGRESOS Y CONTAR CUANTOS CLIENTES HAY EN CADA RANGO
--    < 50000         Bajo
--    [50000, 80000] Medio
--	  > 80000         Alto

SELECT id_cliente, CASE
                     WHEN ingresos < 50000 THEN 'Bajo'
					 WHEN ingresos >= 50000 AND ingresos <= 80000 THEN 'Medio'
                     -- WHEN ingresos > 80000 THEN 'Alto'
		             ELSE 'Alto'
	               END AS TipoIngresos
                   
FROM Cliente;


SELECT CASE
                     WHEN ingresos < 50000 THEN 'Bajo'
					 WHEN ingresos >= 50000 AND ingresos <= 80000 THEN 'Medio'
                     -- WHEN ingresos > 80000 THEN 'Alto'
		             ELSE 'Alto'
	   END AS TipoIngresos,
	   COUNT(*) AS CantidadClientes
FROM Cliente
GROUP BY TipoIngresos;

-- 5. MOSTRAR LOS GRUPOS POR EDAD QUE TENGAN MAS NUMERO DE CLIENTES

SELECT edad, COUNT(*) AS cantidad
FROM Cliente
GROUP BY edad
HAVING cantidad = (SELECT COUNT(*) AS cantidad
FROM Cliente
GROUP BY edad
ORDER BY cantidad DESC
LIMIT 1)
ORDER BY edad ASC;

-- SUBCONSULTA
SELECT COUNT(*) AS cantidad
FROM Cliente
GROUP BY edad
ORDER BY cantidad DESC
LIMIT 1;

-- 6. MOSTRAR LOS GRUPOS POR EDAD QUE TENGAN MAS DE UN CLIENTE

SELECT edad, COUNT(*) AS cantidad
FROM Cliente
GROUP BY edad
HAVING cantidad > 1
ORDER BY cantidad ASC;

-- 7. MOSTRAR LOS GRUPOS DE INGRESOS PROMEDIO SUPERIORES A 60000 EUROS.
 
SELECT edad, AVG(ingresos) AS media_ingresos
FROM Cliente
GROUP BY edad
HAVING media_ingresos > 60000
ORDER BY edad ASC;
  
-- 8. MOSTRAR LOS CLIENTES CON INGRESOS MAYORES AL INGRESO PROMEDIO

SELECT * FROM Cliente WHERE ingresos > (SELECT AVG(ingresos) as Ingreso_Medio FROM Cliente);

-- SUBCONSULTA
SELECT AVG(ingresos) as Ingreso_Medio FROM Cliente;

-- 9. AUTOMATIZAR CON UN TRIGGER EL PROCESO DE INSERTAR REGISTROS 

-- PRIMER PASO CREAR LAS TABLAS TEMPORALES

DROP TEMPORARY TABLE IngresosBajo;
CREATE TEMPORARY TABLE IngresosBajo (
    id          INT PRIMARY KEY auto_increment,
    id_cliente  INT NOT NULL,
    ingresos    INT NOT NULL
);
DROP TEMPORARY TABLE IngresosMedio;
CREATE TEMPORARY TABLE IngresosMedio (
    id          INT PRIMARY KEY auto_increment,
    id_cliente  INT NOT NULL,
    ingresos    INT NOT NULL
);
DROP TEMPORARY TABLE IngresosAlto;
CREATE TEMPORARY TABLE IngresosAlto (
    id          INT PRIMARY KEY auto_increment,
    id_cliente  INT NOT NULL,
    ingresos    INT NOT NULL
);

-- SEGUNDO PASO CREAR TRIGGER

DROP TRIGGER IF EXISTS after_insert_cliente;
DELIMITER $$
CREATE TRIGGER after_insert_cliente
AFTER INSERT ON Cliente
FOR EACH ROW
BEGIN
    IF NEW.ingresos < 50000 THEN
       INSERT INTO IngresosBajo(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
    IF NEW.ingresos >= 50000 AND NEW.ingresos <= 80000 THEN
       INSERT INTO IngresosMedio(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
    IF NEW.ingresos > 80000  THEN
       INSERT INTO IngresosAlto(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
END$$
DELIMITER ;

-- LAZAR TRIGGER

SELECT * FROM Cliente;
SELECT * FROM IngresosBajo;

INSERT INTO Cliente (id_cliente,nombre,edad,ingresos,historial_compras) VALUES (12, 'Ramón', 30, 30000, 5);






