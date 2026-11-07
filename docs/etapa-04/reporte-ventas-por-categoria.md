## Necesidad de información que resuelve

Responde a la pregunta de **cuáles son las categorías de prendas que generan mayores ingresos y registran mayor cantidad de ventas** durante el mes de mayo de 2026, considerando únicamente las ventas confirmadas.

Es un reporte clave para:

- **Toma de decisiones gerenciales:** Identificar las categorías con mayor participación en los ingresos.
- **Gestión de inventario:** Conocer el volumen de prendas comercializadas por categoría.
- **Planificación comercial:** Analizar el comportamiento de las ventas para orientar futuras estrategias.

## Estrategia SQL que utiliza

- **Relacionamiento mediante JOIN:** Conecta cuatro tablas (Cabecera_Venta → Detalle_Venta → Prenda → Categoria) para vincular las ventas con los detalles de las prendas y sus respectivas categorías.
- **Condiciones establecidas en la cláusula WHERE:**
  - **Condición temporal:** Considera las ventas realizadas desde el 1 de mayo hasta antes del 1 de junio de 2026.
  - **Condición operacional:** Utiliza cv.estado = 'confirmada' para incluir únicamente las ventas concretadas exitosamente.
- **Agregación de métricas (COUNT y SUM):**
  - COUNT(DISTINCT cv.id_venta): Cuenta las ventas diferentes correspondientes a cada categoría.
  - SUM(dv.cantidad): Calcula la cantidad total de prendas vendidas por categoría.
  - SUM(dv.subtotal): Calcula el monto total generado por cada categoría.
- **Agrupamiento (GROUP BY):** Agrupa los resultados por c.descripcion, permitiendo obtener los resultados correspondientes a cada categoría.
- **Ordenamiento (ORDER BY):** Ordena los resultados de mayor a menor según monto_total, mostrando primero las categorías que generan mayores ingresos.
