****************
***   0001   ***
****************

-- (1) CREAR PROCEDURE

USE CAMPUSFP;
DROP PROCEDURE IF EXISTS mostrar_serie_1;
DELIMITER $$
CREATE PROCEDURE mostrar_serie_1(IN n INT, OUT sumaSerie_o INT, OUT salidaSerie_o VARCHAR(50))
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE sumaSerie INT DEFAULT 0;
    DECLARE salidaSerie VARCHAR(50) DEFAULT '';
    SET salidaSerie = '';
    WHILE i <= n DO
        SET salidaSerie = CONCAT(salidaSerie, CONCAT(i, ' '));
        SET sumaSerie = sumaSerie + i;
        SET i = i + 1;
    END WHILE;
    SET sumaSerie_o = sumaSerie;
    SET salidaSerie_o = salidaSerie;
    SELECT idAlumno,nombre FROM Alumno;
END$$
DELIMITER ;

-- (2) LLAMAR PROCEDURE

CALL mostrar_serie_1(10,@sumaSerie_o,@salidaSerie_o);
SELECT @sumaSerie_o,@salidaSerie_o;
