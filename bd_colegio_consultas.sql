-- MOSTRAR LAS ASIGNATURAS DE LUIS(2)
   PADRE  ALUMNO      LUIS
   HIJO   ASIGNATURA  MATEMATICA FISICA RELIGION

SELECT a.nombre, asi.descripcion
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
WHERE a.idAlumno = 2;

-- MOSTRAR LOS ALUMNOS MATRICULADOS EN RELIGION(3)

   PADRE: RELIGION
   HIJOS: ISMAEL LUIS MIGUEL GERSON MARIA
   
SELECT asi.descripcion, a.nombre
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
WHERE a.idAsignatura = 3;

-- MOSTRAR TODOS LOS ALUMNOS MATRICULADOS POR CADA ASIGNATURA

SELECT asi.descripcion, a.nombre
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
ORDER BY asi.descripcion;
