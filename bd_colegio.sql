-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------

DROP DATABASE IF EXISTS COLEGIO;
CREATE DATABASE COLEGIO;
USE COLEGIO;

CREATE TABLE IF NOT EXISTS ALUMNO (
  idAlumno INT         AUTO_INCREMENT,
  nombre   VARCHAR(30) NOT NULL,
           PRIMARY KEY (idAlumno)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ASIGNATURA (
  idAsignatura INT         AUTO_INCREMENT,
  descripcion  VARCHAR(45) NOT NULL,
  creditos     INT         NOT NULL,
               PRIMARY KEY (idAsignatura)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ALUMNO_has_ASIGNATURA (
  idAlumno     INT NOT NULL,
  idAsignatura INT NOT NULL,
               PRIMARY KEY (idAlumno, idAsignatura),
			   
               FOREIGN KEY (idAlumno) REFERENCES ALUMNO (idAlumno) 
			   ON DELETE NO ACTION 
			   ON UPDATE NO ACTION,
  
               FOREIGN KEY (idAsignatura) REFERENCES ASIGNATURA (idAsignatura)
               ON DELETE NO ACTION
               ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- -----
-- DATOS
-- -----

INSERT INTO ALUMNO (idAlumno, nombre) VALUES(NULL, 'Ismael'); -- 1

INSERT INTO ALUMNO (nombre) VALUES('Luis'); -- 2

INSERT INTO ALUMNO (nombre) VALUES
('Gerson'), -- 3
('Miguel'), -- 4
('María'); -- 5

INSERT INTO ASIGNATURA (descripcion,creditos) VALUES
('Matemática',5), -- 1
('Física',6), -- 2
('Religión',4); -- 3

INSERT INTO ALUMNO_has_ASIGNATURA (idAlumno, idAsignatura) VALUES
(1,1),(1,3),
(2,1),(2,2),(2,3),
(3,2),
(4,2),(4,3),
(5,1),(5,2),(5,3);
