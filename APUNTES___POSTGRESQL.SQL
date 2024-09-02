-- CREAR TABLA
DROP TABLE IF EXISTS Empleado;
CREATE TABLE IF NOT EXISTS Empleado (
   idEmpleado     SERIAL        PRIMARY KEY,
   nombre         VARCHAR(20)   NOT NULL,
   edad           INT           NOT NULL,
   estatura       NUMERIC(10,2) NOT NULL,
   casado         BOOLEAN       NOT NULL,
   sexo           CHAR(1)       NOT NULL,
   nacimiento     DATE          NOT NULL
);
-- INSERTAR REGISTRAR
INSERT INTO Empleado(nombre,edad,estatura,casado,sexo,nacimiento) VALUES
('Luis',23,1.72,TRUE,'H','2000-01-01'),
('Carmen',23,1.52,FALSE,'M','2000-02-02');
-- MOSTRAR TODOS LOS REGISTROS
SELECT * FROM Empleado;