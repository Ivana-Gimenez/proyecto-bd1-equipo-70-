# Investigación – Optimización de consultas a través de índices

El objetivo principal de esta actividad consistió en analizar cómo los índices permiten mejorar el rendimiento de las consultas en SQL Server. Los índices son estructuras que facilitan la búsqueda de información, evitando recorrer todos los registros de una tabla cuando se realizan consultas sobre determinadas columnas.

Durante el desarrollo se estudió la diferencia entre ejecutar una consulta sin índices y hacerlo utilizando índices sobre las columnas involucradas en los filtros. También se analizaron los índices agrupados (CLUSTERED) y no agrupados (NONCLUSTERED), junto con la posibilidad de incluir columnas mediante INCLUDE para cubrir una consulta.

Para evaluar las mejoras, se utilizaron herramientas de SQL Server como las estadísticas de tiempo y lecturas, además del plan de ejecución. Estas permiten observar los cambios en el acceso a los datos y comparar el rendimiento antes y después de crear un índice.

Esta actividad permitió comprender la importancia de elegir correctamente las columnas que deben indexarse, considerando que los índices mejoran las búsquedas, pero también ocupan espacio y pueden afectar las operaciones de inserción, actualización y eliminación.
