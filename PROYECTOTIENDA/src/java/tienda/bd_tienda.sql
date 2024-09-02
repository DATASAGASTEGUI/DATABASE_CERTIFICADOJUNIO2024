-- ACTIVAR LA BASE DE DATOS PRINCIPAL DE POSTGRESQL

\c postgres

-- CREAR UNA BASE DE DATOS

DROP DATABASE IF EXISTS TIENDA;

CREATE DATABASE TIENDA;

-- USAR UNA BASE DE DATOS

\c tienda

-- CREAR UNA TABLA

DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
  id_usuario        SERIAL       PRIMARY KEY,
  nombre            VARCHAR(25)  NOT NULL,
  apellidos         VARCHAR(50)  NOT NULL,
  username          VARCHAR(20)  NOT NULL,
  password          VARCHAR(50)  NOT NULL,
  fecha_nacimiento  DATE         NOT NULL
);

-- MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

\dt

-- MOSTRAR LA DEFINICION(ESTRUCTURA) DE UNA TABLA

\d Usuario

-- INSERTAR REGISTROS A UNA TABLA

INSERT INTO Usuario (nombre, apellidos, username, password, fecha_nacimiento) VALUES 
('Carlos', 'Ledezma Perez', 'carlos', '12345678', '2020-01-15'),
('Miguel', 'Ruíz Párraga', 'miguel', '12345678', '2021-02-13'),
('Luis', 'Goycochea Ruíz', 'luis', '12345678', '2019-03-18');

-- MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

SELECT * FROM Usuario;

