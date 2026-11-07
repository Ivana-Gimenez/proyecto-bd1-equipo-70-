## Necesidad de información que resuelve

Responde a la pregunta de **qué colores concentran la mayor cantidad de prendas compradas por el negocio**, considerando únicamente aquellos colores cuya cantidad total supera las 10 unidades.

Es un informe clave para:

- **Gestión de inventario:** Identificar los colores con mayor volumen de prendas adquiridas.
- **Planificación de compras:** Reconocer las preferencias de abastecimiento según el color.
- **Toma de decisiones:** Analizar qué colores tienen mayor presencia en las compras y orientar futuras adquisiciones.

## Estrategia SQL que utiliza

- **Relacionamiento mediante JOIN:** Conecta cuatro tablas (Cabecera_Compra → Detalle_Compra → Prenda → Color) para relacionar las compras con sus detalles, las prendas adquiridas y sus respectivos colores.
- **Agregación de cantidades (SUM):** Utiliza SUM(dc.cantidad) para calcular el total de prendas compradas por cada color.
- **Agrupamiento (GROUP BY):** Agrupa los resultados por co.descripcion, consolidando las cantidades correspondientes a cada color.
- **Filtrado de resultados agrupados (HAVING):** Aplica HAVING SUM(dc.cantidad) > 10 para mostrar únicamente los colores cuya cantidad total de prendas compradas supera las 10 unidades.
- **Ordenamiento (ORDER BY):** Ordena los resultados de mayor a menor cantidad de prendas compradas, utilizando total_prendas_compradas.
