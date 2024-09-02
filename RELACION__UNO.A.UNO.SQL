-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------
DROP DATABASE IF EXISTS BDUNOAUNO;
CREATE DATABASE IF NOT EXISTS BDUNOAUNO DEFAULT CHARACTER SET utf8;
USE BDUNOAUNO ;

-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS BDUNOAUNO.Empleado (
  idEmpleado INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre     VARCHAR(45) NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table DocumentoIdentidad
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS DocumentoIdentidad (
  dni        VARCHAR(10) NOT NULL PRIMARY KEY,
  idEmpleado INT         NOT NULL,
  CONSTRAINT fk_DocumentoIdentidad_Empleado
      FOREIGN KEY (idEmpleado)
      REFERENCES Empleado (idEmpleado)
      ON DELETE CASCADE
      ON UPDATE ON ACTION
)ENGINE = InnoDB;

-- -----
-- DATOS
-- -----

INSERT INTO Empleado (nombre) VALUES
('Miguel'),('Carlos'),('María'),('Carla'),('Gerson');
--   1         2          3         4          5

INSERT INTO DocumentoIdentidad (dni,idEmpleado) VALUES
('11111111N',1),
('22222222A',2),
('33333333T',3),
('44444444X',4),
('55555555B',5);


