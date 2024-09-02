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

