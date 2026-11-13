# Investigación – Optimización de consultas a través de índices

## Definición y objetivo

Los índices son estructuras que SQL Server utiliza para localizar información de forma más eficiente. Su funcionamiento es similar al índice de un libro: en lugar de recorrer todas las páginas para encontrar un tema, permiten acceder directamente a la información buscada.

Cuando una tabla contiene una gran cantidad de registros, las consultas pueden requerir recorrer toda la tabla (Table Scan), generando tiempos de respuesta elevados. La implementación adecuada de índices permite reducir el volumen de datos analizados durante una consulta.

El objetivo principal es mejorar el rendimiento de las consultas, disminuir las lecturas realizadas y reducir los tiempos de respuesta.

## ¿Por qué utilizar índices?

Entre sus principales ventajas se encuentran:

- Mejoran el rendimiento de las consultas de búsqueda.
- Reducen los tiempos de respuesta en tablas con grandes volúmenes de datos.
- Disminuyen la cantidad de lecturas que realiza el motor de base de datos.
- Permiten optimizar filtros por fechas, códigos, clientes y productos.
- Facilitan la escalabilidad de sistemas con grandes cantidades de información.

Sin embargo, los índices también consumen espacio de almacenamiento y pueden afectar el rendimiento de las operaciones INSERT, UPDATE y DELETE, ya que deben mantenerse actualizados.

## Tipos de índices

En SQL Server se utilizan principalmente los siguientes tipos:

- **CLUSTERED:** organiza los datos de la tabla según la clave del índice. Una tabla puede tener un solo índice agrupado.
- **NONCLUSTERED:** crea una estructura independiente que contiene las claves indexadas y referencias a los registros de la tabla. Una tabla puede tener varios índices no agrupados.
- **Índice con INCLUDE:** permite incorporar columnas adicionales a un índice no agrupado para cubrir una consulta y evitar accesos adicionales a la tabla.

## Implementación en SQL Server

Para crear índices se utiliza la instrucción CREATE INDEX.

Algunas instrucciones relacionadas son:

- CREATE CLUSTERED INDEX: crea un índice agrupado.
- CREATE NONCLUSTERED INDEX: crea un índice no agrupado.
- INCLUDE: incorpora columnas adicionales al índice.
- DROP INDEX: elimina un índice existente.
- SET STATISTICS TIME ON: muestra información sobre el tiempo de ejecución.
- SET STATISTICS IO ON: muestra información sobre las lecturas realizadas.

También se utiliza el plan de ejecución para analizar cómo SQL Server accede a los datos y qué operaciones realiza para resolver una consulta.

## Caso de aplicación de ejemplo

### Escenario

Se plantea un sistema de ventas que registra operaciones diariamente en una tabla denominada VentaHistorica`.

La empresa necesita analizar las ventas realizadas durante determinados períodos. Para evaluar el impacto de los índices, se realiza una prueba sobre una tabla con más de un millón de registros.

Este ejemplo utiliza una tabla simplificada y permite observar las diferencias entre ejecutar consultas sin índices y utilizar distintos tipos de índices.

### 1. Creación de la tabla de prueba

Se crea una tabla para almacenar las ventas históricas, incluyendo el identificador de la venta, la fecha y el importe.

### 2. Carga masiva de datos

Se generan registros simulados para obtener un volumen significativo de información y poder evaluar el comportamiento de las consultas.

Se verifica la cantidad de registros mediante una consulta COUNT(*).

### 3. Consulta sin índices

Se activan las estadísticas de tiempo y lecturas mediante SET STATISTICS TIME ON y SET STATISTICS IO ON.

Luego se ejecuta una consulta que recupera las ventas realizadas entre dos fechas.

Se analiza el plan de ejecución para identificar si SQL Server utiliza operaciones como Table Scan o Clustered Index Scan, según la estructura de la tabla.

Se registran los siguientes datos:

- Tiempo de CPU.
- Tiempo total de ejecución.
- Cantidad de lecturas lógicas.
- Operación principal del plan de ejecución.
- Captura del plan de ejecución.

### 4. Creación de un índice agrupado sobre la fecha

Se crea un índice CLUSTERED sobre la columna fecha_venta, debido a que es utilizada en la condición de búsqueda.

Luego se repite la consulta y se analiza si el optimizador cambia su estrategia de acceso a los datos, utilizando operaciones como Clustered Index Seek.

Se registran nuevamente los tiempos, las lecturas y el plan de ejecución.

### 5. Eliminación del índice

Se utiliza DROP INDEX para eliminar el índice agrupado creado anteriormente y preparar la tabla para la siguiente prueba.

### 6. Creación de un índice que cubre la consulta

Se crea un índice NONCLUSTERED sobre la columna fecha_venta, incorporando la columna importe mediante INCLUDE.

Este diseño permite que SQL Server pueda resolver la consulta utilizando la información contenida en el propio índice, sin necesidad de acceder nuevamente a la tabla para recuperar esas columnas.

Se repite la consulta y se analiza si el plan de ejecución utiliza una operación Index Seek.

Se registran los tiempos de CPU, el tiempo total, las lecturas lógicas y el plan de ejecución.


## Aplicación

En el sistema, la optimización mediante índices permite mejorar el rendimiento de las consultas relacionadas con ventas, compras, prendas y proveedores.

La selección de las columnas que deben indexarse debe realizarse considerando las consultas que se ejecutan con mayor frecuencia, especialmente aquellas que utilizan condiciones de búsqueda y filtrado.

El análisis permite identificar qué índices pueden resultar convenientes para mejorar el acceso a la información sin generar costos innecesarios de almacenamiento y mantenimiento.

## Resultados obtenidos

La actividad permite comparar el comportamiento de una misma consulta utilizando diferentes estructuras de índices.

A partir de las estadísticas de tiempo, lecturas y planes de ejecución, se puede evaluar qué alternativa ofrece un mejor rendimiento para el escenario analizado.

También permite comprender que la creación de índices debe realizarse de manera planificada, teniendo en cuenta tanto la mejora en las consultas como el impacto sobre las operaciones de modificación de datos.
