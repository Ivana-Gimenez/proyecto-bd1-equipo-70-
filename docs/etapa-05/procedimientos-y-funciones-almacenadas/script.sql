-- 1. Función: Calcular el total de una venta

CREATE FUNCTION dbo.fn_CalcularTotalVenta
(
    @id_venta INT
)
RETURNS DECIMAL(18,2)
AS
    RETURN (
        SELECT SUM(dv.cantidad * dv.precio_unitario)
        FROM Detalle_Venta dv
        WHERE dv.id_venta = @id_venta
    );

-- 2. Procedimiento: Consultar compras por color

CREATE PROCEDURE dbo.sp_ConsultarComprasPorColor
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        co.descripcion AS color,
        SUM(dc.cantidad) AS total_prendas_compradas
    FROM Cabecera_Compra cc
    INNER JOIN Detalle_Compra dc ON cc.id_compra = dc.id_compra
    INNER JOIN Prenda p ON dc.cod_prenda = p.cod_prenda
    INNER JOIN Color co ON p.cod_color = co.cod_color
    WHERE cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY co.descripcion
    HAVING SUM(dc.cantidad) > 10;

-- 3. Procedimiento: Consultar compras de un proveedor por período

CREATE PROCEDURE dbo.sp_ConsultarComprasProveedorPorPeriodo
    @cuit VARCHAR(20),
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        p.nombre AS Nombre,
        SUM(cc.total) AS Total
    FROM Cabecera_Compra cc
    INNER JOIN Proveedor p ON cc.cuit = p.cuit
    WHERE p.cuit = @cuit
      AND cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY p.cuit, p.nombre;

-- 4. Procedimiento: Consultar prendas más vendidas por temporada

CREATE PROCEDURE dbo.sp_ConsultarPrendasVendidasPorTemporada
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        p.tipo_prenda AS Prenda,
        SUM(dv.cantidad) AS TotalUnidadesVendidas
    FROM Cabecera_Venta cv
    INNER JOIN Detalle_Venta dv ON cv.id_venta = dv.id_venta
    INNER JOIN Prenda p ON dv.cod_prenda = p.cod_prenda
    WHERE cv.fecha >= @fecha_desde
      AND cv.fecha < DATEADD(DAY, 1, @fecha_hasta)
      AND cv.estado = 'confirmada'
    GROUP BY p.tipo_prenda;
