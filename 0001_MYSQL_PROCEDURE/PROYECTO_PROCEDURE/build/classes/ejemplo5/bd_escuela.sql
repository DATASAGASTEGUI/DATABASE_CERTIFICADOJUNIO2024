-- -----------------------------------------------------
-- Schema BDESCUELA
-- -----------------------------------------------------
DROP DATABASE IF EXISTS BDESCUELA;
CREATE SCHEMA IF NOT EXISTS BDESCUELA DEFAULT CHARACTER SET utf8 ;
USE BDESCUELA ;

-- -----------------------------------------------------
-- Table BDESCUELA.profesor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS profesor (
  DNI INT               NOT NULL PRIMARY KEY,
  nombre VARCHAR(45)    NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  teléfono INT          NOT NULL
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.modulo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS modulo (
  código INT         NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.grupo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS grupo (
  alumnos INT NOT NULL PRIMARY KEY
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS curso (
  delegado INT      NOT NULL,
  grupo_alumnos INT NOT NULL,
  modulo_código INT NOT NULL,
  PRIMARY KEY (delegado, grupo_alumnos),
  CONSTRAINT fk_curso_grupo1
    FOREIGN KEY (grupo_alumnos)
    REFERENCES BDESCUELA.grupo (alumnos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_curso_modulo1
    FOREIGN KEY (modulo_código)
    REFERENCES BDESCUELA.modulo (código)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.alumno
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alumno (
  n_de_expediente INT    NOT NULL PRIMARY KEY,
  nombre VARCHAR(45)      NOT NULL,
  apellidos VARCHAR(45)   NOT NULL,
  fecha_nacimiento DATE   NOT NULL,
  curso_delegado INT      NOT NULL,
  grupo_alumnos INT       NOT NULL,
  CONSTRAINT fk_alumno_curso1
    FOREIGN KEY (curso_delegado)
    REFERENCES curso (delegado)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_alumno_grupo1
    FOREIGN KEY (grupo_alumnos)
    REFERENCES grupo (alumnos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.alumno_has_modulo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alumno_has_modulo (
  alumno_n_de_expediente INT  NOT NULL,
  modulo_código INT           NOT NULL,
  PRIMARY KEY (alumno_n_de_expediente, modulo_código),
  CONSTRAINT fk_alumno_has_modulo_alumno1
    FOREIGN KEY (alumno_n_de_expediente)
    REFERENCES BDESCUELA.alumno (n_de_expediente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_alumno_has_modulo_modulo1
    FOREIGN KEY (modulo_código)
    REFERENCES modulo (código)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BDESCUELA.profesor_has_modulo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS profesor_has_modulo (
  profesor_DNI INT NOT NULL,
  modulo_código INT NOT NULL,
  PRIMARY KEY (profesor_DNI, modulo_código),
  CONSTRAINT fk_profesor_has_modulo_profesor1
    FOREIGN KEY (profesor_DNI)
    REFERENCES profesor (DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_profesor_has_modulo_modulo1
    FOREIGN KEY (modulo_código)
    REFERENCES modulo (código)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- CREAR REGISTROS DE TABLA

INSERT INTO profesor (DNI, nombre, direccion, teléfono) VALUES
(12345678, 'Juan Pérez', 'Calle Falsa 123', 987654321),
(87654321, 'Ana García', 'Av. Siempreviva 742', 912345678);

INSERT INTO modulo (código, nombre) VALUES
(1, 'Matemáticas'),
(2, 'Lengua'),
(3, 'Historia');

INSERT INTO grupo (alumnos) VALUES
(101),
(102),
(103);

INSERT INTO curso (delegado, grupo_alumnos, modulo_código) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 103, 3);

INSERT INTO alumno (n_de_expediente, nombre, apellidos, fecha_nacimiento, curso_delegado, grupo_alumnos) VALUES
(1001, 'Carlos López', 'Fernández', '2002-05-14', 1, 101),
(1002, 'María Rodríguez', 'Sánchez', '2003-08-21', 2, 102),
(1003, 'Luis Martínez', 'Gómez', '2001-12-09', 3, 103);

INSERT INTO alumno_has_modulo (alumno_n_de_expediente, modulo_código) VALUES
(1001, 1),
(1002, 2),
(1003, 3);

INSERT INTO profesor_has_modulo (profesor_DNI, modulo_código) VALUES
(12345678, 1),
(87654321, 2),
(12345678, 3);

-- ---------
-- CONSULTAS
-- ---------
-- 1. CURSOS QUE ENSEÑA UN PROFESOR

SELECT p.nombre AS Profesor, m.nombre AS Modulo, c.delegado, c.grupo_alumnos
FROM profesor p
JOIN profesor_has_modulo phm ON p.DNI = phm.profesor_DNI
JOIN modulo m ON phm.modulo_código = m.código
JOIN curso c ON m.código = c.modulo_código
WHERE p.DNI = 12345678;  -- Aquí pones el DNI del profesor

-- 2. MOSTRAR LOS GRUPOS EXISTEN
SELECT alumnos FROM grupo ;

-- 3. MOSTRAR LOS ALUMNOS MATRICULADOS POR ASIGNATURAS
SELECT a.n_de_expediente AS Expediente, a.nombre AS Nombre, a.apellidos AS Apellidos, m.nombre AS Modulo
FROM alumno a
JOIN alumno_has_modulo ahm ON a.n_de_expediente = ahm.alumno_n_de_expediente
JOIN modulo m ON ahm.modulo_código = m.código ;

-- 4. AUDITORIA PARA VER LOS REGISTROS USUARIOS (CON CUALQUIERA DE LAS TABLAS)
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario(
    DNI             INT         NOT NULL PRIMARY KEY,
    nombre          VARCHAR(20) NOT NULL,
	n_de_expediente INT         NOT NULL,
    fecha_creacion  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Usuario (DNI, nombre, n_de_expediente) 
VALUES (12333678, 'Carlos Pérez', 1004),
       (81114321, 'María Gómez', 1005),
       (11543344, 'Luis Rodríguez', 1006),
       (44334441, 'Ana Martínez', 1007);

-- CREAR TABLA AUDITORIA USUARIO 
-- Tabla de auditoria que registrará cambios en la tabla usuario (EL TRIGGER LO LLENA)
DROP TABLE IF EXISTS AUDITORIA_USUARIO;
CREATE TABLE AUDITORIA_USUARIO (
	DNI                        INT PRIMARY KEY,
    accion                     VARCHAR(10),
    nombre_anterior            VARCHAR(45),
    nombre_nuevo               VARCHAR(45),
    n_de_expediente_anterior   INT,
    n_de_expediente_nuevo      INT,
    fecha_accion     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    usuariosistema   VARCHAR(45)
);

-- CREAR UN TRIGGER QUE REGISTRE LOS CAMBIOS(UPDATE)
DROP TRIGGER IF EXISTS trigger_auditoria_usuario;
DELIMITER $$
CREATE TRIGGER trigger_auditoria_usuario
AFTER UPDATE ON usuario 
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_usuario(
    DNI,
    accion,
    nombre_anterior,
    nombre_nuevo,
    n_de_expediente_anterior,
    n_de_expediente_nuevo,
    usuariosistema
    ) VALUES (
		OLD.DNI,
        'UPDATE',
        OLD.nombre,
        NEW.nombre,
        OLD.n_de_expediente,
        NEW.n_de_expediente,
        USER()
    );
END $$
DELIMITER ;

-- LANZAR EL TRIGGER (SE LANZA CON UPDATE)

UPDATE usuario SET nombre = 'Luis Jr', n_de_expediente = '1001' WHERE DNI = 12333678 ;

-- COMPROBAR EL TRIGGER

SELECT * FROM auditoria_usuario;
SELECT * FROM Usuario;


PARA LA CONSULTA 1, CREAR UN PROCEDURE TENDRA UN PARAMETRO DE ENTRADA
QUE ES EL DNI Y LUEGO SE IMPLEMENTARA EN JAVA PARA MOSTRAR
LAS CONLUMNAS DE LA CONSULTA.

PARA LA CONSULTA 2, CREAR UN PROCEDURE QUE MUESTRE
EN PANTALLA EL RESULTADO

PARA LA CONSULTA 3 CREAR UN PROCEDURE QUE MUESTRE EL RESULTADO

IMPLEMENTAR EL TRIGGER CON JAVA




