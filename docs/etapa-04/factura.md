## Necesidad de información que resuelve

Responde a la pregunta de **cuál es el detalle de las ventas realizadas**, mostrando la fecha, los datos del cliente, las prendas adquiridas, sus precios, cantidades y subtotales correspondientes.

Es un informe clave para:

- **Control de ventas:** Consultar los artículos incluidos en cada operación.
- **Atención al cliente:** Identificar al cliente y los productos asociados a su compra.
- **Control administrativo:** Verificar los precios, las cantidades y los importes correspondientes a cada producto vendido.

## Estrategia SQL que utiliza

- **Relacionamiento mediante JOIN:** Conecta cuatro tablas (Cabecera_Venta → Detalle_Venta → Prenda → Cliente) para relacionar cada venta con sus detalles, las prendas adquiridas y los datos del cliente.
- **Selección de información:** Obtiene la fecha de la venta, el nombre del cliente, la descripción de la prenda, el precio unitario y la cantidad comprada.
- **Cálculo del subtotal:** Multiplica dv.cantidad * dv.precio_unitario para obtener el importe correspondiente a cada producto.
- **Ordenamiento (ORDER BY):** Organiza los resultados por identificador de venta y por identificador del detalle, permitiendo visualizar juntos los artículos que pertenecen a una misma operación.
