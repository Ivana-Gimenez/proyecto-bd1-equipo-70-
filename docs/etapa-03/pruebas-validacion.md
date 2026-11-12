# Pruebas y Validaciones de la Base de Datos

En este documento se ejecutan scripts de prueba diseñados para comprobar que el motor de base de datos aplica correctamente las restricciones de integridad definidas.

## 1. Pruebas de Violación de Restricciones (Comportamiento Esperado: ERROR)

### Prueba 1.1: Inserción de un DNI duplicado (`UNIQUE`)

```sql
-- Error esperado: Violación de la restricción UNIQUE sobre dni.
INSERT INTO Cliente (id_cliente, dni, nombre_apellido)
VALUES (11, '35111222', 'Pedro duplicado');
```

### Prueba 1.2: Inserción de stock negativo (`CHECK`)

```sql
-- Error esperado: Violación de CHECK sobre stock.
INSERT INTO Prenda
(cod_prenda, tipo_prenda, stock, precio_unitario, cod_talle, cod_color, id_categoria)
VALUES (200, 'Remera', -5, 10000.00, 1, 1, 1);
```

### Prueba 1.3: Asignación de un estado inexistente (`FOREIGN KEY`)

```sql
-- Error esperado: Violación de clave foránea sobre cod_estado.
INSERT INTO Cabecera_Venta
(id_venta, fecha, total, id_cliente, cod_estado)
VALUES (99, GETDATE(), 5000.00, 1, 999);
```

### Prueba 1.4: Intento de borrado con restricción (`RESTRICT`)

```sql
-- Error esperado: No se puede borrar una prenda que posee ventas registradas.
DELETE FROM Prenda
WHERE cod_prenda = 101;
```

## 2. Pruebas de Funcionamiento Correcto y Cascada

### Prueba 2.1: Modificación de clave con propagación (`UPDATE CASCADE`)

```sql
-- Modificamos el código de un talle existente.
UPDATE Talle
SET cod_talle = 100
WHERE cod_talle = 1;

-- Verificación: Las prendas asociadas ahora referencian al talle 100.
SELECT cod_prenda, tipo_prenda, cod_talle
FROM Prenda
WHERE cod_talle = 100;
```

### Prueba 2.2: Eliminación en Cascada (`DELETE CASCADE`)

```sql
-- Eliminamos la venta con id_venta = 1.
DELETE FROM Cabecera_Venta
WHERE id_venta = 1;

-- Verificación: Comprobamos si el detalle asociado también se eliminó.
SELECT *
FROM Detalle_Venta
WHERE id_venta = 1;

-- Resultado esperado: 0 filas retornadas.
```
