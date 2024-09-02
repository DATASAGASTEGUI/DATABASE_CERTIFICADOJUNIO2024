-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------

DROP DATABASE IF EXISTS COLEGIO;
CREATE DATABASE IF NOT EXISTS COLEGIO DEFAULT CHARACTER SET utf8 ;
USE COLEGIO;

-- -----------------------------------------------------
-- Table Departamento
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Departamento (
  idDepartamento INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
  descripcion    VARCHAR(45) NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Empleado (
  idEmpleado     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre         VARCHAR(45) NOT NULL,
  telefono       VARCHAR(45) NOT NULL UNIQUE,
  idDepartamento INT         NOT NULL,
  CONSTRAINT fk_Departamento_Empleado
    FOREIGN KEY (idDepartamento) REFERENCES Departamento (idDepartamento)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

-- ---------------------
-- DATOS
-- ---------------------

INSERT INTO Departamento (descripcion) VALUES
('Administración'), -- 1
('Profesores'), -- 2
('Secretaria'); -- 3

INSERT INTO Empleado (nombre,telefono,idDepartamento) VALUES
('Jairo',  '656345789',2), -- 1
('Asuaga', '667893123',2), -- 2
('María',  '667893456',2), -- 3
('Josefa', '657345789',3), -- 4
('Gerson', '657789234',1), -- 5
('Arturo', '654734234',1); -- 6

 





