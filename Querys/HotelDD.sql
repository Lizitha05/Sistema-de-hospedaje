
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'idHotel';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Define el nombre completo del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'nombreHotel';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Ciudad,Estado,Pais del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'ubicacion';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Define el domicilio del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'domicilio';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Brinda informacion de cuantos pisos tiene el hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'numeroPisos';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Describe caracteristicas especificas dle hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'descripcion';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Fecha de inicio de operaciones del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'fechaIniOpe';
GO


EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nombre de la persona que registro el hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'usuarioRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Fecha de registro el hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
    @level2type = N'COLUMN', @level2name = 'fechaRegistro';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Hora de registro del hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Hotel', 
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
        WHEN C.name = 'idHotel' THEN 'Clave primaria de la tabla de hotel'
        WHEN C.name = 'nombreHotel' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'ubicacion' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'numeroPisos' THEN 'Solo numero enteros'
		WHEN C.name = 'descripcion' THEN 'Solo cadenas de texto del 0-100'
        WHEN C.name = 'fechaIniOpe' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'usuarioRegistro' THEN 'Solo cadenas de texto del 0-99'
        WHEN C.name = 'fechaRegistro' THEN 'Desde 1000-01-01 hasta 9999-12-31.'
		WHEN C.name = 'horaRegistro' THEN 'Desde -838:59:59 hasta 838:59:59.'
        ELSE 'Desconocido'
    END) AS Dominio
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP ON C.user_type_id = TP.user_type_id
    INNER JOIN sys.objects d ON T.object_id = d.object_id 
    LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'Hotel'
ORDER BY T.name, C.column_id;
