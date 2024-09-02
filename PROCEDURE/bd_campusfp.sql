-- 1. BORRAR UNA BASE DE DATOS SI ESTA EXISTE

DROP DATABASE IF EXISTS CAMPUSFP;

-- 2. CREAR UNA BASE DE DATOS

CREATE DATABASE IF NOT EXISTS CAMPUSFP;

-- 3. USAR UNA BASE DE DATOS

USE CAMPUSFP;

-- 4. CREAR UNA TABLA

DROP TABLE IF EXISTS Alumno;

CREATE TABLE Alumno (
  idAlumno          INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre            VARCHAR(25) NOT NULL,
  apellidos         VARCHAR(50) NOT NULL,
  grupo             VARCHAR(50) NOT NULL,
  fecha_nacimiento  DATE        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
					  
-- 5. MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

SHOW TABLES;

-- 6. MOSTRAR LA ESTRUCTURA DE UNA TABLA

DESCRIBE Alumno; 

-- 7. INSERTAR REGISTROS A UNA TABLA

INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Carlos','Ledezma Perez','dam','2020.01.15');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Miguel','Ruíz Párraga','daw','2021.02.13');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Luis','Goycochea Ruíz','dam','2019.03.18');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Carmen','Roncal Jauregui','daw','2020.04.15');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Lucho','Diez Rodriguez','dam','2021.10.31');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Lucia','Rodriguez Jauregui','dam','2021.03.25');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Vanessa','Perez Cuba','daw','2019.12.17');
INSERT INTO Alumno (idAlumno, nombre, apellidos, grupo, fecha_nacimiento) VALUES (NULL,'Arturo','Ledezma Perez','dam','2020.10.16');

-- 8. MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

SELECT * FROM Alumno;