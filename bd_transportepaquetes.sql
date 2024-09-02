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

INSERT INTO Paquete (codigoPaquete, descripcion, dni, codigoProvincia, idDestinatario, fecha_hora_entrega) VALUES
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

-- ---------
-- CONSULTAS
-- ---------

(1) MOSTRAR LOS PAQUETES(HIJO) POR CADA CAMIONERO(PADRE)

SELECT c.nombre, p.codigoPaquete
FROM Camionero c
JOIN Paquete p ON c.dni = p.dni
ORDER BY c.nombre;

+--------+---------------+
| nombre | codigoPaquete |
+--------+---------------+
| Carlos | P002          |
| Carlos | P004          |
| Carlos | P006          |
| Carlos | P008          |
| Carlos | P010          |
| Miguel | P001          |
| Miguel | P003          |
| Miguel | P005          |
| Miguel | P007          |
| Miguel | P009          |
| Miguel | P011          |
+--------+---------------+

(2) MOSTRAR LA CANTIDAD DE PAQUETES ENTREGADOS POR CADA CAMIONERO

SELECT c.nombre, COUNT(p.codigoPaquete) AS CANTIDAD
FROM Camionero c
JOIN Paquete p ON c.dni = p.dni
GROUP BY c.nombre
ORDER BY c.nombre;

+--------+----------+
| nombre | CANTIDAD |
+--------+----------+
| Carlos |        5 |
| Miguel |        6 |
+--------+----------+

(3) QUIEN ES EL CAMIONERO QUE ENTREGO MAS PAQUETES

SELECT c.nombre, COUNT(p.codigoPaquete) AS CANTIDAD
FROM Camionero c
JOIN Paquete p ON c.dni = p.dni
GROUP BY c.nombre
ORDER BY CANTIDAD DESC
LIMIT 1;

+--------+----------+
| nombre | CANTIDAD |
+--------+----------+
| Miguel |        6 |
+--------+----------+

(4) QUIEN ES EL CAMIONERO QUE ENTREGO MENOS PAQUETES

SELECT c.nombre, COUNT(p.codigoPaquete) AS CANTIDAD
FROM Camionero c
JOIN Paquete p ON c.dni = p.dni
GROUP BY c.nombre
ORDER BY CANTIDAD ASC
LIMIT 1;

+--------+----------+
| nombre | CANTIDAD |
+--------+----------+
| Carlos |        5 |
+--------+----------+

(5) MOSTRAR CUANTOS PAQUETES(HIJOS) SE HA DESITRIBUIDO POR PROVINCIA(PADRE)

SELECT pr.nombre, pa.codigoPaquete, pa.descripcion
FROM Provincia pr
JOIN Paquete pa ON pr.codigoProvincia = pa.codigoProvincia
ORDER BY pr.nombre;

-----------+---------------+------------------------+
| nombre    | codigoPaquete | descripcion            |
+-----------+---------------+------------------------+
| Barcelona | P002          | Ropa                   |
| Barcelona | P008          | Herramientas           |
| Caceres   | P006          | Electrodomésticos      |
| Madrid    | P001          | Electrónica            |
| Madrid    | P007          | Computadora            |
| Murcia    | P004          | Libros                 |
| Murcia    | P010          | Instrumentos musicales |
| Tarragona | P003          | Juguetes               |
| Tarragona | P009          | Joyería                |
| Valencia  | P005          | Muebles                |
| Valencia  | P011          | Accesorios de auto     |
+-----------+---------------+------------------------+

SELECT pr.nombre, COUNT(pa.codigoPaquete)
FROM Provincia pr
JOIN Paquete pa ON pr.codigoProvincia = pa.codigoProvincia
GROUP BY pr.nombre
ORDER BY pr.nombre;

+-----------+-------------------------+
| nombre    | COUNT(pa.codigoPaquete) |
+-----------+-------------------------+
| Barcelona |                       2 |
| Caceres   |                       1 |
| Madrid    |                       2 |
| Murcia    |                       2 |
| Tarragona |                       2 |
| Valencia  |                       2 |
+-----------+-------------------------+

(6) INSERTAR LA ENTREGA DE UN PAQUETE AL DESTINATARIO(CLIENTE) CON 10
    LUEGO MOSTRAR LA CANTIDAD DE PAQUETES QUE EN EL HISTORIAL DEL DESTINANATARIO HA RECIBIDO

INSERT INTO Paquete (codigoPaquete, descripcion, dni, codigoProvincia, idDestinatario) VALUES
('P012', 'Jardinería', '11111111A', 'MAD', 10);

SELECT d.idDestinatario, d.nombre, d.direccion, COUNT(pa.codigoPaquete)
FROM Paquete pa
JOIN Destinatario d ON pa.idDestinatario = d.idDestinatario
WHERE d.idDestinatario = 10
GROUP BY d.nombre
ORDER BY d.nombre;

+----------------+-------------+--------------------+-------------------------+
| idDestinatario | nombre      | direccion          | COUNT(pa.codigoPaquete) |
+----------------+-------------+--------------------+-------------------------+
|             10 | Gerson Alva | Calle Marconi 3434 |                       2 |
+----------------+-------------+--------------------+-------------------------+

(7) MOSTRAR LA FECHA EN QUE FUE ENTREGADO EL PAQUETE P004


SELECT codigoPaquete, fecha_hora_entrega
FROM Paquete
WHERE codigoPaquete = 'P004';

+---------------+---------------------+
| codigoPaquete | fecha_hora_entrega  |
+---------------+---------------------+
| P004          | 2024-09-20 10:30:00 |
+---------------+---------------------+

(8) CUANTOS PAQUETES HA ENTREGADO EL CAMIONERO '11111111A' EN LA PROVINCIA DE CACERES(CAC)

SELECT p.dni, pr.codigoProvincia, COUNT(pr.codigoProvincia) AS CANTIDAD
FROM Paquete p
JOIN Provincia pr ON p.codigoProvincia = pr.codigoProvincia
WHERE p.dni = '11111111A' AND pr.codigoProvincia = 'CAC';

(9) QUE MODELO DE CAMION SE USO PARA ENTREGAR EL PAQUETE P003.

SELECT p.codigoPaquete, k.modelo
FROM Camionero c
JOIN Paquete p ON c.dni = p.dni
JOIN Camionero_has_Camion cc ON c.dni = cc.dni
JOIN Camion k ON k.matricula = cc.matricula
WHERE p.codigoPaquete = 'P003';





