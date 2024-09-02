-- PROCEDURE = PROCESO = CONJUNTOS INSTRUCCIONES SQL
-- OBTENER LA FECHA DE NACIMIENTO DEL ALUMNO
DELIMITER //
CREATE PROCEDURE obtener_fecha_nacimiento(IN idAlumno_i INT, OUT fecha_nacimiento_o DATE)
BEGIN
	-- CUERPO DEL PROCEDURE
    DECLARE id_v INT;
    -- SET id_v = idAlumno_i;
    -- CONSULTA
    SELECT fecha_nacimiento INTO fecha_nacimiento_o FROM Alumno WHERE idAlumno = idAlumno_i;
END //
DELIMITER ;

-- LLAMAR AL PROCEDURE 
SET @fecha_nacimiento = '';
CALL obtener_fecha_nacimiento(1, @fecha_nacimiento);
SELECT @fecha_nacimiento;

DROP PROCEDURE obtener_fecha_nacimiento;

-- CREAR UN PROCEDURE PARA SUMAR DOS NUMEROS.
DROP PROCEDURE IF EXISTS sumar_dos_numeros;
DELIMITER $$
CREATE PROCEDURE sumar_dos_numeros(IN n1_i INT, IN n2_i INT)
BEGIN
	DECLARE suma_v INT;
	SET suma_v = n1_i + n2_i;
    SELECT suma_v;
END $$
DELIMITER ;

-- LLAMAR AL PROCEDURE
CALL sumar_dos_numeros(5,9);

-- MODIFICAR EL PROCEDURE DE LA SUMA CON RETORNO

DROP PROCEDURE IF EXISTS sumar_dos_numeros_1;
DELIMITER $$
CREATE PROCEDURE sumar_dos_numeros_1(IN n1_i INT, IN n2_i INT, OUT suma_o INT)
BEGIN
	SET suma_o = n1_i + n2_i;
END $$
DELIMITER ;

-- LLAMAR AL PROCEDURE

SET @suma = '';
CALL sumar_dos_numeros_1(5,8,@suma);
SELECT @suma AS SUMA;
SELECT CONCAT('Suma de dos numeros:',@suma) AS RESULTADO;

-- USAR UN CONDICIONAL EN UN PROCEDURE
-- CREAR UN PROCEDURE PARA EVALUAL UN NUMERO POSITIVO O NEGATIVO

DROP PROCEDURE IF EXISTS evaluar_numero;
DELIMITER $$
CREATE PROCEDURE evaluar_numero(IN numero INT, OUT mensaje VARCHAR(100))
BEGIN
	IF numero > 0 THEN
		SET mensaje = CONCAT('El numero', numero, ' es positivo');
	ELSE
		SET mensaje = CONCAT('El numero', numero, ' es negativo');
	END IF;
END $$
DELIMITER ;
-- LLAMAR AL PROCEDURE
SET @mensaje = '';
CALL evaluar_numero(-23, @mensaje);
SELECT @mensaje AS Resultado;

-- CREAR UN PROCEDURE QUE GENERE UNA SERIE 1...N
-- DONDE N SE LE PASA COMO PARAMETRO DE ENTRADA
-- N=3 1 2 3 SUMA= 6
DROP PROCEDURE IF EXISTS mostrar_serie;
DELIMITER $$
CREATE PROCEDURE mostrar_serie(IN n INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <=n DO -- VERDADERO ENTRA EN EL BUCLE
		SELECT i;
        SET i = i + 1;
	END WHILE;
END $$
DELIMITER ;
-- LLAMAR AL PROCEDURE
CALL mostrar_serie(5);

DROP PROCEDURE IF EXISTS mostrar_serie_1;
DELIMITER $$
CREATE PROCEDURE mostrar_serie_1(IN n INT, OUT sumaSerie INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE suma INT DEFAULT 0;
    DECLARE salida VARCHAR(50) DEFAULT '';
	WHILE i <=n DO -- VERDADERO ENTRA EN EL BUCLE
		-- SELECT i;
        SET salida = CONCAT(salida,CONCAT(i,' ')); -- salida = salida + 1
        SET suma = suma + i; 
        SET i = i + 1;
	END WHILE;
    SET sumaSerie = suma;
    SELECT salida;
END $$
DELIMITER ;
-- LLAMAR AL PROCEDURE
SET @sumaSerie = '';
CALL mostrar_serie_1(10, @sumaSerie);
SELECT @sumaSerie;

-- PROCEDURE SIN PARAMENTROS DE ENTRADA Y SALIDA
DROP PROCEDURE IF EXISTS mostrar_serie_2;
DELIMITER $$
CREATE PROCEDURE mostrar_serie_2()
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <= 5 DO -- VERDADERO ENTRA EN EL BUCLE
		SELECT i;
        SET i = i + 1;
	END WHILE;
END $$
DELIMITER ;
-- LLAMAR AL PROCEDURE
CALL mostrar_serie_2();

-- HACER UN PROCEDURE CALCULADORA IN(5 6  +,*,-,/ OUT resultado
DROP PROCEDURE IF EXISTS calculadora;
DELIMITER $$
CREATE PROCEDURE calculadora(IN n1 INT,IN n2 INT,IN operacion CHAR(1),OUT resultado DOUBLE)
BEGIN
	SET resultado = CASE
		WHEN operacion = '+' THEN n1 + n2
        WHEN operacion = '-' THEN n1 - n2
        WHEN operacion = '*' THEN n1 * n2
        WHEN operacion = '/' THEN 
         CASE
          WHEN n2 <> 0 THEN
			n1 / n2
		  ELSE
            NULL
		 END
		WHEN operacion = '^' THEN POW(n1,n2)
	END;
END $$
DELIMITER ;
-- LLAMAR AL PROCEDURE
CALL calculadora(2,3,'^',@resultado);
SELECT @resultado;


DROP PROCEDURE IF EXISTS ejemplo_cursor;
DELIMITER $$
CREATE PROCEDURE ejemplo_cursor()
BEGIN
    DECLARE v_id        INT;
    DECLARE v_nombre    VARCHAR(25);
    DECLARE v_apellidos VARCHAR(50);

    -- 1. DECLARAR LA BANDERA FINALIZAR CURSOR
    DECLARE done INT DEFAULT FALSE;
    
    -- 2. CREAR Y LLENAR EL CURSOR
	DECLARE alumno_cursor CURSOR FOR 
		SELECT idAlumno, nombre, apellidos FROM Alumno WHERE grupo = 'dam';
        
	-- 3. MANEJO DE EXCEEPCION DEL CURSOR 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
      
	-- 4. CREAR TABLA TAMPORAL PARA SU USO CON EL CURSOR
	DROP TABLE IF EXISTS TAlumnoDam;
	CREATE TABLE TAlumnoDam(
		idAlumno  INT         NOT NULL PRIMARY KEY,
		nombre    VARCHAR(25) NOT NULL,
		apellidos VARCHAR(50) NOT NULL
    );
    
    -- 5. ABRIR CURSOR
    OPEN alumno_cursor;
    
    -- 6. RECORRER CURSOR
    leer_bucle: LOOP
                   FETCH alumno_cursor INTO v_id, v_nombre, v_apellidos;
    
                   IF done THEN
                      LEAVE leer_bucle;
				   END IF;
                   
                   INSERT INTO TAlumnoDam(idAlumno,nombre,apellidos) VALUES (v_id, v_nombre, v_apellidos);
                END LOOP;
                
	-- 7. CERRAR CURSOR
    CLOSE alumno_cursor;
END $$
DELIMITER ;
-- LLAMAR PROCEDURE
CALL ejemplo_cursor();
SELECT * FROM TAlumnoDam;

-- -----------------------------------------------------------------------------
-- 1. CREAR UN PROCEDURE QUE MUESTRE LA CANTIDAD DE ALUMNOS POR CADA GRUPO
-- -----------------------------------------------------------------------------
-- 1.1 CREAR PROCEDURE
DROP PROCEDURE IF EXISTS mostrar_cantidad_alumnos_por_grupo;
DELIMITER $$
CREATE PROCEDURE mostrar_cantidad_alumnos_por_grupo()
BEGIN
  SELECT grupo, COUNT(*) AS cantidad
  FROM Alumno
  GROUP BY grupo;
END$$
DELIMITER ;
-- 1.2 LLAMAR PROCEDURE
CALL mostrar_cantidad_alumnos_por_grupo();

-- -----------------------------------------------------------------------------
-- 2. CREAR UN PROCEDURE QUE CREE UNA TABLA TEMPORARL PARA GUARDAR EL RESULTADO
--    DEL PROCEDURE 1 ANTERIOR
-- -----------------------------------------------------------------------------



-- 3. PROCEDURE QUE MUESTRA TODOS LOS REGISTROS DE LA TABLA ALUMNO
DROP PROCEDURE IF EXISTS insertar_alumno;
DELIMITER $$
CREATE PROCEDURE insertar_alumno(
    IN nombre_i           VARCHAR(10),
    IN apellidos_i        VARCHAR(40),
    IN grupo_i            CHAR(3),
    IN fecha_nacimiento_i DATE
)
BEGIN
   INSERT INTO Alumno(nombre,apellidos,grupo,fecha_nacimiento) VALUES
   (nombre_i, apellidos_i, grupo_i, fecha_nacimiento_i);
END$$
DELIMITER ;

CALL insertar_alumno('Delly','Alva Cuba','dam','2000-10-15');
SELECT * FROM Alumno;

DROP PROCEDURE IF EXISTS actualizar_grupo_nuevo;
DELIMITER $$
CREATE PROCEDURE actualizar_grupo_nuevo()
BEGIN
    UPDATE Alumno
    SET grupo = CASE
                   WHEN fecha_nacimiento > '2020-01-01' THEN 'Nuevo'
                   ELSE grupo
				END;
END$$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;

CALL actualizar_grupo_nuevo();
SELECT * FROM Alumno;

SET SQL_SAFE_UPDATES = 1;

-- PROCEDURE QUE MUESTRE TODOS LOS ALUMNOS DONDE AÑADIRA UN CAMPO
-- QUE DIRA SI ES DAM = "DESARROLLO APLICACIONES MULTIMEDIA" Y SI
-- ES DAW = "DESARROLLO APLICACIONES WEB"

DROP PROCEDURE IF EXISTS mostrar_descripcion_grupo;
DELIMITER $$
CREATE PROCEDURE mostrar_descripcion_grupo()
BEGIN
  SELECT nombre,
		 grupo, 
         CASE
            WHEN grupo = 'dam' THEN 'Desarrollo Aplicaciones Multimedia'
            WHEN grupo = 'daw' THEN 'Desarrollo Aplicaciones Web'
            WHEN grupo = 'Nuevo' THEN ''
         END AS Descripcion 
  FROM ALUMNO;
END$$
DELIMITER ;

CALL mostrar_descripcion_grupo();

SELECT * FROM ALUMNO;













