# Requerimientos funcionales principales

* Registrar, modificar, consultar y dar de baja productos de indumentaria.
* Administrar categorías de productos.
* Gestionar talles y colores de las prendas.
* Registrar y consultar clientes.
* Registrar proveedores.
* Consultar y controlar el stock disponible.
* Registrar ventas.
* Registrar el detalle de cada venta.
* Conservar el precio unitario histórico de cada producto vendido.
* Registrar métodos de pago.
* Calcular automáticamente subtotales y totales.
* Actualizar automáticamente el stock después de cada venta.
* Consultar el historial de ventas.
* Permitir anulaciones y devoluciones.
* Generar consultas sobre productos, clientes, ventas y stock.

# Principales entidades del dominio

Las principales entidades que intervienen en el sistema son:

* **Producto:** representa las prendas y accesorios comercializados por la tienda.
* **Categoría:** permite clasificar los productos (remeras, pantalones, camperas, calzado, etc.).
* **Cliente:** representa a las personas que realizan compras.
* **Proveedor:** representa a las empresas o personas que suministran la mercadería.
* **Venta:** representa una operación comercial realizada.
* **DetalleVenta:** contiene los productos vendidos, cantidades, talles, precios y subtotales de cada venta.
* **MétodoPago:** representa la forma utilizada para abonar una venta.
* **Stock:** representa la cantidad disponible de cada producto.
* **Talle:** permite identificar las diferentes medidas disponibles para una prenda.
* **Color:** permite identificar las variantes de color disponibles para cada producto.
