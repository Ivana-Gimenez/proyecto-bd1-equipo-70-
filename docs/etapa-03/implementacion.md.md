# **Pruebas y Validaciones de la Base de Datos**

En esta etapa se realizan diferentes pruebas para comprobar que la base de datos funciona correctamente y que las **restricciones de integridad** definidas impiden ingresar o modificar datos incorrectos.

Las pruebas permiten verificar tanto los casos en los que el sistema **debe generar un error**, como aquellos en los que la operación **debe realizarse correctamente**.

---

## **1\. Pruebas de restricciones — Resultado esperado: ERROR**

Estas pruebas buscan comprobar que la base de datos rechaza operaciones que no cumplen con las reglas establecidas.

### **Prueba 1.1: Ingreso de un DNI duplicado — `UNIQUE`**

INSERT INTO Cliente (id\_cliente, dni, nombre\_apellido)   
VALUES (11, '35111222', 'Pedro duplicado');

**Explicación:**  
 Se intenta registrar un nuevo cliente utilizando un DNI que ya existe en la tabla `Cliente`.

El campo `dni` posee una restricción `UNIQUE`, por lo tanto, **no se permiten dos clientes con el mismo DNI**.

**Resultado esperado:**  
 La base de datos debe rechazar la operación y mostrar un error de clave única.

---

### **Prueba 1.2: Ingreso de stock negativo — `CHECK`**

INSERT INTO Prenda   
(cod\_prenda, tipo\_prenda, stock, precio\_unitario, cod\_talle, cod\_color, id\_categoria)   
VALUES (200, 'Remera', \-5, 10000.00, 1, 1, 1);

**Explicación:**  
 Se intenta ingresar una prenda con un stock de `-5`.

La base de datos tiene una restricción `CHECK` que establece que el stock debe ser un valor válido, por ejemplo, **mayor o igual a cero**.

**Resultado esperado:**  
 La operación debe ser rechazada porque no es posible tener una cantidad de stock negativa.

---

### **Prueba 1.3: Estado de venta incorrecto — `CHECK`**

INSERT INTO Cabecera\_Venta   
(id\_venta, fecha, total, estado, id\_cliente)   
VALUES (99, NOW(), 5000.00, 'entregado', 1);

**Explicación:**  
 Se intenta registrar una venta utilizando el estado `'entregado'`.

Si la restricción `CHECK` solamente permite determinados estados, como por ejemplo `pendiente`, `pagado` o `cancelado`, el valor `'entregado'` no será aceptado.

**Resultado esperado:**  
 La base de datos debe generar un error porque el estado ingresado no pertenece a los valores permitidos.

---

### **Prueba 1.4: Eliminación de una prenda relacionada — `RESTRICT`**

DELETE FROM Prenda   
WHERE cod\_prenda \= 101;

**Explicación:**  
 Se intenta eliminar una prenda que ya se encuentra relacionada con registros de ventas.

La restricción `RESTRICT` evita eliminar el registro principal cuando existen otros registros que dependen de él.

Esto permite mantener la **integridad referencial** de la base de datos.

**Resultado esperado:**  
 La eliminación debe ser rechazada para evitar que queden ventas haciendo referencia a una prenda que ya no existe.

---

# **2\. Pruebas de funcionamiento correcto y acciones en cascada**

En estas pruebas se verifica que determinadas operaciones se ejecuten correctamente y que las relaciones entre las tablas se actualicen automáticamente cuando corresponde.

### **Prueba 2.1: Modificación de una clave — `UPDATE CASCADE`**

UPDATE Talle   
SET cod\_talle \= 100   
WHERE cod\_talle \= 1;

Luego se realiza una consulta para comprobar el resultado:

SELECT cod\_prenda, tipo\_prenda, cod\_talle   
FROM Prenda   
WHERE cod\_talle \= 100;

**Explicación:**  
 Se modifica el código de un talle, pasando de `1` a `100`.

Como las prendas están relacionadas con la tabla `Talle` mediante una **clave foránea**, la opción `UPDATE CASCADE` permite que el cambio se propague automáticamente a las tablas relacionadas.

**Resultado esperado:**  
 Las prendas que anteriormente tenían `cod_talle = 1` deben pasar automáticamente a tener `cod_talle = 100`.

---

### **Prueba 2.2: Eliminación en cascada — `DELETE CASCADE`**

DELETE FROM Cabecera\_Venta   
WHERE id\_venta \= 1;

Luego se verifica si permanece el detalle:

SELECT \*   
FROM Detalle\_Venta   
WHERE id\_venta \= 1;

**Explicación:**  
 Se elimina una venta de la tabla `Cabecera_Venta`.

Como la tabla `Detalle_Venta` depende de esa venta y la relación está configurada con `DELETE CASCADE`, los detalles correspondientes se eliminan automáticamente.

Esto evita que queden **detalles de venta sin una cabecera asociada**.

**Resultado esperado:**  
 La consulta sobre `Detalle_Venta` debe devolver **0 filas**, demostrando que los registros relacionados fueron eliminados automáticamente.

---

## **Conclusión**

Las pruebas permiten comprobar que la base de datos **controla correctamente la información ingresada** y mantiene la integridad de las relaciones entre las tablas.

En particular, se verificó:

* `UNIQUE`: evita datos duplicados.  
* `CHECK`: impide valores no permitidos.  
* `RESTRICT`: evita eliminar información que tiene registros relacionados.  
* `UPDATE CASCADE`: actualiza automáticamente las claves relacionadas.  
* `DELETE CASCADE`: elimina automáticamente los registros dependientes.

De esta manera, las pruebas demuestran que las restricciones implementadas cumplen con las reglas definidas para el funcionamiento de la base de datos.

\-- 1\. POBLADO DE LA TABLA PRODUCTOS (10 Registros)  
INSERT INTO PRODUCTOS (descripcion, categoria, talle, color, precio\_unitario, stock) VALUES  
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

\-- 2\. POBLADO DE LA TABLA CLIENTES (10 Registros)  
INSERT INTO CLIENTES (nombre, apellido, dni, email, celular, provincia, localidad, barrio, codigo\_postal) VALUES  
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

\-- 3\. POBLADO DE LA TABLA PROVEEDORES (10 Registros)  
INSERT INTO PROVEEDORES (cuit, nombre, sitio\_web, condiciones\_de\_pago, email, telefono, id\_producto) VALUES  
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

\-- 4\. POBLADO DE LA TABLA COMPRA (10 Registros)  
INSERT INTO COMPRA (metodo\_pago, precio\_total, estado\_de\_compra, fecha, id\_cliente, id\_producto) VALUES  
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

\-- 5\. TABLA COLOR  
INSERT INTO COLOR (cod\_color, descripcion) VALUES  
(1, 'Negro'),  
(2, 'Blanco'),  
(3, 'Azul Oscuro'),  
(4, 'Rojo'),  
(5, 'Gris'),  
(6, 'Verde Militar'),  
(7, 'Bordo'),  
(8, 'Amarillo');

\-- 6\. TABLA METODO DE PAGO  
INSERT INTO Metodo\_Pago (cod\_metodo\_pago, descripcion) VALUES  
(1, 'Efectivo'),  
(2, 'Tarjeta de Débito'),  
(3, 'Tarjeta de Crédito'),  
(4, 'Transferencia bancaria'),  
(5, 'Mercado Pago'),  
(6, 'MODO'),  
(7, 'QR'),  
(8, 'Tarjeta Naranja');

\--7. TABLA CATEGORIA  
INSERT INTO Categoria (id\_categoria, descripcion) VALUES  
(128, 'Remeras'),  
(231, 'Pantalones'),  
(322, 'Buzos'),  
(456, 'Camisas'),  
(512, 'Camperas'),  
(688, 'Vestidos'),  
(799, 'Trajes de Baño'),  
(809, 'Swetears');  
