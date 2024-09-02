-- ---------
-- CONSULTAS
-- ---------

-- MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

\dt

-- MOSTRAR LA DEFINICION(ESTRUCTURA) DE UNA TABLA

\d Producto

-- CONSULTAR DATOS JSON

-- 1. Obtener todos los productos y detalles:

SELECT * FROM Producto;

-- 2. Consultar un campo específico del JSON (marca) de todos los productos:

SELECT nombre, detalles->>'marca' AS marca FROM Producto;

-- 3. Consultar una subclave dentro del JSON (ram de especificaciones para el producto Laptop):

SELECT nombre, detalles->'especificaciones'->>'ram' AS ram
FROM Producto
WHERE nombre = 'Laptop';

-- 4. Filtrar productos por un valor en el JSON (por ejemplo, productos cuyo precio sea mayor a 1000):

SELECT nombre, detalles->>'precio' AS precio
FROM Producto
WHERE (detalles->>'precio')::int > 1000;

-- ACTUALIZAR UN CAMPO EN EL JSON

-- 1. Supongamos que queremos actualizar el precio del iPhone 13:

UPDATE Producto
SET detalles = jsonb_set(detalles, '{precio}', '1099')
WHERE nombre = 'Smartphone' AND detalles->>'modelo' = 'iPhone 13';

-- 2. Supongamos que queremos añadir una nueva clave descuento para el producto Tablet:

UPDATE Producto
SET detalles = jsonb_set(detalles, '{descuento}', '50', true)
WHERE nombre = 'Tablet';

UPDATE Producto
SET detalles = jsonb_set(detalles, '{descuento}', '50', true);

-- 3. Si queremos eliminar la clave especificaciones del producto Laptop:

UPDATE Producto
SET detalles = detalles - 'especificaciones'
WHERE nombre = 'Laptop';

-- ELIMINAR UN REGISTRO COMPLETO

-- 1. Eliminemos el producto Smartphone de la tabla:

DELETE FROM Producto
WHERE nombre = 'Smartphone';










-- NOTAS
-- 1. Utilizamos jsonb (que es una versión optimizada de json para mejorar el rendimiento en consultas).

