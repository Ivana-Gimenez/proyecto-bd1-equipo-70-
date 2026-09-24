# Reglas de Negocio

## RN.01 – Gestión de productos
Cada prenda o artículo de indumentaria debe estar registrado en el sistema con un código único, descripción, categoría, talle, color, precio unitario y cantidad disponible en stock.

## RN.02 – Control de stock
El sistema debe mantener actualizado el stock de cada producto. Cuando se registre una venta, la cantidad vendida deberá descontarse automáticamente del stock disponible.

## RN.03 – Stock insuficiente
No se podrá registrar una venta cuando la cantidad solicitada de una prenda sea superior al stock disponible.

## RN.04 – Registro de clientes
Cada cliente podrá ser registrado con sus datos personales y de contacto. Un cliente puede realizar múltiples compras y cada venta podrá asociarse al cliente correspondiente.

## RN.05 – Precio histórico de las ventas
El precio unitario de cada producto deberá almacenarse en el detalle de la venta al momento de concretar la operación. Si posteriormente cambia el precio del producto, las ventas históricas conservarán el precio originalmente aplicado.

## RN.06 – Cálculo del total de la venta
El subtotal de cada línea del detalle se calculará multiplicando la cantidad vendida por el precio unitario registrado. El total de la venta será la suma de todos los subtotales.

## RN.07 – Métodos de pago
Cada venta deberá registrar uno o más métodos de pago habilitados por el comercio, tales como efectivo, tarjeta de débito, tarjeta de crédito, transferencia bancaria o billetera virtual.

## RN.08 – Estado de la venta
Toda venta deberá poseer un estado que permita identificar si se encuentra pendiente, confirmada o anulada.

## RN.09 – Integridad del detalle de venta
Una venta deberá contener al menos un producto para poder ser confirmada. Cada artículo incluido deberá especificar cantidad, precio unitario y subtotal.

## RN.10 – Historial de operaciones
El sistema deberá conservar el historial completo de las ventas realizadas, incluyendo fecha, cliente, prendas vendidas, cantidades, precios aplicados, total y método de pago utilizado.

## RN.11 – Actualización de precios
La modificación del precio actual de una prenda afectará únicamente a futuras ventas. Los precios registrados en operaciones anteriores no deberán modificarse.

## RN.12 – Devoluciones y anulaciones
Cuando una venta sea anulada o se registre una devolución autorizada, el sistema deberá actualizar automáticamente el stock, reincorporando las unidades correspondientes.
