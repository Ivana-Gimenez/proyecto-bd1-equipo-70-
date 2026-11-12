Triggers

Definicion y obejtivo:
Un trigger o disparador es un conjunto de instrucciones SQL que se almacena en la base de datos 
y se ejecuta automáticamente cuando ocurre un determinado evento sobre una tabla o vista. El objetivo es utomatizar operaciones, 
aplicar reglas de negocio, mantener la integridad de los datos y registrar cambios importantes sin necesidad de intervención manual

Ventajas y aplicaciones:
Los triggers se usan mayormente como mecanismos de control y audirotía automaticos
Algunas de sus ventajas son:
Automatización: ejecutan operaciones automáticamente cuando ocurre un evento, sin necesidad de intervención manual.
Integridad y consistencia: permiten aplicar reglas de negocio que evitan inconsistencias y garantizan su ejecucion al detectarse el evento.
Reducción de errores y simplificacion de tareas: disminuyen la necesidad de realizar operaciones manuales repetitivas.
Auditoría y seguimiento: permiten registrar modificaciones, eliminaciones e inserciones para conocer qué cambios se realizaron.
Centralización: permiten mantener determinadas reglas de negocio directamente en la base de datos.

Aplicación:

---------------------------------------------------- Actualizacion de stock venta
CREATE TRIGGER t_ActualizarStockVenta
ON Detalle_Venta
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.stock = p.stock - i.cantidad
    FROM Prenda p
    INNER JOIN (
        SELECT cod_prenda, SUM(cantidad) AS cantidad
        FROM inserted
        GROUP BY cod_prenda
    ) i
        ON p.cod_prenda = i.cod_prenda;
END;
GO

--------------------------------------------------- actualizacion de stock compra
CREATE TRIGGER t_ActualizarStockCompra
ON Detalle_Compra
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.stock = p.stock + i.cantidad
    FROM Prenda p
    INNER JOIN (
        SELECT cod_prenda, SUM(cantidad) AS cantidad
        FROM inserted
        GROUP BY cod_prenda
    ) i
        ON p.cod_prenda = i.cod_prenda;
END;
GO
