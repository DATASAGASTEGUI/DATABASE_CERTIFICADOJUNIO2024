-- MOSTRAR LOS PRODUCTOS(HIJO) POR CADA PROVEEDOR(PADRE)

SELECT pv.nombre, pr.nombre
FROM Proveedor pv
JOIN Producto pr ON pv.idProveedor = pr.idProveedor;

-- MOSTRAR TODOS LOS CLIENTES(HIJOS) QUE COMPRARON PRODUCTO(PADRE)CUADERNO

SELECT pr.nombre, c.nombre
FROM Producto pr
JOIN Producto_has_Cliente pc ON pr.idProducto = pc.idProducto
JOIN Cliente c ON c.idCliente = pc.idCliente;
