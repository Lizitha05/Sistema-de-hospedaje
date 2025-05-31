
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único de registro hotel(PK)', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'RegistroHotel', 
    @level2type = N'COLUMN', @level2name = 'idRegistroHotel';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Llave foranea de usuario', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'RegistroHotel', 
    @level2type = N'COLUMN', @level2name = 'idUsuario';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Llave foranea de hotel', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'RegistroHotel', 
    @level2type = N'COLUMN', @level2name = 'idHotel';
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
        WHEN C.name = 'idRegistroHotel' THEN 'Solo numeros enteros'
        WHEN C.name = 'idUsuario' THEN 'Solo numeros enteros'
		WHEN C.name = 'idHotel' THEN 'Solo numeros enteros'
		
        ELSE 'Desconocido'
    END) AS Dominio
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP ON C.user_type_id = TP.user_type_id
    INNER JOIN sys.objects d ON T.object_id = d.object_id 
    LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'RegistroHotel'
ORDER BY T.name, C.column_id;
