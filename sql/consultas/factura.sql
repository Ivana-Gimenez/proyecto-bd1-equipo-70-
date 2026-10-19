SELECT
    cv.fecha,
    c.nombre_apellido AS Cliente,
    p.descripcion,
    dv.precio_unitario,
    dv.cantidad,
    dv.cantidad * dv.precio_unitario AS subtotal,
    SUM(dv.cantidad * dv.precio_unitario)
        OVER (PARTITION BY cv.id_venta) AS total_acumulado
FROM Cabecera_Venta cv
INNER JOIN Detalle_Venta dv
    ON dv.id_venta = cv.id_venta
INNER JOIN Prenda p
    ON dv.cod_prenda = p.cod_prenda
INNER JOIN Cliente c
    ON cv.id_cliente = c.id_cliente
ORDER BY cv.id_venta, dv.id_det_venta;
