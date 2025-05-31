
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único de registro de tipo de habitacion(PK)', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'idTipoHabitacion';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Cantidas de camas que tienes esa habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'numeroCamas';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Tipo de camas que tiene esa habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'tipoCamas';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Cual es el precio por noche de esa habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'precioNochePersona';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Cuantas habitaciones hay de este tipo', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'cantidadHabitacion';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Si es suite,premiere,king', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'nivelHabitacion';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Descripcion del tipo de habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'caracteristicas';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Valor extra a la habitacion si tiene viste al mar ,etc', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'amenidades';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Cantidad de personas que se quedar en esa habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'cantidadPersonas';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Usuario que registro el tipo de habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'usuarioRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Fecha de registro del tipo de habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'fechaRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Hora de registro del tipo de habitacion', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'TipoDeHabitacion', 
    @level2type = N'COLUMN', @level2name = 'horaRegistro';
GO



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
        WHEN C.name = 'idTipoHabitacion' THEN 'Solo numeros enteros'
        WHEN C.name = 'numeroCamas' THEN 'Solo numeros enteros'
		WHEN C.name = 'tipoCamas' THEN 'Solo numeros enteros'
		WHEN C.name = 'precioNochePersona' THEN 'Solo cadenas de texto de 0-99'
        WHEN C.name = 'cantidadHabitacion' THEN 'Solo cadenas de texto de 0-99'
		WHEN C.name = 'nivelHabitacion' THEN 'Solo cadenas de texto de 0-99'
		WHEN C.name = 'caracteristicas' THEN 'Solo cadenas de texto de 0-99'
        WHEN C.name = 'amenidades' THEN 'Solo cadenas de texto de 0-99 '
		WHEN C.name = 'cantidadPersonas' THEN 'Solo numeros enteros'
		WHEN C.name = 'usuarioRegistro' THEN 'Solo cadenas de texto'
        WHEN C.name = 'fechaRegistro' THEN 'Desde 1000-01-01 hasta 9999-12-31.'
		WHEN C.name = 'horaRegistro' THEN 'Desde -838:59:59 hasta 838:59:59.'
		
        ELSE 'Desconocido'
    END) AS Dominio
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP ON C.user_type_id = TP.user_type_id
    INNER JOIN sys.objects d ON T.object_id = d.object_id 
    LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'TipoDeHabitacion'
ORDER BY T.name, C.column_id;
