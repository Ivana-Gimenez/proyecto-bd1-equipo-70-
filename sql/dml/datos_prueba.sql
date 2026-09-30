
-- 1. POBLADO DE LA TABLA PRODUCTOS (10 Registros)
INSERT INTO PRODUCTOS (descripcion, categoria, talle, color, precio_unitario, stock) VALUES
('Remera Manga Corta Básica', 'Remeras', 'M', 'Negro', 12500.00, 50),
('Jeans Slim Fit', 'Pantalones', '42', 'Azul Oscuro', 35000.00, 30),
('Camisa Formal Algodón', 'Camisas', 'L', 'Blanco', 28000.00, 20),
('Buzo Oversize con Capucha', 'Buzos', 'XL', 'Gris', 42000.00, 15),
('Campera de Abrigo', 'Camperas', 'L', 'Verde Militar', 75000.00, 10),
('Chomba Piqué', 'Remeras', 'S', 'Azul Marino', 18500.00, 25),
('Pantalón Jogger Deportivo', 'Pantalones', 'M', 'Negro', 26000.00, 40),
('Sweater Tejido Lana', 'Sweaters', 'M', 'Bordo', 33000.00, 18),
('Vestido Casual Verano', 'Vestidos', 'S', 'Rojo', 29000.00, 12),
('Short de Baño estampado', 'Trajes de baño', 'L', 'Amarillo', 15000.00, 35);

-- 2. POBLADO DE LA TABLA CLIENTES (10 Registros)
INSERT INTO CLIENTES (nombre, apellido, dni, email, celular, provincia, localidad, barrio, codigo_postal) VALUES
('Juan', 'Pérez', '38123456', 'juan.perez@email.com', '1134567890', 'Buenos Aires', 'CABA', 'Palermo', '1425'),
('María', 'Gómez', '40234567', 'maria.gomez@email.com', '1145678901', 'Buenos Aires', 'La Plata', 'Centro', '1900'),
('Carlos', 'López', '35345678', 'carlos.lopez@email.com', '3515678902', 'Córdoba', 'Córdoba Cap.', 'Nueva Córdoba', '5000'),
('Ana', 'Martínez', '42456789', 'ana.martinez@email.com', '3416789012', 'Santa Fe', 'Rosario', 'Pichincha', '2000'),
('Lucas', 'Rodríguez', '39567890', 'lucas.rod@email.com', '2617890123', 'Mendoza', 'Mendoza', 'Godoy Cruz', '5501'),
('Sofía', 'Fernández', '41678901', 'sofia.fer@email.com', '3794890123', 'Corrientes', 'Corrientes', 'Centro', '3400'),
('Diego', 'Sánchez', '37789012', 'diego.s@email.com', '3815901234', 'Tucumán', 'San Miguel', 'Yerba Buena', '4107'),
('Lucía', 'Romero', '43890123', 'lucia.romero@email.com', '2996012345', 'Neuquén', 'Neuquén', 'Alta Barda', '8300'),
('Gabriel', 'Torres', '36901234', 'gabriel.t@email.com', '2237012345', 'Buenos Aires', 'Mar del Plata', 'Güemes', '7600'),
('Elena', 'Benítez', '44012345', 'elena.b@email.com', '3628012345', 'Chaco', 'Resistencia', 'Sarmiento', '3500');

-- 3. POBLADO DE LA TABLA PROVEEDORES (10 Registros)
INSERT INTO PROVEEDORES (cuit, nombre, sitio_web, condiciones_de_pago, email, telefono, id_producto) VALUES
('30-11223344-5', 'Textil Argentina S.A.', 'www.textilarg.com', '30 días netos', 'contacto@textilarg.com', '1140001111', 1),
('30-22334455-6', 'Indumentaria del Sur', 'www.indumentariasur.com', 'Contado', 'ventas@indumentariasur.com', '1140002222', 2),
('30-33445566-7', 'Confecciones Moda S.R.L.', 'www.confeccionesmoda.com', '50% anticipado, 50% entrega', 'info@confeccionesmoda.com', '3514003333', 3),
('30-44556677-8', 'Distribuidora Textil Baires', 'www.textilbaires.com', '60 días cheques', 'ventas@textilbaires.com', '1140004444', 4),
('30-55667788-9', 'Abrigos & Co.', 'www.abrigosco.com', '30 días netos', 'compras@abrigosco.com', '2614005555', 5),
('30-66778899-0', 'Telas y Diseños S.A.', 'www.telasydisenos.com', 'Contado', 'contacto@telasydisenos.com', '3414006666', 6),
('30-77889900-1', 'Sportwear Proveedores', 'www.sportwearprov.com', '15 días netos', 'info@sportwearprov.com', '1140007777', 7),
('30-88990011-2', 'Hilados del Norte', 'www.hiladosnorte.com', '30 días netos', 'ventas@hiladosnorte.com', '3814008888', 8),
('30-99001122-3', 'Moda Verano S.R.L.', 'www.modaverano.com', 'Contado', 'contacto@modaverano.com', '3794009999', 9),
('30-10111213-4', 'Malla & Playa Fabrica', 'www.mallayplaya.com', '30/60 días', 'ventas@mallayplaya.com', '2234000000', 10);

-- 4. POBLADO DE LA TABLA COMPRA (10 Registros)
INSERT INTO COMPRA (metodo_pago, precio_total, estado_de_compra, fecha, id_cliente, id_producto) VALUES
('Efectivo',           12500.00, 'Confirmada', '2026-03-01 10:30:00', 1, 1),
('Tarjeta de Débito',  35000.00, 'Confirmada', '2026-03-02 11:15:00', 2, 2),
('Tarjeta de Crédito', 28000.00, 'Confirmada', '2026-03-03 16:45:00', 3, 3),
('Transferencia',      42000.00, 'Pendiente',  '2026-03-04 18:20:00', 4, 4),
('Billetera Virtual',  75000.00, 'Confirmada', '2026-03-05 09:00:00', 5, 5),
('Efectivo',           18500.00, 'Anulada',    '2026-03-06 14:10:00', 6, 6),
('Tarjeta de Débito',  26000.00, 'Confirmada', '2026-03-07 12:00:00', 7, 7),
('Tarjeta de Crédito', 33000.00, 'Confirmada', '2026-03-08 17:30:00', 8, 8),
('Transferencia',      29000.00, 'Pendiente',  '2026-03-09 19:40:00', 9, 9),
('Billetera Virtual',  15000.00, 'Confirmada', '2026-03-10 11:05:00', 10, 10);