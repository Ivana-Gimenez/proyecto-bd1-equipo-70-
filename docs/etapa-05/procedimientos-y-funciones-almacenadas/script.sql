-- 1. Procedimiento: Calcular el total de una venta

CREATE OR ALTER PROCEDURE dbo.sp_CalcularTotalVenta
    @id_venta INT
AS
BEGIN
    SELECT COALESCE(
        SUM(dv.cantidad * dv.precio_unitario), 0
    ) AS TotalVenta
    FROM Detalle_Venta dv
    WHERE dv.id_venta = @id_venta;
END;
GO


-- 2. Procedimiento: Consultar compras por color

CREATE OR ALTER PROCEDURE dbo.sp_ConsultarComprasPorColor
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
BEGIN
    SELECT
        co.descripcion AS Color,
        SUM(dc.cantidad) AS TotalPrendasCompradas
    FROM Cabecera_Compra cc
    INNER JOIN Detalle_Compra dc
        ON cc.id_compra = dc.id_compra
    INNER JOIN Prenda p
        ON dc.cod_prenda = p.cod_prenda
    INNER JOIN Disenno_Color dcol
        ON p.cod_disenno = dcol.cod_disenno
    INNER JOIN Color co
        ON dcol.cod_color = co.cod_Color
    WHERE cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY co.descripcion
    HAVING SUM(dc.cantidad) > 10;
END;
GO


-- 3. Procedimiento: Consultar compras de un proveedor por período

CREATE OR ALTER PROCEDURE dbo.sp_ConsultarComprasProveedorPorPeriodo
    @cuit VARCHAR(11),
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
BEGIN
    SELECT
        p.nombre AS NombreProveedor,
        SUM(cc.total) AS TotalCompras
    FROM Cabecera_Compra cc
    INNER JOIN Proveedor p
        ON cc.cuit = p.cuit
    WHERE p.cuit = @cuit
      AND cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY p.cuit, p.nombre;
END;
GO


-- 4. Procedimiento: Consultar prendas vendidas por período

CREATE OR ALTER PROCEDURE dbo.sp_ConsultarPrendasVendidasPorTemporada
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
BEGIN
    SELECT
        p.descripcion AS Prenda,
        SUM(dv.cantidad) AS TotalUnidadesVendidas
    FROM Cabecera_Venta cv
    INNER JOIN Detalle_Venta dv
        ON cv.id_venta = dv.id_venta
    INNER JOIN Prenda p
        ON dv.cod_prenda = p.cod_prenda
    INNER JOIN Estado e
        ON cv.cod_estado = e.cod_estado
    WHERE cv.fecha >= @fecha_desde
      AND cv.fecha < DATEADD(DAY, 1, @fecha_hasta)
      AND e.descripcion = 'Confirmada'
    GROUP BY p.descripcion;
END;
GO
