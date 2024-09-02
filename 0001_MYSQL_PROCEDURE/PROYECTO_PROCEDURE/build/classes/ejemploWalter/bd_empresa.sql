-- -------------------
-- CREAR BASE DE DATOS
-- -------------------

-- 1. BORRAR UNA BASE DE DATOS SI ESTA EXISTE

DROP DATABASE IF EXISTS EMPRESA;

-- 2. CREAR UNA BASE DE DATOS

CREATE DATABASE IF NOT EXISTS EMPRESA;

-- 3. USAR UNA BASE DE DATOS

USE EMPRESA;

-- 4. CREAR UNA TABLA

DROP TABLE IF EXISTS Empleado;

CREATE TABLE Empleado (
    id_empleado        INT            NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre             VARCHAR(100)   NOT NULL,
    puesto             VARCHAR(100)   NOT NULL,
    salario            DECIMAL(10, 2) NOT NULL,
    fecha_contratacion DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -------------
-- CREAR TRIGGER
-- -------------

DROP TRIGGER IF EXISTS before_insert_empleado;
DELIMITER //
CREATE TRIGGER before_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF NEW.salario < 0 THEN
        SET NEW.salario = 0;
    END IF;
END//
DELIMITER ;

-- --------------
-- LANZAR TRIGGER
-- --------------

INSERT INTO Empleado (nombre, puesto, salario, fecha_contratacion)
VALUES ('Juan Perez', 'Desarrollador', 3000.00, '2020-01-15');

INSERT INTO Empleado (nombre, puesto, salario, fecha_contratacion)
VALUES ('Maria Lopez', 'Gerente', 5000.00, '2018-05-10');

-- Intentar insertar un salario negativo
INSERT INTO Empleado (nombre, puesto, salario, fecha_contratacion)
VALUES ('Carlos Sanchez', 'Analista', -1000.00, '2021-03-22');

-- -----------------
-- COMPROBAR TRIGGER
-- -----------------

SELECT * FROM Empleado;

-- -----
-- NOTAS
-- -----

-- -----------------------------------------------------------------------------
El problema en tu código está relacionado con el uso de DELIMITER  en  tu cadena 
SQL. La instrucción DELIMITER es específica de clientes MySQL como el terminal o 
MySQL Workbench y no es necesaria ni compatible  cuando  ejecutas  las consultas 
directamente desde Java usando JDBC.

En JDBC, no necesitas cambiar el  delimitador, simplemente  debes  escribir   la 
consulta sin él y asegurarte de que la consulta sea válida para un solo envío. 

Cambios realizados:

Elimina el uso de DELIMITER ya que no es necesario en JDBC.

Asegúrate de que la consulta sea una  única  cadena y que termine con un punto y 
coma (;). La  instrucción  CREATE TRIGGER  ahora  se  ejecuta  directamente  sin 
delimitadores adicionales.
-- -----------------------------------------------------------------------------
El error ocurre porque MySQL no permite ejecutar varias  consultas  en  una sola 
llamada statement.execute() de JDBC, como es el caso cuando intentas ejecutar el 
DROP TRIGGER seguido del  CREATE TRIGGER en  una única llamada. Para  solucionar 
esto, debes dividir las consultas en dos partes y ejecutarlas por separado.
-- -----------------------------------------------------------------------------
Así quedaria después de quitar delimiter para usarlo en java con dos querys  por
separado hay que ejecutarlo desde java:
-- -----------------------------------------------------------------------------
-- QUERY PARA ELIMINAR EL TRIGGER

DROP TRIGGER IF EXISTS before_insert_empleado;

-- QUERY PARA CREAR EL TRIGER

CREATE TRIGGER before_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    IF NEW.salario < 0 THEN
        SET NEW.salario = 0;
    END IF;
END;
-- -----------------------------------------------------------------------------
