
SELECT a.nombre, asi.descripcion
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
WHERE a.idAlumno = 2;

SELECT asi.descripcion, a.nombre
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
WHERE a.idAsignatura = 3;

SELECT asi.descripcion, a.nombre
FROM alumno a
JOIN alumno_has_asignatura ag ON a.idAlumno = ag.idAlumno
JOIN asignatura asi ON asi.idAsignatura = ag.idAsignatura
ORDER BY asi.descripcion;


