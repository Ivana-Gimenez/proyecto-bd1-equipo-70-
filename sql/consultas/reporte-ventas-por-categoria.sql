SELECT
    c.descripcion AS categoria,
    COUNT(DISTINCT cv.id_venta) AS cantidad_ventas,
    SUM(dv.cantidad) AS total_prendas_vendidas,
    SUM(dv.subtotal) AS monto_total
FROM Cabecera_Venta cv
INNER JOIN Detalle_Venta dv
    ON cv.id_venta = dv.id_venta
INNER JOIN Prenda p
    ON dv.cod_prenda = p.cod_prenda
INNER JOIN Categoria c
    ON p.cod_categoria = c.id_categoria
WHERE cv.fecha >= '2026-05-01'
    AND cv.fecha < '2026-06-01'
    AND cv.estado = 'confirmada'
GROUP BY c.descripcion
ORDER BY monto_total DESC;
