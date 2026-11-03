SELECT 
    c.id_categoria,
    c.descripcion AS categoria,
    COUNT(DISTINCT v.id_venta) AS total_operaciones,
    SUM(dv.cantidad) AS total_unidades_vendidas,
    SUM(dv.subtotal) AS monto_total_recaudado
FROM 
    Cabecera_Venta v
JOIN 
    Detalle_Venta dv ON v.id_venta = dv.id_venta
JOIN 
    Prenda p ON dv.cod_prenda = p.cod_prenda
JOIN 
    Categoria c ON p.id_categoria = c.id_categoria
WHERE 
    v.fecha BETWEEN '2026-05-01 00:00:00' AND '2026-05-31 23:59:59'
    AND v.estado = 'confirmada'
GROUP BY 
    c.id_categoria, 
    c.descripcion
ORDER BY 
    monto_total_recaudado DESC;
