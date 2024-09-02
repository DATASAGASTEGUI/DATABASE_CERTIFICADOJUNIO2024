-- ---------
-- CONSULTAS
-- ---------

-- ELIMINAR UN PADRE MIGUEL

SELECT * FROM Empleado;
DELETE FROM Empleado WHERE idEmpleado = 1;


A partir del siguiente enunciado se desea realiza el
modelo entidad-relación. (ER) 
Una empresa vende productos a varios clientes. 
Se necesita conocer los datos personales  de  los  clientes
nombre,  apellidos,  dni,  dirección  y  fecha  de nacimiento).   
Cada  producto  tiene  un  nombre  y  un  código,  así  como  un
precio  unitario.  Un cliente puede comprar varios productos a
la empresa, y un mismo producto puede ser comprado por varios clientes.  
Los  productos  son  suministrados  por  diferentes  proveedores.
Se  debe  tener  en cuenta que un producto sólo puede ser
suministrado por un proveedor, y que un proveedor  puede  suministrar 
diferentes  productos.  De  cada  proveedor  se  desea conocer
el NIF, nombre y dirección. 

