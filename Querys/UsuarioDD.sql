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



/*
Esta consulta puede servir, muestra el nombre del esquema, 
nombre de la tabla, nombre del campo, tipo de dato, 
longitud del tipo de dato, indicador de llave primaria y foránea y la descripción del campo.
*/

