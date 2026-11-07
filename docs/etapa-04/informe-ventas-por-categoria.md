## Necesidad de información que resuelve

Responde a la pregunta de **qué categorías de prendas generan mayores ingresos y concentran más ventas** durante el mes de mayo de 2026, considerando únicamente las ventas confirmadas.

Es un reporte clave para:

- **Toma de decisiones gerenciales:** Identificar las categorías que generan mayores ingresos.
- **Gestión de inventario:** Conocer la cantidad de prendas vendidas por categoría.
- **Estrategias comerciales:** Analizar el comportamiento de las ventas y orientar futuras promociones.

## Estrategia SQL que utiliza

- **Relacionamiento mediante JOIN:** Conecta cuatro tablas (Cabecera_Venta → Detalle_Venta → Prenda → Categoria) para relacionar las ventas con sus detalles y las categorías de las prendas comercializadas.
- **Condiciones establecidas en la cláusula WHERE:**
  - **Condición temporal:** Considera las ventas realizadas desde el 1 de mayo hasta antes del 1 de junio de 2026.
  - **Condición operacional:** Utiliza cv.estado = 'confirmada' para incluir únicamente las ventas concretadas exitosamente.
- **Agregación de métricas (COUNT y SUM):**
  - COUNT(DISTINCT cv.id_venta): Cuenta la cantidad de ventas diferentes por categoría, evitando duplicaciones cuando una venta contiene varios productos de la misma categoría.
  - SUM(dv.cantidad): Calcula el total de prendas vendidas por categoría.
  - SUM(dv.subtotal): Calcula el monto total generado por cada categoría.
- **Agrupamiento (GROUP BY):** Agrupa los resultados por c.descripcion, consolidando las métricas correspondientes a cada categoría.
- **Ordenamiento (ORDER BY):** Ordena los resultados de mayor a menor según monto_total, mostrando primero las categorías que generan mayores ingresos.
