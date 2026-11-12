-- 1. ACTIVA ESTADISTICAS DE EJECUCION
-- Permite observar las lecturas y los tiempos de ejecucion.

SET STATISTICS IO ON;
SET STATISTICS TIME ON;


-- 2. CONSULTAS ANTES DE CREAR LOS INDICES
-- Se utilizan para obtener los valores iniciales y comparar posteriormente el rendimiento.
-- Consulta de ventas por estado y periodo.

SELECT
    cv.id_venta,
    cv.fecha,
    e.descripcion AS Estado,
    dv.cod_prenda,
    dv.cantidad,
    dv.subtotal
FROM Cabecera_Venta cv
INNER JOIN Estado e
    ON cv.cod_estado = e.cod_estado
INNER JOIN Detalle_Venta dv
    ON cv.id_venta = dv.id_venta
WHERE e.descripcion = 'Confirmada'
  AND cv.fecha >= '2026-05-01'
  AND cv.fecha < '2026-06-01';


-- Consulta de compras por periodo.

SELECT
    cc.id_compra,
    cc.fecha,
    dc.cod_prenda,
    dc.cantidad
FROM Cabecera_Compra cc
INNER JOIN Detalle_Compra dc
    ON cc.id_compra = dc.id_compra
WHERE cc.fecha >= '2026-05-01'
  AND cc.fecha < '2026-06-01';


-- 3. CREACION DE INDICES NONCLUSTERED
-- Se crean indices para optimizar los filtros y las uniones.

-- Indice para ventas por estado y fecha.

CREATE NONCLUSTERED INDEX IX_Cabecera_Venta_Estado_Fecha
ON Cabecera_Venta(cod_estado, fecha)
INCLUDE (id_venta);

-- Indice para buscar detalles por venta.

CREATE NONCLUSTERED INDEX IX_Detalle_Venta_IdVenta
ON Detalle_Venta(id_venta)
INCLUDE (cod_prenda, cantidad, subtotal);

-- Indice para consultar compras por fecha.

CREATE NONCLUSTERED INDEX IX_Cabecera_Compra_Fecha
ON Cabecera_Compra(fecha)
INCLUDE (id_compra);

-- Indice para buscar detalles por compra.

CREATE NONCLUSTERED INDEX IX_Detalle_Compra_IdCompra
ON Detalle_Compra(id_compra)
INCLUDE (cod_prenda, cantidad);


-- 4. REPETIR LAS CONSULTAS DESPUES DE CREAR LOS INDICES
-- Permite comparar las lecturas y los tiempos de ejecucion.


-- Consulta de ventas.

SELECT
    cv.id_venta,
    cv.fecha,
    e.descripcion AS Estado,
    dv.cod_prenda,
    dv.cantidad,
    dv.subtotal
FROM Cabecera_Venta cv
INNER JOIN Estado e
    ON cv.cod_estado = e.cod_estado
INNER JOIN Detalle_Venta dv
    ON cv.id_venta = dv.id_venta
WHERE e.descripcion = 'Confirmada'
  AND cv.fecha >= '2026-05-01'
  AND cv.fecha < '2026-06-01';


-- Consulta de compras.

SELECT
    cc.id_compra,
    cc.fecha,
    dc.cod_prenda,
    dc.cantidad
FROM Cabecera_Compra cc
INNER JOIN Detalle_Compra dc
    ON cc.id_compra = dc.id_compra
WHERE cc.fecha >= '2026-05-01'
  AND cc.fecha < '2026-06-01';


-- 5. CONSULTAR LOS INDICES CREADOS

SELECT
    name AS NombreIndice,
    OBJECT_NAME(object_id) AS Tabla
FROM sys.indexes
WHERE name LIKE 'IX_%';


-- 6. DESACTIVAR ESTADISTICAS

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
