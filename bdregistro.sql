DROP DATABASE IF EXISTS BDREGISTRO;
CREATE DATABASE IF NOT EXISTS BDREGISTRO;
USE BDREGISTRO;
CREATE TABLE IF NOT EXISTS mascota(
 idMascota INT PRIMARY KEY auto_increment, 
 Descripcion VARCHAR(20) NOT NULL
);
INSERT INTO mascota VALUES
(NULL,'Gato'),
(NULL,'Perro'),
(NULL,'Lince'),
(NULL,'Hamster'),
(NULL,'Loro'),
(NULL,'Tortuga');

INSERT INTO mascota (idMascota, descripcion) VALUES (NULL, 'Oso');
INSERT INTO mascota (idMascota, descripcion) VALUES (NULL, 'Hipopótamo');

CREATE TABLE IF NOT EXISTS pais(
	idPais VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(20)
);
INSERT INTO pais VALUES
('ES','España'),
('RO','Rumania'),
('CO','Colombia'),
('MX','Mexico'),
('UK','Inglaterra');

CREATE TABLE IF NOT EXISTS pasatiempo(
 idPasatiempo INT PRIMARY KEY auto_increment,
 descripcion VARCHAR(20) NOT NULL
);
INSERT INTO pasatiempo VALUES
(NULL,'Ajedrez'),
(NULL,'Escalada'),
(NULL,'Futbol'),
(NULL,'Baloncesto'),
(NULL,'Hockey');


CREATE TABLE IF NOT EXISTS cliente (
	idCliente      INT          PRIMARY KEY AUTO_INCREMENT,
    nombreApellido VARCHAR(20),
    mascota        JSON,
    pais           CHAR(2),
    pasatiempos    JSON,
    fechaHora      DATETIME,
    correo         VARCHAR(50),
    sexo           CHAR(1),
    telefono       CHAR(9),
    password_      VARCHAR(20),
    autorizacion   BOOLEAN
);
SELECT * FROM cliente;