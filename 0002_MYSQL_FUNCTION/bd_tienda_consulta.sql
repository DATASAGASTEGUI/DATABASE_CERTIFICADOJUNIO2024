-- MOSTRAR CUANTAS COMPRAS A REALIZADO POR "JUAN PEREZ"

SELECT c.nombre, COUNT(*) AS cantidad
FROM Cliente c
JOIN Compra co ON c.idCliente = co.idCliente
WHERE c.nombre = 'JUAN PEREZ';

-- MOSTRAR EL CLIENTE CON EL MAYOR NUMERO DE COMPRAS

SELECT c.nombre, COUNT(*) AS cantidad
FROM Cliente c
JOIN Compra co ON c.idCliente = co.idCliente
GROUP BY c.nombre
HAVING cantidad = (SELECT COUNT(*) AS cantidad
FROM Cliente c
JOIN Compra co ON c.idCliente = co.idCliente
GROUP BY c.nombre
ORDER BY cantidad DESC
LIMIT 1);


SELECT c.nombre, COUNT(*) AS cantidad
FROM Cliente c
JOIN Compra co ON c.idCliente = co.idCliente
GROUP BY c.nombre
HAVING cantidad = obtener_maximo_numero_compras();



-- CREAR UNA FUNCION QUE CALCULE Y RETORNE EL MAXIMO NUMERO DE COMPRAS DE UN CLIENTE

DROP FUNCTION IF EXISTS obtener_maximo_numero_compras;
DELIMITER $$
CREATE FUNCTION obtener_maximo_numero_compras() RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE MAXIMO INT;
   
   SELECT COUNT(*) AS cantidad INTO MAXIMO
   FROM Cliente c
   JOIN Compra co ON c.idCliente = co.idCliente
   GROUP BY c.nombre
   ORDER BY cantidad DESC
   LIMIT 1;
   
   RETURN MAXIMO;

END$$
DELIMITER ;

-- PROCEDURE QUE MUESTRE TODOS LOS CLIENTES CON EL MAYOR NUMERO DE COMPRAS

DROP PROCEDURE IF EXISTS mostrar_todos_clientes_maximo_compras;
DELIMITER $$
CREATE PROCEDURE mostrar_todos_clientes_maximo_compras()
BEGIN
   SELECT c.nombre, COUNT(*) AS cantidad
   FROM Cliente c
   JOIN Compra co ON c.idCliente = co.idCliente
   GROUP BY c.nombre
   HAVING cantidad = obtener_maximo_numero_compras();
END$$
DELIMITER ;

-- HACER UNA FUNCION QUE RETORNE EL NOMBRE DEL ARTICULO MAS CARO

-- (1) QUERY

--
SELECT nombre 
FROM Articulo
WHERE precio = (SELECT precio 
FROM Articulo
ORDER BY precio DESC
LIMIT 1);
--
SELECT nombre 
FROM Articulo
WHERE precio = (SELECT MAX(Precio) FROM Articulo);

-- PROBANDO QUE RETORNE EL MAYOR PRECIO
SELECT precio 
FROM Articulo
ORDER BY precio DESC
LIMIT 1;

DE OTRA MANERA

SELECT MAX(Precio) FROM Articulo;

-- (1) CREAR FUNCTION
DROP FUNCTION IF EXISTS obtener_nombre_articulo_mas_caro;
DELIMITER $$
CREATE FUNCTION obtener_nombre_articulo_mas_caro() RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
   DECLARE descripcion VARCHAR(40);
   SELECT nombre INTO descripcion FROM Articulo WHERE precio = (SELECT MAX(Precio) FROM Articulo);
   RETURN descripcion;
END$$
DELIMITER ;
-- (2) LLAMAR FUNCTION
SELECT obtener_nombre_articulo_mas_caro();

-- HACER UNA FUNCION QUE RETORNE EL TOTAL EN DINERO QUE HA GASTADO
-- EN TODO SU HISTORIAL DE COMPRAS DE UN CLIENTE DADO.
-- (1) CREAR FUNCTION
DROP FUNCTION IF EXISTS obtener_total_gastado_cliente;
DELIMITER $$
CREATE FUNCTION obtener_total_gastado_cliente(idCliente_i INT) RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE total DOUBLE;
	SELECT SUM(co.cantidad*a.precio) INTO total
	FROM Cliente c
	JOIN Compra co ON c.idCliente = co.idCliente
	JOIN Articulo a ON a.idArticulo = co.idArticulo
	WHERE c.idCliente = idCliente_i;
    RETURN total;
END$$
DELIMITER ;
-- (2) LLAMAR FUNCTION
SELECT obtener_total_gastado_cliente(5);

-- HACER UN PROCEDURE QUE UTILICE LA FUNCION ANTERIOR PARA
-- MOSTRAR EL CLIENTE QUE HA REALIZADO EL MAYOR GASTO

-- (1) CREAR PROCEDURE

DROP PROCEDURE IF EXISTS mostrar_cliente_mayor_gasto_total;
DELIMITER $$
CREATE PROCEDURE mostrar_cliente_mayor_gasto_total()
BEGIN
     DECLARE maximo DOUBLE DEFAULT 0;
	 DECLARE total DOUBLE DEFAULT 0;
     DECLARE i INT DEFAULT 1;
     DECLARE idClienteMaximo INT DEFAULT 0;
     DECLARE n INT DEFAULT 0;
     SELECT COUNT(*) INTO n FROM Cliente;
     WHILE i <= n DO
        SELECT obtener_total_gastado_cliente(i) INTO total;
	    IF total > maximo THEN
           SET maximo = total;
           SET idClienteMaximo = i;
		END IF;
        SET i = i + 1;
     END WHILE;
     SELECT nombre, maximo FROM Cliente WHERE idCliente = idClienteMaximo;
END$$
DELIMITER ;
-- (2) LLAMAR PROCEDURE
CALL mostrar_cliente_mayor_gasto_total();


















