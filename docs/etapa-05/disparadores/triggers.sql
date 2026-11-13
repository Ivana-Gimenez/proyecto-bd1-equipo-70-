
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------- Triggers de totales

-------------------------------------------- Trigger de total de compra
CREATE TRIGGER t_total_Compra
ON Detalle_Compra
AFTER INSERT, UPDATE, DELETE
AS

    ---------- No queremos mostrar información de columnas afectadas
    SET NOCOUNT ON;

    ---------- Hacemos una consulta temporal para ver las compras afectadas
    ;WITH ComprasAfectadas AS (
        SELECT id_compra FROM inserted

        ---------- Combina ambas consultas eliminando los duplicados
        UNION

        SELECT id_compra FROM deleted
    )

    ---------------- Actualizamos la tabla
    UPDATE CC

    ---------------- Cambiamos el valor de total, usamos ISNULL()
    SET total = ISNULL((
        SELECT SUM(DC.subtotal)
        FROM Detalle_Compra DC
        WHERE DC.id_compra = CC.id_compra
    ), 0)

    --------------- Relacionamos la cabecera con las compras afectadas
    FROM Cabecera_Compra CC
    INNER JOIN ComprasAfectadas CA
        ON CC.id_compra = CA.id_compra;

GO

-------------------------------------------- Trigger de total de venta
CREATE OR ALTER TRIGGER t_total_Venta
ON Detalle_Venta
AFTER INSERT, UPDATE, DELETE
AS
---------- No queremos mostrar información de columnas afectadas
    SET NOCOUNT ON;

---------- Hacemos una consulta temporal para ver las ventas afectadas
    ;WITH VentasAfectadas AS (
        SELECT id_venta FROM inserted

---------- Combina ambas consultas eliminando los duplicados
        UNION

        SELECT id_venta FROM deleted
    )

---------------- Actualizamos la tabla
    UPDATE CV
---------------- Cambiamos el valor de total, usamos la función ISNULL()
    SET total = ISNULL((
---------------- Hacemos una consulta de todos los Detalles/Cabecera
        SELECT SUM(DV.subtotal)
        FROM Detalle_Venta DV
        WHERE DV.id_venta = CV.id_venta), 0)
--------------- Decimos que la actualización se realiza donde los datos de la cabecera y la tabla virtual coincide
    FROM Cabecera_Venta CV
    INNER JOIN VentasAfectadas VA
        ON CV.id_venta = VA.id_venta;
GO


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------- Triggers de stock

-------------------------------------------- Trigger actualizar stock con compra

CREATE TRIGGER t_stock_Compra
ON Detalle_Compra
AFTER INSERT, UPDATE, DELETE
AS
----------------------------------- No queremos que se muestren el numero de filas afectadas
    SET NOCOUNT ON;
-------------------------------------- Declaramos una tabla temporal
    DECLARE @Movimientos TABLE (
        cod_prenda INT PRIMARY KEY,
        variacion INT
    );

------------------------------------- Insertamos en la tabla para calcular
    INSERT INTO @Movimientos (cod_prenda, variacion)
------------------------------------- buscamos el codigo de prenda y la operacion de las variaciones
    SELECT cod_prenda, SUM(variacion)
------------------------------------- lo traemos de la siguiente subconsulta
    FROM (
------------------------------------- los codigos de prenda y variaciones de los insertados (positivos)
        SELECT cod_prenda, cantidad AS variacion
        FROM inserted

---------- Combina ambas consultas sin eliminar los duplicados
        UNION ALL

------------------------------------- los codigos de prenda y variaciones de los eliminados (negativos)
        SELECT cod_prenda, -cantidad AS variacion
        FROM deleted
    ) AS Movimientos
    GROUP BY cod_prenda;

    -- Evitamos que el stock quede negativo
    UPDATE P
------------------------------------- Seteamos el stock operado con la variacion
    SET stock = stock + M.variacion
------------------------------------- de prenda y movimiento
    FROM Prenda P
    INNER JOIN @Movimientos M
        ON P.cod_prenda = M.cod_prenda
    WHERE P.stock + M.variacion >= 0;
GO

-------------------------------------------- Trigger actualizar stock con ventas
CREATE TRIGGER t_stock_Venta
ON Detalle_Venta
AFTER INSERT, UPDATE, DELETE
AS
    SET NOCOUNT ON;

    DECLARE @Movimientos TABLE (
        cod_prenda INT PRIMARY KEY,
        variacion INT
    );

    INSERT INTO @Movimientos (cod_prenda, variacion)
    SELECT cod_prenda, SUM(variacion)
    FROM (

        SELECT DV.cod_prenda, -DV.cantidad AS variacion
        FROM inserted DV
        INNER JOIN Cabecera_Venta CV
            ON DV.id_venta = CV.id_venta
        INNER JOIN Estado E
            ON CV.cod_estado = E.cod_estado
        WHERE E.descripcion = 'Confirmada'

        UNION ALL


        SELECT DV.cod_prenda, DV.cantidad AS variacion
        FROM deleted DV
        INNER JOIN Cabecera_Venta CV
            ON DV.id_venta = CV.id_venta
        INNER JOIN Estado E
            ON CV.cod_estado = E.cod_estado
        WHERE E.descripcion = 'Confirmada'
    ) AS Movimientos
    GROUP BY cod_prenda;

    UPDATE P
    SET stock = stock + M.variacion
    FROM Prenda P
    INNER JOIN @Movimientos M
        ON P.cod_prenda = M.cod_prenda
    WHERE P.stock + M.variacion >= 0;

GO

-------------------------------------------- Trigger estado

CREATE OR ALTER TRIGGER t_stock_estadoventa
ON Cabecera_Venta
AFTER INSERT, UPDATE
AS
    SET NOCOUNT ON;

    DECLARE @Movimientos TABLE (
        cod_prenda INT PRIMARY KEY,
        variacion INT
    );

    INSERT INTO @Movimientos (cod_prenda, variacion)
    SELECT
        DV.cod_prenda,
        SUM(DV.cantidad * T.factor)
    FROM inserted I
    LEFT JOIN deleted D
        ON I.id_venta = D.id_venta
    LEFT JOIN Estado EstadoAnterior
        ON D.cod_estado = EstadoAnterior.cod_estado
    INNER JOIN Estado EstadoNuevo
        ON I.cod_estado = EstadoNuevo.cod_estado
    CROSS APPLY (
        VALUES (
            CASE
                WHEN EstadoNuevo.descripcion = 'Confirmada'
                     AND (EstadoAnterior.descripcion IS NULL
                          OR EstadoAnterior.descripcion <> 'Confirmada')
                    THEN -1

                WHEN EstadoAnterior.descripcion = 'Confirmada'
                     AND EstadoNuevo.descripcion <> 'Confirmada'
                    THEN 1

                ELSE 0
            END
        )
    ) AS T(factor)
    INNER JOIN Detalle_Venta DV
        ON I.id_venta = DV.id_venta
    WHERE T.factor <> 0
    GROUP BY DV.cod_prenda;

    UPDATE P
    SET stock = stock + M.variacion
    FROM Prenda P
    INNER JOIN @Movimientos M
        ON P.cod_prenda = M.cod_prenda
    WHERE P.stock + M.variacion >= 0;

GO
