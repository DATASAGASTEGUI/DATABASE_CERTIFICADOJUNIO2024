-- EVENTOS: INSERT UPDATE DELETE
-- MONTOS : BEFORE(ANTES), AFTER(DESPUES)

-- COMBINACIONES POSIBLES (EVENTOS Y MOMENTOS)

-- BEFORE INSERT  EJEMPLO 2, 3   NEW          ESPECIE VALIDACION (EVITAR INSERT)
-- BEFORE UPDATE                 NEW, OLD     ESPECIE VALIDACION (EVITAR UPDATE)
-- BEFORE DELETE                 OLD          ESPECIE VALIDACION (EVITAR DELETE)

-- AFTER INSERT                  NEW          AUDITORIA
-- AFTER UPDATE   EJEMPLO 1      NEW, OLD     AUDITORIA 
-- AFTER DELETE   EJEMPLO 4      OLD          AUDITORIA

--  CREAR BASE DE DATOS

DROP DATABASE IF EXISTS BDTRIGGER;
CREATE DATABASE BDTRIGGER;
USE BDTRIGGER;

-- CREAR LAS TABLAS

CREATE TABLE Usuario(
	id_usuario     INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre         VARCHAR(20) NOT NULL,
    clave          VARCHAR(50) NOT NULL,
    fecha_creacion TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CREAR TABLA AUDITORIA USUARIO 
-- Tabla de auditoria que registrará cambios en la tabla usuario
CREATE TABLE AUDITORIA_USUARIO (
	id               INT       PRIMARY KEY AUTO_INCREMENT,
    id_usuario       INT,
    accion           VARCHAR(10),
    nombre_anterior  VARCHAR(10),
    nombre_nuevo     VARCHAR(10),
    clave_anterior   VARCHAR(50),
    clave_nueva      VARCHAR(50),
    fecha_accion     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    usuariosistema   VARCHAR(20)
);

-- INSERTAR REGISTROS A LA TABLA

INSERT INTO Usuario (nombre,clave) VALUES 
('Luis','12345678'),
('Pablo','87654321'),
('Maria','kjds.bvj'),
('Pedro','esuvbvsd'),
('Karla','12345432');

INSERT INTO Usuario (nombre,clave) VALUES ('Miguel','abcdefgh');
INSERT INTO Usuario (nombre,clave) VALUES ('Mery','sev<hjc');
INSERT INTO Usuario (nombre,clave) VALUES ('Samuel','ks<vjbd');

SELECT * FROM Usuario;
-- TRIGGER:
-- ACCION: UPDATE, INSERT, DELETE
-- AFTER(DESPUES) BEFORE(ANTES)

-- EJEMPLO 1 : AFTER UPDATE(*) 

-- CREAR UN TREEGGER QUE REGISTRE LOS CAMBIOS(UPDATE)
DROP TRIGGER IF EXISTS trigger_auditoria_usuario;
DELIMITER $$
CREATE TRIGGER trigger_auditoria_usuario
AFTER UPDATE ON usuario 
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_usuario(
    id_usuario,
    accion,
    nombre_anterior,
    nombre_nuevo,
    clave_anterior,
    clave_nueva,
    usuariosistema
    ) VALUES (
		OLD.id_usuario,
        'UPDATE',
        OLD.nombre,
        NEW.nombre,
        OLD.clave,
        NEW.clave,
        USER()
    );
END $$
DELIMITER ;

-- LANZAR EL TRIGGER

-- Actualizar un usuario 
UPDATE usuario SET nombre = 'Luis Jr', clave = 'XYZ' WHERE id_usuario = 1;

SELECT * FROM auditoria_usuario;

-- EJEMPLO 2 : BEFORE INSERT (*) hacemos este
CREATE TABLE Empleado (
	idEmpleado INT           PRIMARY KEY AUTO_INCREMENT,
    nombre     VARCHAR(20)   NOT NULL,
    salario    DECIMAL(10,2) NOT NULL
);
DROP TRIGGER IF EXISTS before_insert_sueldo_negativo;
DELIMITER $$
CREATE TRIGGER before_insert_sueldo_negativo
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
	IF NEW.salario < 0 THEN
       SET NEW.salario = 0;
	END IF;
END $$
DELIMITER ;

-- LANZAR EL TRIGGER 

INSERT INTO Empleado (nombre, salario) VALUES ('Gerson',2000);
INSERT INTO Empleado (nombre, salario) VALUES ('Enrique',-2000);

SELECT * FROM Empleado;

-- EJEMPLO 3 : BEFORE INSERT (*) hacemos este SOBRE USUARIO
-- EJEMPLO 3 : TRIGGER INSERT SOBRE USUARIO(DETECTE CLAVE 12345678 Y LO COMO VACIO)

DROP TRIGGER IF EXISTS before_insert_clave_no_permitida;
DELIMITER $$
CREATE TRIGGER before_insert_clave_no_permitida
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
   IF NEW.clave = '12345678' THEN
	  SET NEW.clave = '';
   END IF;
END $$
DELIMITER ;

-- LANZAR EL TRIGGER

INSERT INTO Usuario (nombre,clave) VALUES ('Sebastian','12345678');

SELECT * FROM Usuario;

-- EJEMPLO 4 : AFTER DELETE (USUARIO) --------> REGISTRAR ELIMINACIÓN (BITACORA)
DROP TRIGGER IF EXISTS eliminacion_usuario;
DELIMITER $$
CREATE TRIGGER eliminacion_usuario
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN 
	INSERT INTO Eliminaciones (id_usuario,usuario_eliminador) VALUES 
    (OLD.id_usuario, USER());
	END $$
DELIMITER ;

-- crear tabla eliminaciones
DROP TABLE IF EXISTS Eliminaciones;
CREATE TABLE Eliminaciones (
	id                 INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario         INT,
    fecha_eliminacion  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_eliminador VARCHAR(30)
);

-- LANZAR TRIGGER
DELETE FROM Usuario WHERE id_usuario = 1;

SELECT * FROM Eliminaciones;