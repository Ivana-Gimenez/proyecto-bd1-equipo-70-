# Proyecto de Base de Datos I – Equipo 70

## Sistema de Gestión de Ventas

### Descripción del proyecto

El presente proyecto consiste en el diseño e implementación de una base de datos relacional para un sistema de gestión de ventas e inventario de una tienda de indumentaria.

Su objetivo es organizar y administrar la información relacionada con productos, clientes, proveedores, compras, ventas, stock y métodos de pago, garantizando la integridad, consistencia y correcta organización de los datos.

### Objetivos

- Diseñar un modelo de datos relacional normalizado hasta la Tercera Forma Normal (3FN).
- Implementar las tablas, relaciones y restricciones de integridad.
- Registrar y consultar operaciones de compras y ventas.
- Facilitar el control del inventario y la información comercial.
- Incorporar mecanismos técnicos que mejoren la seguridad, el rendimiento y la integridad de la base de datos.

### Tecnologías utilizadas

- Microsoft SQL Server.
- SQL Server Management Studio (SSMS).
- GitHub para el control de versiones y la documentación del proyecto.

### Desarrollo por etapas

**Etapa I – Requerimientos y dominio del negocio**

Definición del caso de estudio, alcance del sistema y reglas de negocio correspondientes a la gestión de ventas e inventario de una tienda de indumentaria.

**Etapa II – Modelado conceptual y lógico**

Elaboración del Diagrama Entidad-Relación, transformación al modelo relacional y proceso de normalización hasta 3FN.

**Etapa III – Implementación física**

Creación de la base de datos, tablas, claves primarias y foráneas, restricciones de integridad y carga inicial de datos mediante scripts DDL y DML.

**Etapa IV – Consultas y casos de uso**

Desarrollo de consultas SQL para obtener información de ventas, comprobantes, reportes agregados y consultas de negocio mediante JOIN, GROUP BY, HAVING y subconsultas.

**Etapa V – Temas técnicos**

Investigación e implementación de mecanismos para fortalecer la base de datos:

- Procedimientos y funciones almacenadas.
- Manejo de transacciones.
- Disparadores de auditoría (Triggers).
- Seguridad.
- Índices y optimización de consultas.

### Estructura del repositorio

```text
proyecto-bd1-equipo-70/
│
├── documentos/
│   ├── etapa-01/
│   ├── etapa-02/
│   ├── etapa-03/
│   ├── etapa-04/
│   └── etapa-05/
│
├── sql/
│   ├── ddl/
│   ├── dml/
│   ├── consultas/
│   └── tecnico/
│
└── README.md
```

### Integrantes

1. CORONEL, Sofia Celina.
2. GIMENEZ, Ivana Belen.
3. MARCHI, Enzo Lucas.

**Equipo:** 70

### Institución

Universidad Nacional del Nordeste - UNNE  
Licenciatura en Sistemas de Información  
Asignatura: Bases de Datos I
