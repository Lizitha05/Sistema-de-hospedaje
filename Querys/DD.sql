-- SOLO USAR UNA DE LAS 2
-- MAD
-- Dr. Alejandro Villarreal

/*
Un diccionario de datos, o repositorio de metadatos, 
como lo define el IBM Dictionary of Computing, 
un repositorio centralizado de información sobre datos tales como significado, 
relación con otros datos, origen, uso y formato.

Ahora, lo siguiente consulta te puede entregar un diccionario de datos de forma muy general 
como el nombre de la Tabla, el nombre del Campo, Tipo de dato, Valor por defecto y si es o no Requerido:
*/


EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'idUsuario';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Define si el usuario es administrador u operativo', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'tipoUsuario';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Correo del usuario registrado', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'correo';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Contraseña del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'contra';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nombre(s) del usuario registrado', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'nombres';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Apellido paterno del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'apellidoPaterno';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Apellido materno del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'apellidoMaterno';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Representa el numero de nomina del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'numeroNomina';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Define la fecha de nacimiento del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'fechaNacimiento';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Numero telefonico del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'telefono1';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Numero telefonico del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'telefono2';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nombre del usuario registrado', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'usuarioRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Fecha de registro el usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'fechaRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Hora de registro del usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Usuario', 
    @level2type = N'COLUMN', @level2name = 'horaRegistro';
GO


/*
Esta consulta puede servir, muestra el nombre del esquema, 
nombre de la tabla, nombre del campo, tipo de dato, 
longitud del tipo de dato, indicador de llave primaria y foránea y la descripción del campo.

SELECT 
    T.name AS Tabla,
    C.name as Campo,
    TP.name + '(' + CAST(TP.max_length AS VARCHAR) + ')' AS 'Tipo de Campo',
    (CASE 
        WHEN C.is_nullable = 0 THEN 'NULL'
        WHEN C.is_nullable = 1 THEN 'NOT NULL'
    END) AS 'Valor por defecto',
    (CASE 
        WHEN C.is_nullable = 0 THEN 'NO'
        WHEN C.is_nullable = 1 THEN 'SÍ'
    END) AS 'Requerido'
	,ep.value [Descripcion]
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C
        ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP
        ON C.user_type_id = TP.user_type_id
	inner join sys.objects d 
		On T.object_id= d.object_id 
	left JOIN sys.extended_properties ep 
		ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'Usuario'
ORDER BY T.name, c.column_id


*/


SELECT 
    T.name AS Tabla,
    C.name AS Campo,
    TP.name + '(' + CAST(C.max_length AS VARCHAR) + ')' AS 'Tipo de Campo',
    (CASE 
        WHEN C.is_nullable = 0 THEN 'NOT NULL'
        WHEN C.is_nullable = 1 THEN 'NULL'
    END) AS 'Valor por defecto',
    (CASE 
        WHEN C.is_nullable = 0 THEN 'NO'
        WHEN C.is_nullable = 1 THEN 'SÍ'
    END) AS 'Requerido',
    ep.value AS Descripcion,
    (CASE 
        WHEN C.name = 'idUsuario' THEN 'Números enteros positivos'
        WHEN C.name = 'tipoUsuario' THEN 'Solo cadenas de texto del 0-50'
		WHEN C.name = 'correo' THEN 'Solo cadenas de texto con formato de correo electronico del 0-99'
        WHEN C.name = 'contra' THEN 'Solo cadenas de texto con formato de contraseña del 0-99'
        WHEN C.name = 'nombres' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'apellidoPaterno' THEN 'Solo cadenas de texto del 0-49'
		WHEN C.name = 'apellidoMaterno' THEN 'Solo cadenas de texto del 0-49'
        WHEN C.name = 'numeroNomina' THEN 'Solo cadenas de texto del 0-99'
        WHEN C.name = 'FechaNacimiento' THEN 'Desde 1000-01-01 hasta 9999-12-31.'
        WHEN C.name = 'telefono1' THEN 'Solo cadenas de texto del 0-9'
		WHEN C.name = 'telefono2' THEN 'Solo cadenas de texto del 0-9'
		 WHEN C.name = 'UsuarioRegistro' THEN 'Solo cadenas de texto del 0-50'
        WHEN C.name = 'fechaRegistro' THEN 'Desde 1000-01-01 hasta 9999-12-31.'
		WHEN C.name = 'horaRegistro' THEN 'Desde -838:59:59 hasta 838:59:59.'
        ELSE 'Desconocido'
    END) AS Dominio
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP ON C.user_type_id = TP.user_type_id
    INNER JOIN sys.objects d ON T.object_id = d.object_id 
    LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'Usuario'
ORDER BY T.name, C.column_id;
