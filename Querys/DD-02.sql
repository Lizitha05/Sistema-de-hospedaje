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
ORDER BY T.name, c.column_id


/*
Esta consulta puede servir, muestra el nombre del esquema, 
nombre de la tabla, nombre del campo, tipo de dato, 
longitud del tipo de dato, indicador de llave primaria y foránea y la descripción del campo.
*/

SELECT S.NAME AS [SCHEMA_TABLE], 
       T.NAME AS [TABLE NAME], 
       C.NAME AS [COLUMN NAME], 
       P.NAME AS [DATA TYPE], 
       CASE C.max_length 
         WHEN -1 THEN 'MAX' 
         ELSE CONVERT(VARCHAR, C.max_length) 
       END AS [SIZE], 
       CASE c.is_nullable 
         WHEN 0 THEN 'No Nulo' 
         ELSE 'Nulo' 
       END AS [Nullable], 
       CASE c.is_identity 
         WHEN 0 THEN '' 
         ELSE 'PK' 
       END AS [PK], 
       CASE 
         WHEN ( fk.object_id IS NULL ) THEN '' 
         ELSE 'FK' 
       END AS [FK], 
       Isnull(sep.value, '') [DescriptiON] 
FROM   sys.objects AS T 
       JOIN sys.columns AS C ON T.object_id = C.object_id 
       JOIN sys.schemas AS S ON T.schema_id = S.schema_id 
       JOIN sys.types AS P ON C.system_type_id = P.system_type_id 
       LEFT JOIN sys.extended_properties sep ON C.object_id = sep.major_id AND C.column_id = sep.minor_id AND sep.NAME = 'MS_DescriptiON' 
       LEFT JOIN (sys.foreign_keys fk 
                  INNER JOIN sys.foreign_key_columns fc ON ( fk.object_id = fc.constraint_object_id )) 
              ON ( ( fk.parent_object_id = C.object_id ) 
                   AND ( fc.parent_column_id = C.column_id ) ) 
WHERE  T.type_desc = 'USER_TABLE' 
       --AND s.NAME <> 'dbo' 
ORDER  BY s.NAME, 
          T.NAME, 
          c.column_id; 