-- ACTIVAR LA BASE DE DATOS PRINCIPAL DE POSTGRESQL

\c postgres

-- CREAR UNA BASE DE DATOS

DROP DATABASE IF EXISTS CAMPUSFP;

CREATE DATABASE CAMPUSFP;

-- USAR UNA BASE DE DATOS

\c campusfp

-- CREAR UNA TABLA

DROP TABLE IF EXISTS Alumno;

CREATE TABLE Alumno (
  idAlumno          SERIAL       PRIMARY KEY,
  nombre            VARCHAR(25)  NOT NULL,
  apellidos         VARCHAR(50)  NOT NULL,
  grupo             VARCHAR(50)  NOT NULL,
  fecha_nacimiento  DATE         NOT NULL
);

-- MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

\dt

-- MOSTRAR LA DEFINICION(ESTRUCTURA) DE UNA TABLA

\d Alumno

-- INSERTAR REGISTROS A UNA TABLA

INSERT INTO Alumno (nombre, apellidos, grupo, fecha_nacimiento) VALUES 
('Carlos', 'Ledezma Perez', 'dam', '2020-01-15'),
('Miguel', 'Ruíz Párraga', 'daw', '2021-02-13'),
('Luis', 'Goycochea Ruíz', 'dam', '2019-03-18'),
('Carmen', 'Roncal Jauregui', 'daw', '2020-04-15'),
('Lucho', 'Diez Rodriguez', 'dam', '2021-10-31'),
('Lucia', 'Rodriguez Jauregui', 'dam', '2021-03-25'),
('Vanessa', 'Perez Cuba', 'daw', '2019-12-17'),
('Arturo', 'Ledezma Perez', 'dam', '2020-10-16');

-- MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

SELECT * FROM Alumno;

