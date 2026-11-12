# Reglas de Negocio

## RN.01 – Registro y clasificación de prendas

Cada prenda deberá estar registrada en el sistema mediante un código único, descripción, categoría, talle, género, diseño, precio unitario y cantidad disponible en stock. La categoría permitirá identificar el tipo de prenda comercializada.

## RN.02 – Composición de materiales

Una prenda podrá estar compuesta por uno o varios materiales. Para cada material asociado deberá registrarse un porcentaje de participación mayor que cero y menor o igual a 100. La composición total de una prenda deberá representar el 100 % de sus materiales.

## RN.03 – Diseño y combinación de colores

Cada prenda deberá tener asociado un diseño, que representará su patrón o apariencia visual. Un diseño podrá estar compuesto por uno o varios colores, y un mismo color podrá utilizarse en diferentes diseños.

## RN.04 – Gestión de proveedores y compras

Toda compra de mercadería deberá estar asociada a un proveedor previamente registrado. Cada compra podrá incluir una o varias prendas y deberá almacenar la fecha, el importe total y el detalle de los artículos adquiridos.

## RN.05 – Registro de clientes

Cada cliente deberá identificarse mediante un DNI único y contar con un nombre y apellido registrados. Un cliente podrá estar asociado a múltiples ventas, mientras que cada venta deberá corresponder a un único cliente.

## RN.06 – Control de stock

El sistema deberá mantener actualizado el stock disponible de cada prenda. Las compras de mercadería incrementarán las existencias, mientras que las ventas confirmadas disminuirán las unidades correspondientes.

## RN.07 – Stock insuficiente

No se deberá permitir confirmar una venta cuando la cantidad solicitada de una prenda sea superior a las unidades disponibles en stock. El sistema deberá impedir que las existencias de una prenda sean negativas.

## RN.08 – Precio histórico de las operaciones

El precio unitario de cada prenda deberá almacenarse en el detalle de compra o venta al momento de realizar la operación. Las modificaciones posteriores de los precios actuales no deberán alterar los valores históricos registrados.

## RN.09 – Cálculo de subtotales

El subtotal de cada artículo incluido en una compra o venta se calculará multiplicando la cantidad por el precio unitario correspondiente. Este importe deberá obtenerse automáticamente y no modificarse de manera independiente.

## RN.10 – Cálculo del total de las operaciones

El total de cada compra o venta deberá corresponder a la suma de los subtotales de todos los artículos incluidos en su respectivo detalle.

## RN.11 – Métodos de pago

Cada venta podrá abonarse mediante uno o varios métodos de pago habilitados por el comercio, tales como efectivo, tarjeta de débito, tarjeta de crédito, transferencia bancaria o billetera virtual. Cuando se utilicen varios métodos, deberá registrarse el importe correspondiente a cada uno.

## RN.12 – Estado de la venta

Toda venta deberá tener asociado un estado que permita identificar su situación dentro del proceso comercial. Se contemplan, como mínimo, los estados pendiente, confirmada y anulada.

## RN.13 – Integridad del detalle de venta

Una venta deberá contener al menos un artículo en su detalle para poder ser confirmada. Cada artículo deberá especificar una prenda, una cantidad mayor que cero y un precio unitario válido.

## RN.14 – Correspondencia entre pagos y total de venta

La suma de los importes registrados mediante los diferentes métodos de pago deberá coincidir con el total de la venta para considerar que la operación está completamente abonada.

## RN.15 – Conservación del historial de operaciones

El sistema deberá conservar los registros históricos de compras y ventas, incluyendo sus fechas, proveedores o clientes asociados, artículos involucrados, cantidades, precios unitarios, subtotales, totales y métodos de pago correspondientes.

## RN.16 – Actualización de precios

La modificación del precio actual de una prenda afectará únicamente a las operaciones futuras. Los precios almacenados en los detalles de compras y ventas anteriores deberán conservarse sin modificaciones.

## RN.17 – Anulaciones y devoluciones

Las ventas anuladas deberán conservarse en el historial del sistema, modificando su estado en lugar de eliminar sus registros. Cuando corresponda, las anulaciones o devoluciones deberán contemplar la restitución de las unidades al stock disponible, evitando que un mismo movimiento sea revertido más de una vez.
