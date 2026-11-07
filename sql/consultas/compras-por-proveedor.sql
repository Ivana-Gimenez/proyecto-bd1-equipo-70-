SELECT
    pr.razon_social AS proveedor,
    COUNT(DISTINCT cc.id_compra) AS cantidad_compras,
    SUM(dc.cantidad) AS total_prendas_compradas,
    SUM(dc.subtotal) AS monto_total
FROM Cabecera_Compra cc
INNER JOIN Detalle_Compra dc
    ON cc.id_compra = dc.id_compra
INNER JOIN Proveedor pr
    ON cc.id_proveedor = pr.id_proveedor
WHERE cc.fecha >= '2026-05-01'
    AND cc.fecha < '2026-06-01'
GROUP BY pr.razon_social
ORDER BY monto_total DESC;
