# Seguridad y Control de Acceso en Bases de Datos

## 1. Control Granular y Seguridad
El manejo de roles simplifica de forma drástica la administración de privilegios. En lugar de asignar permisos tabla por tabla a cada usuario nuevo, agruparlos en roles operativos (como `RolSoloLecturaPrendas`) permite escalar la seguridad eficientemente.

## 2. Principio de Menor Privilegio
Se evidenció que un usuario de solo lectura no puede alterar los datos directamente (`INSERT`, `UPDATE`, `DELETE`), cumpliendo con los estándares de seguridad para perfiles de consulta.

## 3. Encapsulamiento mediante Procedimientos Almacenados
Los procedimientos almacenados actúan como una capa intermedia segura. Permiten que usuarios con privilegios estrictamente limitados ejecuten acciones complejas o de escritura controlada sin necesidad de otorgarles acceso total de modificación sobre las tablas base.
