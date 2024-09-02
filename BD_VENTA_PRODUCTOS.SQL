-- ---------------------
-- ESTRACTURA BASE DATOS
-- ---------------------

DROP DATABASE IF EXISTS BDVENTAPRODUCTOS;
CREATE DATABASE IF NOT EXISTS BDVENTAPRODUCTOS DEFAULT CHARACTER SET utf8 ;
USE BDVENTAPRODUCTOS;

-- -----------------------------------------------------
-- Table Proveedor
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Proveedor (
  idProveedor INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre      VARCHAR(45)  NOT NULL,
  nif         VARCHAR(12)  NOT NULL UNIQUE,
  direccion   VARCHAR(100) NOT NULL,
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto (
  idProducto      INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre          VARCHAR(45)   NOT NULL,
  precio_unitario DECIMAL(13,2) NOT NULL,
  idProveedor     INT           NOT NULL,
  CONSTRAINT fk_Producto_Proveedor
    FOREIGN KEY (idProveedor) REFERENCES Proveedor (idProveedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Cliente (
  idCliente        INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre           VARCHAR(30)  NOT NULL,
  apellidos        VARCHAR(50)  NOT NULL,
  direccion        VARCHAR(100) NOT NULL,
  dni              CHAR(9)      NOT NULL UNIQUE,
  fecha_nacimiento DATE         NOT NULL
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Producto_has_Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto_has_Cliente (
  idProducto INT NOT NULL,
  idCliente  INT NOT NULL,
             PRIMARY KEY (idProducto, idCliente),
  CONSTRAINT fk_Producto_has_ClienteProducto1
    FOREIGN KEY (idProducto)
    REFERENCES Producto (idProducto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Producto_has_ClienteProducto2
    FOREIGN KEY (idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB ;

-- -------
-- DATOS
----------

INSERT INTO Proveedor(nombre, nif, direccion) VALUES
('Miguel', '41341234N', 'Av. Ejercico 123'), -- 1
('Carlos', '31431343A', 'Calle America 434'); -- 2

INSERT INTO Producto(nombre, precio_unitario, idProveedor) VALUES
('Cuaderno',1.5,1), -- 1
('Lapiz',1.2,1), -- 2
('Tajador',0.5,1), -- 3
('Papel A4',4,2), -- 4
('Porta Minas',2.1,2); -- 5

INSERT INTO Cliente(nombre,apellidos,dni,fecha_nacimiento) VALUES
('Gerson','Rabanal Alva','41234124A','2000-01-01'), -- 1
('Arturo','Cubas Roncal','99549594B','1998-02-19'), -- 2
('María','Rodriguez Jauregui','45674435C','1999-11-23'); -- 3

INSERT INTO Producto_has_Cliente(idProducto,idCliente) VALUES
(1,1),(1,2),        -- Cuaderno(1)  : Gerson(1), Arturo(2)
(2,1),(2,3),        -- Lapiz(2)     : Gerson(1), María(3)
(3,1),(3,2),(3,3),  -- Tajador(3)   : Gerson(1), Arturo(2), María(3)
(4,3),              -- Papel(4)     : María(3)
(5,2);              -- PortaMinas(5): Arturo(2)









