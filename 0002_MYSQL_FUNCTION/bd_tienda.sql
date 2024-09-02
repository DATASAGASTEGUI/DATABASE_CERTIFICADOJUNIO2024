-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------

-- 1. BORRAR UNA BASE DE DATOS SI ESTA EXISTE

DROP DATABASE IF EXISTS TIENDA;

-- 2. CREAR UNA BASE DE DATOS

CREATE DATABASE IF NOT EXISTS TIENDA;

-- 3. USAR UNA BASE DE DATOS

USE TIENDA;

-- 4. CREAR UNA TABLA

DROP TABLE IF EXISTS Articulo;

CREATE TABLE Articulo (
    idArticulo  INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100)  NOT NULL,
    descripcion TEXT          NOT NULL,
    precio      DECIMAL(10,2) NOT NULL,
    stock       INT           NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Cliente (
    idCliente INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    nombre    VARCHAR(100) NOT NULL,              
    email     VARCHAR(100) NOT NULL,               
    telefono  VARCHAR(15)  NOT NULL            
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Compra ( 
    idCompra     INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idCliente    INT  NOT NULL,
    idArticulo   INT  NOT NULL,
    cantidad     INT  NOT NULL,
    fecha_compra DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idArticulo) REFERENCES Articulo(idArticulo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----
-- DATOS
-- -----
					  
-- 5. INSERTAR REGISTROS A UNA TABLA

INSERT INTO Articulo (nombre, descripcion, precio, stock) VALUES
('Laptop', 'Laptop de alta gama con procesador Intel i7', 1200.00, 10),
('Smartphone', 'Smartphone con cámara de 48 MP y pantalla OLED', 700.00, 15),
('Teclado Mecánico', 'Teclado RGB para gaming con switches mecánicos', 150.00, 20),
('Monitor 4K', 'Monitor 4K de 27 pulgadas con HDR', 500.00, 8),
('Ratón Inalámbrico', 'Ratón inalámbrico para gaming con sensor óptico', 60.00, 50),
('Auriculares Bluetooth', 'Auriculares Bluetooth con cancelación de ruido', 120.00, 30),
('Cámara DSLR', 'Cámara DSLR con lente de 24 MP', 900.00, 5),
('Tablet', 'Tablet con pantalla de 10 pulgadas y 128GB de almacenamiento', 300.00, 25),
('Impresora Láser', 'Impresora láser a color de alta velocidad', 200.00, 12),
('Disco Duro Externo', 'Disco duro externo de 2TB', 100.00, 40),
('Router Wi-Fi 6', 'Router Wi-Fi 6 con tecnología mesh', 180.00, 18),
('Smartwatch', 'Smartwatch con monitor de actividad física y GPS', 250.00, 22),
('Memoria USB', 'Memoria USB de 64GB', 25.00, 100),
('Tarjeta Gráfica', 'Tarjeta gráfica NVIDIA RTX 3080', 1500.00, 6),
('Silla Gamer', 'Silla ergonómica para gaming con soporte lumbar', 220.00, 10),
('Smart TV', 'Smart TV de 55 pulgadas con resolución 4K', 800.00, 7),
('Micrófono USB', 'Micrófono USB para streaming y podcasting', 90.00, 35),
('Consola de Videojuegos', 'Consola de videojuegos de nueva generación', 500.00, 14),
('Cargador Portátil', 'Cargador portátil de 10000mAh', 40.00, 80),
('Altavoz Bluetooth', 'Altavoz Bluetooth resistente al agua', 150.00, 25);

INSERT INTO Cliente (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '555-1234'),
('Maria García', 'maria.garcia@example.com', '555-5678'),
('Carlos Martínez', 'carlos.martinez@example.com', '555-8765'),
('Lucia Fernández', 'lucia.fernandez@example.com', '555-4321'),
('Andrés Ramírez', 'andres.ramirez@example.com', '555-6543'),
('Sofía López', 'sofia.lopez@example.com', '555-9876'),
('Pedro Jiménez', 'pedro.jimenez@example.com', '555-3456'),
('Laura Torres', 'laura.torres@example.com', '555-7654');

INSERT INTO Compra (idCliente, idArticulo, cantidad, fecha_compra) VALUES
(1, 1, 2, '2023-09-01'),
(2, 2, 1, '2023-09-02'),
(3, 3, 3, '2023-09-03'),
(4, 4, 1, '2023-09-04'),
(5, 5, 4, '2023-09-05'),
(6, 6, 1, '2023-09-06'),
(7, 7, 2, '2023-09-07'),
(8, 8, 5, '2023-09-08'),
(1, 9, 3, '2023-09-09'),
(2, 10, 2, '2023-09-10'),
(3, 11, 1, '2023-09-11'),
(4, 12, 4, '2023-09-12'),
(5, 13, 2, '2023-09-13'),
(6, 14, 3, '2023-09-14'),
(7, 15, 1, '2023-09-15'),
(8, 16, 5, '2023-09-16'),
(1, 17, 2, '2023-09-17'),
(2, 18, 3, '2023-09-18'),
(3, 19, 1, '2023-09-19'),
(4, 20, 4, '2023-09-20'),
(5, 1, 1, '2023-09-21'),
(6, 2, 4, '2023-09-22'),
(7, 3, 2, '2023-09-23'),
(8, 4, 3, '2023-09-24'),
(1, 5, 5, '2023-09-25'),
(2, 6, 1, '2023-09-26'),
(3, 7, 3, '2023-09-27'),
(4, 8, 2, '2023-09-28'),
(5, 9, 4, '2023-09-29'),
(6, 10, 3, '2023-09-30'),
(7, 11, 1, '2023-10-01'),
(8, 12, 5, '2023-10-02'),
(1, 13, 2, '2023-10-03'),
(2, 14, 3, '2023-10-04'),
(3, 15, 1, '2023-10-05'),
(4, 16, 4, '2023-10-06'),
(5, 17, 2, '2023-10-07'),
(6, 18, 5, '2023-10-08'),
(7, 19, 1, '2023-10-09'),
(8, 20, 3, '2023-10-10'),
(1, 1, 4, '2023-10-11'),
(2, 2, 1, '2023-10-12'),
(3, 3, 5, '2023-10-13'),
(4, 4, 2, '2023-10-14'),
(5, 5, 3, '2023-10-15'),
(6, 6, 1, '2023-10-16'),
(7, 7, 4, '2023-10-17'),
(8, 8, 5, '2023-10-18'),
(1, 9, 2, '2023-10-19'),
(2, 10, 3, '2023-10-20'),
(3, 11, 4, '2023-10-21'),
(4, 12, 5, '2023-10-22'),
(5, 13, 2, '2023-10-23'),
(6, 14, 1, '2023-10-24'),
(7, 15, 5, '2023-10-25'),
(8, 16, 2, '2023-10-26'),
(1, 17, 3, '2023-10-27'),
(2, 18, 4, '2023-10-28'),
(3, 19, 1, '2023-10-29'),
(4, 20, 5, '2023-10-30'),
(5, 1, 2, '2023-10-31'),
(6, 2, 1, '2023-11-01'),
(7, 3, 4, '2023-11-02'),
(8, 4, 5, '2023-11-03'),
(1, 5, 3, '2023-11-04'),
(2, 6, 2, '2023-11-05'),
(3, 7, 5, '2023-11-06'),
(4, 8, 1, '2023-11-07'),
(5, 9, 4, '2023-11-08'),
(6, 10, 5, '2023-11-09'),
(7, 11, 2, '2023-11-10'),
(8, 12, 1, '2023-11-11'),
(1, 13, 4, '2023-11-12'),
(2, 14, 5, '2023-11-13'),
(3, 15, 2, '2023-11-14'),
(4, 16, 1, '2023-11-15'),
(5, 17, 3, '2023-11-16'),
(6, 18, 5, '2023-11-17'),
(7, 19, 1, '2023-11-18'),
(8, 20, 4, '2023-11-19'),
(1, 1, 3, '2023-11-20'),
(2, 2, 1, '2023-11-21'),
(3, 3, 2, '2023-11-22'),
(4, 4, 5, '2023-11-23'),
(5, 5, 4, '2023-11-24'),
(6, 6, 1, '2023-11-25'),
(7, 7, 3, '2023-11-26'),
(8, 8, 2, '2023-11-27'),
(1, 9, 4, '2023-11-28'),
(2, 10, 5, '2023-11-29'),
(3, 11, 3, '2023-11-30'),
(4, 12, 2, '2023-12-01'),

(1, 1, 2, '2024-01-01'),
(1, 2, 3, '2024-02-05'),
(1, 3, 1, '2024-03-10'),
(1, 2, 2, '2024-04-10'),
(1, 1, 2, '2024-05-01'),
(1, 2, 3, '2024-06-05'),
(1, 3, 1, '2024-07-10'),
(1, 2, 2, '2024-08-12'),

(6, 1, 2, '2024-01-01'),
(6, 2, 3, '2024-02-05'),
(6, 3, 1, '2024-03-10'),
(6, 2, 2, '2024-04-10'),
(6, 1, 2, '2024-05-01'),
(6, 2, 3, '2024-06-05'),
(6, 3, 1, '2024-07-10'),
(6, 2, 2, '2024-08-12'),
(6, 2, 2, '2024-08-13');