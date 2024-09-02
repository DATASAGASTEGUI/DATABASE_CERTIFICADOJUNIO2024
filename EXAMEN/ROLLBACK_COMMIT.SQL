-- ----------------
-- CREAR BASE DATOS
-- ----------------

-- Borrar la base de datos
DROP DATABASE  IF EXISTS BDTRANSACCIONES;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS BDTRANSACCIONES;

-- Usar la base de datos
USE BDTRANSACCIONES;

-- Crear la tabla Clientes
CREATE TABLE IF NOT EXISTS Cliente (
    id_cliente INT                  PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL
)ENGINE = InnoDB;

-- ----------------------
-- REALIZAR TRANSACCION 1
-- ----------------------


