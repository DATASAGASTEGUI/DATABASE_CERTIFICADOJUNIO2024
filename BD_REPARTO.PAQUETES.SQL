-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------

DROP DATABASE IF EXISTS BDTRANSPORTEPAQUETES;
CREATE SCHEMA IF NOT EXISTS BDTRANSPORTEPAQUETES DEFAULT CHARACTER SET utf8 ;
USE BDTRANSPORTEPAQUETES ;

-- -----------------------------------------------------
-- Table Camionero
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Camionero (
  dni            CHAR(9)       NOT NULL PRIMARY KEY,
  nombre         VARCHAR(30)   NOT NULL,
  telefono       VARCHAR(10)   NOT NULL UNIQUE,
  direccion      VARCHAR(100)  NOT NULL,
  salario        DECIMAL(10,2) NOT NULL,
  poblacion_vive VARCHAR(20)   NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Provincia
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Provincia (
  codigoProvincia CHAR(4)     NOT NULL PRIMARY KEY,
  nombre          VARCHAR(45) NOT NULL

)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Destinatario
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Destinatario (
  idDestinatario INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre         VARCHAR(45) NOT NULL,
  direccion      VARCHAR(45) NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Paquete
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Paquete (
  codigoPaquete      CHAR(5)     NOT NULL PRIMARY KEY,
  descripcion        VARCHAR(45) NOT NULL,
  dni                CHAR(9)     NOT NULL,
  codigoProvincia    CHAR(4)     NOT NULL,
  idDestinatario     INT         NOT NULL,
  fecha_hora_entrega DATETIME    NULL,
  CONSTRAINT fk_Paquete_Camionero
    FOREIGN KEY (dni) REFERENCES Camionero (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Paquete_Provincia
    FOREIGN KEY (codigoProvincia) REFERENCES Provincia (codigoProvincia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Paquete_Destinatario
    FOREIGN KEY (idDestinatario) REFERENCES Destinatario (idDestinatario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Camion
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Camion (
  matricula CHAR(7)     NOT NULL PRIMARY KEY,
  modelo    VARCHAR(45) NOT NULL,
  tipo      VARCHAR(45) NOT NULL,
  potencia  INT         NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Camionero_has_Camion
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Camionero_has_Camion (
  dni        CHAR(9)  NOT NULL,
  matricula  CHAR(7)  NOT NULL,
  fecha_hora DATETIME NOT NULL,
             PRIMARY KEY (dni, matricula),

  CONSTRAINT fk_Camionero_has_Camion1
    FOREIGN KEY (dni) REFERENCES Camionero (dni)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Camionero_has_Camion2
    FOREIGN KEY (matricula) REFERENCES Camion (matricula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----
-- DATOS
-- -----

INSERT INTO Provincia(codigoProvincia,nombre) VALUES
('MAD','Madrid'),
('BAR','Barcelona'),
('TAR','Tarragona'),
('MUR','Murcia'),
('VAL','Valencia'),
('CAC','Caceres');

INSERT INTO Destinatario (idDestinatario, nombre, direccion) VALUES
(10, 'Gerson Alva', 'Calle Marconi 3434'),
(11, 'Lucía González', 'Av. Los Pinos 234'),
(12, 'Carlos Mendoza', 'Calle San Martín 45'),
(13, 'Ana Pérez', 'Jr. Las Flores 123'),
(14, 'Roberto Castillo', 'Av. 28 de Julio 567'),
(15, 'María Fernández', 'Calle Los Olivos 789'),
(16, 'Jorge Ramírez', 'Av. Universitaria 1001'),
(17, 'Isabel Torres', 'Calle Los Claveles 678'),
(18, 'David Silva', 'Jr. Los Sauces 234'),
(19, 'Fernanda Ortiz', 'Av. Las Palmeras 456'),
(20, 'José Rojas', 'Calle Los Rosales 910');

INSERT INTO Camionero(dni,nombre,telefono,direccion,salario,poblacion_vive) VALUES
('11111111A','Miguel','666777888','AV Ejercito 123', 2000, 'Madrid'),
('22222222B','Carlos','661117888','AV Pardo 13', 2050, 'Getafe');

INSERT INTO Camion (matricula, modelo, tipo, potencia) VALUES
('ABC1234', 'Volvo FH16', 'Remolque', 550),
('DEF5678', 'Mercedes-Benz Actros', 'Cisterna', 510),
('GHI9012', 'Scania R730', 'Volquete', 730),
('JKL3456', 'MAN TGX', 'Portacontenedores', 640),
('MNO7890', 'DAF XF', 'Plataforma', 480);

INSERT INTO Camionero_has_Camion (dni, matricula, fecha_hora) VALUES
('11111111A', 'ABC1234', '2024-09-19 08:30:00'),
('11111111A', 'DEF5678', '2024-09-20 09:45:00'),
('11111111A', 'GHI9012', '2024-09-21 11:15:00'),
('11111111A', 'JKL3456', '2024-09-22 13:30:00'),
('11111111A', 'MNO7890', '2024-09-23 15:00:00'),
('22222222B', 'ABC1234', '2024-09-19 14:00:00'),
('22222222B', 'DEF5678', '2024-09-20 10:30:00'),
('22222222B', 'GHI9012', '2024-09-21 12:45:00'),
('22222222B', 'JKL3456', '2024-09-22 14:30:00'),
('22222222B', 'MNO7890', '2024-09-23 16:00:00');

INSERT INTO Paquete (codigoPaquete, descripcion, dni, codigoProvincia, idDestinatario, fecha_hora_entrega, matricula) VALUES
('P001', 'Electrónica', '11111111A', 'MAD', 10, NULL),
('P002', 'Ropa', '22222222B', 'BAR', 11, NULL),
('P003', 'Juguetes', '11111111A', 'TAR', 12, NULL),
('P004', 'Libros', '22222222B', 'MUR', 13, '2024-09-20 10:30:00'),
('P005', 'Muebles', '11111111A', 'VAL', 14, NULL),
('P006', 'Electrodomésticos', '22222222B', 'CAC', 15, NULL),
('P007', 'Computadora', '11111111A', 'MAD', 16, NULL),
('P008', 'Herramientas', '22222222B', 'BAR', 17, NULL),
('P009', 'Joyería', '11111111A', 'TAR', 18, NULL),
('P010', 'Instrumentos musicales', '22222222B', 'MUR', 19, NULL),
('P011', 'Accesorios de auto', '11111111A', 'VAL', 20, NULL);