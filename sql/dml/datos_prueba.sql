INSERT INTO Proveedor (cuit, nombre, razon_social, telefono) VALUES
('20304445551', 'Textil Argentina S.A.', 'Textil Argentina Sociedad Anónima', '01145551234'),
('27251112224', 'Confecciones del Sur', 'Confecciones del Sur S.R.L.', '01147895522'),
('30712233445', 'Indumentaria Moderna', 'Indumentaria Moderna S.A.', '03514223388'),
('20289998882', 'Hilados del Norte', 'Hilados y Telas S.R.L.', '03814332211'),
('30685554443', 'Telas y Avios SRL', 'Telas y Avios Sociedad de Responsabilidad Limitada', '02234998877'),
('27310001119', 'Moda Mayorista', 'Moda Mayorista S.A.', '01143332211'),
('20241113335', 'Distribuidora Textil Cordoba', 'Distribuidora Cordoba S.R.L.', '03514889966'),
('30718889994', 'Fabrica de Jeans Patagonia', 'Patagonia Denim S.A.', '02944421133'),
('20192223336', 'Tejeduría Central', 'Tejeduría Central S.R.L.', '01141112233'),
('30599988871', 'Insumos Textiles Rosario', 'Insumos Rosario S.A.', '03414556677');

INSERT INTO Cliente (id_cliente, dni, nombre_apellido) VALUES
(1, '35123456', 'Juan Pérez'),
(2, '28987654', 'María Gómez'),
(3, '40111222', 'Carlos López'),
(4, '32444555', 'Ana Martínez'),
(5, '25789123', 'Luis Rodríguez'),
(6, '38999000', 'Sofía Fernández'),
(7, '30555444', 'Diego González'),
(8, '42333222', 'Lucía Díaz'),
(9, '27666777', 'Esteban Romero'),
(10, '36222111', 'Valeria Sánchez');

INSERT INTO Talle (cod_talle, desc_talle) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL'),
(7, '38'),
(8, '40');

INSERT INTO Color (cod_color, descripcion) VALUES
(1, 'Negro'),
(2, 'Blanco'),
(3, 'Azul Marino'),
(4, 'Gris Melange'),
(5, 'Rojo'),
(6, 'Verde Militar'),
(7, 'Beige'),
(8, 'Marrón');

INSERT INTO Categoria (id_categoria, descripcion) VALUES
(1, 'Remeras y Musculosas'),
(2, 'Pantalones y Jeans'),
(3, 'Camperas y Abrigos'),
(4, 'Buzos y Hoodies'),
(5, 'Camisas'),
(6, 'Shorts y Bermudas'),
(7, 'Vestidos'),
(8, 'Sweaters y Pullovers');

INSERT INTO Metodo_Pago (cod_metodo_pago, descripcion) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Tarjeta de Débito'),
(4, 'Mercado Pago'),
(5, 'Transferencia Bancaria'),
(6, 'Cuenta DNI'),
(7, 'BNA+'),
(8, 'Ualá'),
(9, 'Modo'),
(10, 'Criptomoneda');

INSERT INTO Prenda (cod_prenda, tipo_prenda, descripcion, stock, precio_unitario, cod_talle, cod_color, id_categoria) VALUES
(101, 'Remera Básica', 'Remera de algodón manga corta', 50, 15000.00, 3, 1, 1),
(102, 'Jeans Chupín', 'Pantalón jean elástizado tiro medio', 30, 45000.00, 7, 3, 2),
(103, 'Campera de Cuero', 'Campera ecológica forrada', 15, 85000.00, 4, 1, 3),
(104, 'Buzo Oversize', 'Buzo con capucha rústico', 25, 40000.00, 4, 4, 4),
(105, 'Camisa Formal', 'Camisa entallada de vestir', 20, 28000.00, 3, 2, 5),
(106, 'Short Denim', 'Short de jean tiro alto', 40, 22000.00, 2, 3, 6),
(107, 'Vestido Casual', 'Vestido corto estampado', 18, 35000.00, 2, 5, 7),
(108, 'Sweater Lanilla', 'Sweater tejido liviano', 22, 31000.00, 3, 7, 8),
(109, 'Remera Deportiva', 'Remera técnica secado rápido', 60, 18000.00, 5, 2, 1),
(110, 'Pantalón Cargo', 'Pantalón gabardina multibolsillos', 25, 52000.00, 4, 6, 2);

INSERT INTO Cabecera_Venta (id_venta, fecha, total, estado, id_cliente) VALUES
(1, '2026-05-01 10:30:00', 60000.00, 'confirmada', 1),
(2, '2026-05-01 11:15:00', 85000.00, 'confirmada', 2),
(3, '2026-05-02 14:20:00', 40000.00, 'pendiente', 3),
(4, '2026-05-02 16:00:00', 35000.00, 'confirmada', 4),
(5, '2026-05-03 09:45:00', 67000.00, 'confirmada', 5),
(6, '2026-05-03 12:10:00', 22000.00, 'anulada', 6),
(7, '2026-05-04 15:30:00', 103000.00, 'confirmada', 7),
(8, '2026-05-04 17:00:00', 31000.00, 'pendiente', 8),
(9, '2026-05-05 10:00:00', 33000.00, 'confirmada', 9),
(10, '2026-05-05 18:45:00', 52000.00, 'confirmada', 10);

INSERT INTO Cabecera_Compra (id_compra, fecha, total, cuit) VALUES
(1, '2026-04-10 08:00:00', 450000.00, '20304445551'),
(2, '2026-04-12 09:30:00', 320000.00, '27251112224'),
(3, '2026-04-15 10:15:00', 600000.00, '30712233445'),
(4, '2026-04-18 11:00:00', 210000.00, '20289998882'),
(5, '2026-04-20 14:00:00', 380000.00, '30685554443'),
(6, '2026-04-22 15:30:00', 150000.00, '27310001119'),
(7, '2026-04-25 09:00:00', 500000.00, '20241113335'),
(8, '2026-04-27 12:45:00', 420000.00, '30718889994'),
(9, '2026-04-29 16:20:00', 270000.00, '20192223336'),
(10, '2026-05-01 10:00:00', 340000.00, '30599988871');

INSERT INTO Detalle_Venta (id_det_venta, cantidad, precio_unitario, subtotal, id_venta, cod_prenda) VALUES
(1, 1, 15000.00, 15000.00, 1, 101),
(2, 1, 45000.00, 45000.00, 1, 102),
(3, 1, 85000.00, 85000.00, 2, 103),
(4, 1, 40000.00, 40000.00, 3, 104),
(5, 1, 35000.00, 35000.00, 4, 107),
(6, 1, 45000.00, 45000.00, 5, 102),
(7, 1, 22000.00, 22000.00, 5, 106),
(8, 1, 22000.00, 22000.00, 6, 106),
(9, 2, 18000.00, 36000.00, 7, 109),
(10, 1, 67000.00, 67000.00, 7, 103);

INSERT INTO Venta_Metodo_Pago (id_venta, cod_metodo_pago, importe) VALUES
(1, 2, 60000.00),
(2, 4, 85000.00),
(3, 1, 40000.00),
(4, 3, 35000.00),
(5, 4, 67000.00),
(6, 1, 22000.00),
(7, 2, 103000.00),
(8, 5, 31000.00),
(9, 6, 33000.00),
(10, 4, 52000.00);

INSERT INTO Detalle_Compra (id_det_compra, cantidad, precio_unitario, subtotal, id_compra, cod_prenda) VALUES
(1, 20, 10000.00, 200000.00, 1, 101),
(2, 10, 25000.00, 250000.00, 1, 102),
(3, 5, 50000.00, 250000.00, 2, 103),
(4, 3, 23333.33, 70000.00, 2, 105),
(5, 15, 24000.00, 360000.00, 3, 104),
(6, 10, 14000.00, 140000.00, 3, 109),
(7, 10, 21000.00, 210000.00, 4, 108),
(8, 12, 18000.00, 216000.00, 5, 106),
(9, 8, 20450.00, 163600.00, 5, 110),
(10, 10, 15000.00, 150000.00, 6, 101);
