SELECT 
    p.categoria,
    COUNT(DISTINCT v.id_venta) AS cantidad_ventas_realizadas,
    SUM(dv.cantidad) AS total_unidades_vendidas,
    SUM(dv.subtotal) AS monto_total_recaudado
FROM VENTAS v
INNER JOIN DETALLE_VENTA dv ON v.id_venta = dv.id_venta
INNER JOIN PRODUCTOS p ON dv.id_producto = p.id_producto
WHERE v.fecha BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59'
  AND v.estado_de_compra = 'Completada'
GROUP BY p.categoria
ORDER BY monto_total_recaudado DESC;