## Necesidad de información que resuelve

Responde a la pregunta de **cuáles son las categorías de prendas más rentables y populares** de un negocio durante el mes de mayo de 2026, considerando únicamente las ventas que se concretaron de forma exitosa.

Es un reporte clave para:

* **Toma de decisiones gerenciales:** Identificar los productos líderes en ingresos.

* **Gestión de inventario:** Ajustar los niveles de stock según la demanda real por categoría.

* **Estrategias de marketing y compras:** Priorizar promociones o reabastecimiento con proveedores en base al volumen comercializado.

## Estrategia SQL que utiliza

* **Relacionamiento mediante `JOIN`:** Conecta cuatro tablas en cascada (`Cabecera_Venta` $\rightarrow$ `Detalle_Venta` $\rightarrow$ `Prenda` $\rightarrow$ `Categoria`) para vincular cada ítem vendido con su categoría correspondiente.

* **Filtrado estricto en la cláusula `WHERE`:**

  * **Filtro temporal:** Aplica un rango (`BETWEEN '2026-05-01 00:00:00' AND '2026-05-31 23:59:59'`) para acotar los datos al mes de mayo de 2026.

  * **Filtro operacional:** Evalúa `v.estado = 'confirmada'` para descartar ventas canceladas, pendientes o devueltas.

* **Agregación de métricas (`COUNT` y `SUM`):**

  * `COUNT(DISTINCT v.id_venta)`: Cuenta el número de transacciones únicas donde se compró al menos un artículo de esa categoría, evitando duplicaciones por múltiples líneas en el detalle.

  * `SUM(dv.cantidad)`: Calcula el total acumulado de prendas individuales vendidas.

  * `SUM(dv.subtotal)`: Suma la facturación total generada por cada categoría.

* **Agrupamiento y ordenamiento (`GROUP BY` y `ORDER BY`):**

  * `GROUP BY c.id_categoria, c.descripcion`: Consolida las métricas a nivel de cada categoría.

  * `ORDER BY monto_total_recaudado DESC`: Ordena la salida de manera descendente para situar primero las categorías con mayor impacto económico.
