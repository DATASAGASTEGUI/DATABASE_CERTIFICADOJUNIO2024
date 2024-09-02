-- CONSULTAS

-- MOSTRAR LOS EMPLEADOS POR DEPARTAMENTO
--   PADRE: DEPARTAMENTO
   HIJOS: EMPLEADOS
   
SELECT d.descripcion, e.nombre 
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
ORDER BY  d.descripcion;

-- MOSTRAR LA CANTIDAD DE EMPLEADOS POR CADA DEPARTAMENTO

SELECT d.descripcion, COUNT(e.nombre)
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
ORDER BY  d.descripcion;

SELECT d.descripcion, COUNT(e.nombre) AS CANTIDAD
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
ORDER BY CANTIDAD DESC;

-- MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO PROFESORES

SELECT d.descripcion, COUNT(e.nombre) AS CANTIDAD
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
ORDER BY CANTIDAD DESC
WHERE idDepartamento = 2;

-- MOSTRAR EN QUE DEPARTAMENTO TRABAJA JOSEFA

SELECT d.idDepartamento
FROM Departamento d
JOIN Empleado e ON d.idDepartamento = e.idDepartamento
WHERE e.nombre = 'Josefa';


SELECT d.descripcion
FROM Depatamento d
WHERE d.idDepartamento = (3);


SELECT d.descripcion
FROM Departamento d
WHERE d.idDepartamento = (SELECT d.idDepartamento
FROM Departamento d
JOIN Empleado e ON d.idDepartamento = e.idDepartamento
WHERE e.nombre = 'Josefa');

-- MOSTRAR EL DEPARTAMENTO QUE TIENE MAS AMPLEADOS

SELECT d.descripcion, COUNT(e.nombre) AS CANTIDAD
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
ORDER BY CANTIDAD DESC;

SELECT d.descripcion, COUNT(e.nombre) AS CANTIDAD
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
HAVING CANTIDAD = (SELECT COUNT(e.nombre) AS CANTIDAD
FROM Departamento d 
JOIN Empleado e ON d.idDepartamento = e.idDepartamento 
GROUP BY d.descripcion
ORDER BY CANTIDAD DESC
LIMIT 1);




SELECT * FROM Departamento;
SELECT * FROM Empleado;

DELETE FROM Departamento WHERE idDepartamento = 1;


-- 1 PASO
ALTER TABLE Empleado 
MODIFY idDepartamento INT NULL;
-- 2 PASO: ELIMINAR CLAVE FORANEA
ALTER TABLE Empleado
DROP FOREIGN KEY fk_Departamento_Empleado;
-- 3 PASO: CREAR CLAVE FORANEA CON LA NUEVA CONFIGURACION
ALTER TABLE Empleado
ADD CONSTRAINT fk_Departamento_Empleado FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
ON DELETE SET NULL;








