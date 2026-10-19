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
HAVING SUM(dc.cantidad) > 10
ORDER BY total_prendas_compradas DESC;
