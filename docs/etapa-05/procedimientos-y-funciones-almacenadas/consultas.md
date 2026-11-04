1. Función: Calcular el total de una venta

Problema de negocio: Se necesita conocer el importe total de una venta a partir de las prendas incluidas en ella.

Función propuesta: dbo.fn_CalcularTotalVenta

Lógica: Recibir el identificador de la venta, multiplicar la cantidad de cada prenda por su precio unitario y sumar los importes correspondientes.

Código SQL:

CREATE FUNCTION dbo.fn_CalcularTotalVenta
(
    @id_venta INT
)
RETURNS DECIMAL(18,2)
AS
    RETURN (
        SELECT COALESCE(
            SUM(dv.cantidad * dv.precio_unitario), 0
        )
        FROM Detalle_Venta dv
        WHERE dv.id_venta = @id_venta
    );

Uso: 

SELECT
    id_venta,
    dbo.fn_CalcularTotalVenta(id_venta) AS TotalVenta
FROM Cabecera_Venta;

Beneficio: Permite reutilizar el cálculo del total de una venta sin repetir la lógica en distintas consultas.

-----------------------------------------------------------------------------------------------------------------------------------------

2. Procedimiento: Consultar compras por color

Problema de negocio: Se necesita identificar los colores de prendas más comprados a partir de las compras registradas.

Procedimiento propuesto: dbo.sp_ConsultarComprasPorColor

Lógica: Recibir un período, relacionar las compras con sus detalles, prendas y colores, agrupar las cantidades por color y mostrar aquellos cuya cantidad total comprada sea superior a 10 unidades.

Código SQL:

CREATE PROCEDURE dbo.sp_ConsultarComprasPorColor
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        co.descripcion AS color,
        SUM(dc.cantidad) AS total_prendas_compradas
    FROM Cabecera_Compra cc
    INNER JOIN Detalle_Compra dc
        ON cc.id_compra = dc.id_compra
    INNER JOIN Prenda p
        ON dc.cod_prenda = p.cod_prenda
    INNER JOIN Color co
        ON p.cod_color = co.cod_color
    WHERE cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY co.descripcion
    HAVING SUM(dc.cantidad) > 10
    ORDER BY total_prendas_compradas DESC;

Uso:

SELECT
    co.descripcion AS color,
    SUM(dc.cantidad) AS total_prendas_compradas
FROM Cabecera_Compra cc
INNER JOIN Detalle_Compra dc
    ON cc.id_compra = dc.id_compra
INNER JOIN Prenda p
    ON dc.cod_prenda = p.cod_prenda
INNER JOIN Color co
    ON p.cod_color = co.cod_color
GROUP BY co.descripcion
HAVING SUM(dc.cantidad) > 10;

Beneficio: Permite conocer qué colores concentran las mayores cantidades de compra y facilita el análisis de abastecimiento.

-----------------------------------------------------------------------------------------------------------------------------------------

3. Procedimiento: Consultar compras de un proveedor por período

Problema de negocio: Se necesita conocer cuánto dinero se destinó a las compras realizadas a un proveedor durante un período determinado.

Procedimiento propuesto: dbo.sp_ConsultarComprasProveedorPorPeriodo

Lógica: Recibir el CUIT del proveedor y las fechas del período, filtrar las compras correspondientes y sumar sus importes.

Código SQL:

CREATE PROCEDURE dbo.sp_ConsultarComprasProveedorPorPeriodo
    @cuit VARCHAR(20),
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        p.nombre AS Nombre,
        SUM(cc.total) AS Total
    FROM Cabecera_Compra cc
    INNER JOIN Proveedor p
        ON cc.cuit = p.cuit
    WHERE p.cuit = @cuit
      AND cc.fecha >= @fecha_desde
      AND cc.fecha < DATEADD(DAY, 1, @fecha_hasta)
    GROUP BY p.cuit, p.nombre;

Uso: 

SELECT
    p.nombre AS Nombre,
    SUM(cc.total) AS Total
FROM Cabecera_Compra cc
INNER JOIN Proveedor p
    ON cc.cuit = p.cuit
WHERE cc.fecha >= '2026-10-01'
  AND cc.fecha < '2026-11-01'
GROUP BY p.cuit, p.nombre;

Beneficio: Facilita el control de los gastos por proveedor y permite comparar compras entre distintos períodos.

-----------------------------------------------------------------------------------------------------------------------------------------

4. Procedimiento: Consultar prendas más vendidas por temporada

Problema de negocio:** Se necesita identificar qué tipos de prendas tienen mayor volumen de ventas durante una temporada determinada.

Procedimiento propuesto: dbo.sp_ConsultarPrendasVendidasPorTemporada

Lógica: Recibir las fechas de la temporada, consultar las ventas confirmadas, agrupar por tipo de prenda y ordenar los resultados según la cantidad de unidades vendidas.

Código SQL:

CREATE PROCEDURE dbo.sp_ConsultarPrendasVendidasPorTemporada
    @fecha_desde DATE,
    @fecha_hasta DATE
AS
    SELECT
        p.tipo_prenda AS Prenda,
        SUM(dv.cantidad) AS TotalUnidadesVendidas
    FROM Cabecera_Venta cv
    INNER JOIN Detalle_Venta dv
        ON cv.id_venta = dv.id_venta
    INNER JOIN Prenda p
        ON dv.cod_prenda = p.cod_prenda
    WHERE cv.fecha >= @fecha_desde
      AND cv.fecha < DATEADD(DAY, 1, @fecha_hasta)
      AND cv.estado = 'confirmada'
    GROUP BY p.tipo_prenda
    ORDER BY TotalUnidadesVendidas DESC;

Uso:

SELECT
    p.tipo_prenda AS Prenda,
    SUM(dv.cantidad) AS Total
FROM Cabecera_Venta cv
INNER JOIN Detalle_Venta dv
    ON cv.id_venta = dv.id_venta
INNER JOIN Prenda p
    ON dv.cod_prenda = p.cod_prenda
WHERE cv.fecha >= '2026-10-01'
  AND cv.fecha < '2026-11-01'
  AND cv.estado = 'confirmada'
GROUP BY p.tipo_prenda
ORDER BY Total DESC;

Beneficio: Permite identificar las prendas con mayor demanda en una temporada y aporta información útil para planificar las compras y el stock.
