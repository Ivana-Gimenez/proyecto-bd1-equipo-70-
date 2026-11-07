# Procedimientos y Funciones Almacenadas

## Definición y objetivo

Los procedimientos almacenados y las funciones son objetos de la base de datos que permiten guardar instrucciones SQL para reutilizarlas cuando sea necesario.

Los procedimientos almacenados permiten ejecutar consultas y operaciones mediante parámetros de entrada. Las funciones permiten realizar cálculos o procesar información y devolver un resultado.

Su objetivo es organizar el código SQL, evitar la repetición de instrucciones y facilitar el acceso a la información de la base de datos.

## Ventajas y aplicaciones

Entre sus principales ventajas se encuentran:

- **Reutilización:** permiten ejecutar instrucciones SQL sin tener que escribirlas nuevamente.
- **Organización:** mantienen las operaciones y consultas agrupadas dentro de la base de datos.
- **Mantenimiento:** facilitan la modificación y administración del código.
- **Uso de parámetros:** permiten adaptar las consultas según los valores recibidos.
- **Centralización:** permiten disponer de operaciones frecuentes en un único lugar.

En un sistema comercial como SUPER-EXPRESS, pueden utilizarse para calcular importes de ventas, consultar compras por color, obtener información de proveedores y analizar las prendas más vendidas.

## Implementación en SQL Server

En SQL Server se utilizan las siguientes instrucciones:

- `CREATE FUNCTION`: permite crear una función.
- `CREATE PROCEDURE`: permite crear un procedimiento almacenado.
- `RETURNS`: establece el tipo de dato que devuelve una función.
- `RETURN`: permite devolver el resultado de una función.
- `EXEC`: permite ejecutar un procedimiento almacenado.
- `SELECT`: permite invocar una función que devuelve un valor escalar.

Los procedimientos pueden recibir parámetros para adaptar las consultas a diferentes necesidades, como fechas, identificadores o datos de proveedores.

## Aplicación en SUPER-EXPRESS

En SUPER-EXPRESS se desarrollaron una función y tres procedimientos almacenados para facilitar el cálculo de importes y la consulta de información comercial.

### 1. Función: fn_CalcularTotalVenta

Permite calcular el importe total de una venta a partir de las cantidades y los precios unitarios registrados en `Detalle_Venta`.

Recibe como parámetro el identificador de la venta y devuelve el importe calculado.

### 2. Procedimiento: sp_ConsultarComprasPorColor

Permite consultar la cantidad de prendas compradas agrupadas por color dentro de un período determinado.

Recibe las fechas de inicio y finalización, y muestra únicamente los colores cuyo total de prendas compradas supera las diez unidades.

### 3. Procedimiento: sp_ConsultarComprasProveedorPorPeriodo

Permite consultar el importe total de las compras realizadas a un proveedor durante un período determinado.

Recibe el CUIT del proveedor y las fechas del período, y devuelve el nombre del proveedor y el importe total de sus compras.

### 4. Procedimiento: sp_ConsultarPrendasVendidasPorTemporada

Permite consultar las cantidades de prendas vendidas agrupadas por tipo de prenda dentro de un período determinado.

Recibe las fechas de inicio y finalización como parámetros y considera únicamente las ventas confirmadas.

## Ejecución y pruebas

Para comprobar el funcionamiento de la función y los procedimientos almacenados, se utilizan las siguientes instrucciones en SQL Server.

### 1. Ejecución de la función


SELECT dbo.fn_CalcularTotalVenta(1) AS total_venta;


La función recibe el identificador de una venta y devuelve el importe total calculado.

### 2. Ejecución del procedimiento de compras por color


EXEC dbo.sp_ConsultarComprasPorColor
    @fecha_desde = '2026-05-01',
    @fecha_hasta = '2026-05-31';


Permite consultar las cantidades de prendas compradas por color durante el período indicado.

### 3. Ejecución del procedimiento de compras por proveedor

EXEC dbo.sp_ConsultarComprasProveedorPorPeriodo
    @cuit = '20301234567',
    @fecha_desde = '2026-05-01',
    @fecha_hasta = '2026-05-31';


Permite obtener el importe total de las compras realizadas a un proveedor durante el período establecido.

### 4. Ejecución del procedimiento de prendas vendidas por temporada


EXEC dbo.sp_ConsultarPrendasVendidasPorTemporada
    @fecha_desde = '2026-05-01',
    @fecha_hasta = '2026-05-31';


Permite consultar las unidades vendidas agrupadas por tipo de prenda para el período seleccionado.


## Resultados obtenidos

Los desarrollos permiten reutilizar consultas y cálculos frecuentes, obtener información según distintos períodos y facilitar el
análisis de las operaciones comerciales.
