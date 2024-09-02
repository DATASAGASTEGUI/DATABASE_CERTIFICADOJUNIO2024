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
  direccion   VARCHAR(100) NOT NULL
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
)ENGINE = InnoDB;