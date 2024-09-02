-- TRIGGER:
-- ACCION: UPDATE, INSERT, DELETE
-- AFTER(DESPUES)  BEFORE(ANTES)

-- EJEMPLO 1: AFTER UPDATE (USUARIO) (*)
--            BEFORE UPDATE

-- EJEMPLO 2: AFTER INSERT
--            BEFORE INSERT (EMPLEADO) (*)

-- EJEMPLO 3: BEFORE INSERT (USUARIO)

-- EJEMPLO 4: AFTER DELETE (USUARIO) ---> REGISTRAR ELIMINACION (BITACORA)

-- CREAR LA BASE DATOS

DROP DATABASE IF EXISTS BDTRIGGER;
CREATE DATABASE BDTRIGGER;
USE BDTRIGGER;

-- CREAR LAS TABLAS

CREATE TABLE Usuario (
    id_usuario     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre         VARCHAR(20) NOT NULL,
    clave          VARCHAR(50) NOT NULL,
    fecha_creacion TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

-- CREAR TABLA AUDITORIA USUARIO

-- Tabla de auditoria que registrará cambios en la tabla usario
CREATE TABLE AUDITORIA_USUARIO (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario      INT,
    accion          VARCHAR(10),
    nombre_anterior VARCHAR(10),
    nombre_nuevo    VARCHAR(10),
    clave_anterior  VARCHAR(50),
    clave_nuevo     VARCHAR(50),
	fecha_accion    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    usuariosistema  VARCHAR(20)
);

CREATE TABLE Empleado (
   id_empleado    INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nombre         VARCHAR(20)   NOT NULL,
   salario        DECIMAL(10,2) NOT NULL
);

DROP TABLE IF EXISTS Eliminaciones;
CREATE TABLE Eliminaciones (
   id                 INT PRIMARY KEY AUTO_INCREMENT, -- NUMERO TRANSACCION
   id_usuario         INT,
   fecha_eliminacion  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   usuario_eliminador VARCHAR(30)
);