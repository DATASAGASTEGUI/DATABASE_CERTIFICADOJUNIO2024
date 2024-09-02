-- CREAR TRIGGER

DROP TRIGGER IF EXISTS after_insert_cliente;
DELIMITER $$
CREATE TRIGGER after_insert_cliente
AFTER INSERT ON Cliente
FOR EACH ROW
BEGIN
    IF obtener_rango_descripcion(NEW.ingresos) = 'Alto'  THEN
       INSERT INTO IngresosAlto(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
    IF obtener_rango_descripcion(NEW.ingresos) = 'Bajo' THEN
       INSERT INTO IngresosBajo(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
    IF obtener_rango_descripcion(NEW.ingresos) = 'Medio' THEN
       INSERT INTO IngresosMedio(id_cliente, ingresos) VALUES (NEW.id_cliente,NEW.ingresos);
	END IF;
END$$
DELIMITER ;

-- CREAR FUNCTION

DROP FUNCTION IF EXISTS obtener_rango_descripcion;
DELIMITER $$
CREATE FUNCTION obtener_rango_descripcion(ingresos_i DECIMAL(10,2)) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE tipo_ingresos VARCHAR(10) DEFAULT '';
    SET tipo_ingresos = CASE
        WHEN ingresos_i < 50000 THEN 'Bajo'
		WHEN ingresos_i >= 50000 AND ingresos_i <= 80000 THEN 'Medio'
        WHEN ingresos_i > 80000 THEN 'Alto'
    END;
    return tipo_ingresos;
END$$
DELIMITER ;

-- LAZAR TRIGGER

SELECT * FROM Cliente;
SELECT * FROM IngresosAlto;

DESCRIBE CLIENTE;

INSERT INTO Cliente (id_cliente,nombre,edad,ingresos,historial_compras) VALUES (13, 'Gerson', 28, 100000, 5);