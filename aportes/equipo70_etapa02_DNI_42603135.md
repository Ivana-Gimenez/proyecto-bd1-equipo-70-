# Contribución individual -- Etapa 02

**Equipo:** 70  
**Integrante:** Sofia Celina Coronel  
**Fecha:** 2026-09-23

## 1. Aporte realizado
- Participé en la definición y redacción de las reglas de negocio del sistema, analizando los requerimientos necesarios para representar correctamente el funcionamiento de una tienda de indumentaria. Además de las reglas inicialmente planteadas, propuse la incorporación de nuevas reglas relacionadas con productos, ventas, estados, devoluciones e historial de operaciones, con el fin de establecer una base sólida para la posterior identificación de entidades, atributos y relaciones necesarias para la construcción del Diagrama Entidad-Relación (DER). 

## 2. Decisiones en las que participé
- Participé en las decisiones vinculadas a la definición del alcance funcional y las reglas de negocio que servirían de base para el diseño conceptual de la base de datos. En particular, colaboré en la determinación de las reglas obligatorias relacionadas con stock, clientes, precios históricos y métodos de pago, y propuse reglas adicionales que permitieron identificar nuevas entidades y relaciones para el posterior desarrollo del DER, asegurando una representación más completa y consistente del dominio del negocio.

## 3. Problemas o dificultades identificadas
- Una dificultad encontrada fue redactar la regla relacionada con la conservación del precio histórico de las ventas, ya que era necesario expresar claramente que los cambios futuros en los precios de los productos no debían modificar la información de ventas ya registradas, evitando interpretaciones ambiguas. 

## 4. Soluciones o propuestas realizadas
- Para resolver esta dificultad, se definió que el precio unitario de cada producto se almacenaría en el detalle de la venta al momento de concretar la operación. De esta manera, cualquier modificación posterior del precio del producto solo afectaría a futuras ventas y no a los registros históricos ya almacenados. 

## 5. Evidencias en el repositorio
Indicar los archivos, commits, issues o pull requests relacionados con el aporte.

- `docs/etapa-01/reglas-negocio.md`
- Issue: #XX
- Pull Request: #XX

## 6. Reflexión individual
¿Qué concepto o competencia de Bases de Datos I considero que desarrollé en esta etapa?
- Se desarrolló la capacidad de análisis de requerimientos y modelado conceptual de datos, identificando las necesidades del negocio y traduciéndolas en reglas de negocio claras y consistentes. También se fortaleció la habilidad para reconocer entidades, atributos y relaciones relevantes del dominio, sentando las bases para la posterior elaboración del Diagrama Entidad-Relación (DER) y el diseño de la base de datos.