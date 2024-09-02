-- ---------------------------
-- ESTRUCTURA DE LA BASE DATOS
-- ---------------------------

-- ACTIVAR LA BASE DE DATOS PRINCIPAL DE POSTGRESQL

\c postgres

-- CREAR UNA BASE DE DATOS

DROP DATABASE IF EXISTS TIENDA;

CREATE DATABASE TIENDA;

-- USAR UNA BASE DE DATOS

\c tienda

-- CREAR UNA TABLA

DROP TABLE IF EXISTS Producto;

CREATE TABLE Producto (
    id        SERIAL NOT NULL PRIMARY KEY,
    nombre    TEXT   NOT NULL,
    detalles  JSONB  NOT NULL
);

-- -----
-- DATOS
-- -----

-- INSERTAR REGISTROS A UNA TABLA

INSERT INTO Producto (nombre, detalles) VALUES
('Laptop', '{"marca": "Dell", "modelo": "XPS 13", "precio": 1200, "especificaciones": {"ram": "16GB", "procesador": "Intel i7"}}'),
('Smartphone', '{"marca": "Apple", "modelo": "iPhone 13", "precio": 999, "especificaciones": {"almacenamiento": "128GB", "pantalla": "6.1 pulgadas"}}'),
('Tablet', '{"marca": "Samsung", "modelo": "Galaxy Tab S7", "precio": 650, "especificaciones": {"almacenamiento": "256GB", "pantalla": "11 pulgadas"}}');




