
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'idCliente';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Define el nombre completo del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'nombreCompleto';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Apellido paterno del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'apellidoPaterno';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Apellido materno del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'apellidoMaterno';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Ciudad,estado y pais del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'ubicacion';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Identificador único alfanumérico asignado por el Servicio de Administración Tributaria (SAT) de México.
    Se utiliza para identificar a las personas físicas o morales dentro de los sistemas fiscales y administrativos.', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'RFC';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Correo electronico del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'correo';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Numero telefonico del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'telefono1';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Numero telefonico del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'telefono2';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Representa la fecha del nacimiento del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'fechaNacimiento';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'[Soltero, Casado, Divorciado, Viudo, Unión Libre, Separado].', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'estadoCivil';
GO

EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Nombre del cliente registrado', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'usuarioCliente';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Fecha de registro el cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
    @level2type = N'COLUMN', @level2name = 'fechaCliente';
GO
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = N'Hora de registro del cliente', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE',  @level1name = 'Cliente', 
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
        WHEN C.name = 'idCliente' THEN 'Clave primaria de la tabla de clientes'
        WHEN C.name = 'nombreCompleto' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'apellidoPaterno' THEN 'Solo cadenas de texto del 0-100'
		WHEN C.name = 'apellidoMaterno' THEN 'Solo cadenas de texto del 0-100'
        WHEN C.name = 'numeroNomina' THEN 'Solo cadenas de texto del 0-99'
        WHEN C.name = 'ubicacion' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'RFC' THEN 'Solo cadenas de texto del 0-99'
		WHEN C.name = 'correo' THEN 'Solo cadenas de texto con formato de correo electronico del 0-99'
        WHEN C.name = 'contra' THEN 'Solo cadenas de texto con formato de contraseña del 0-99'
        WHEN C.name = 'telefono1' THEN 'Solo cadenas de texto del 0-9'
		WHEN C.name = 'telefono2' THEN 'Solo cadenas de texto del 0-9'
		 WHEN C.name = 'usuarioCliente' THEN 'Solo cadenas de texto del 0-50'
        WHEN C.name = 'fechaCliente' THEN 'Desde 1000-01-01 hasta 9999-12-31.'
		WHEN C.name = 'horaCliente' THEN 'Desde -838:59:59 hasta 838:59:59.'
        ELSE 'Desconocido'
    END) AS Dominio
FROM SYS.TABLES T
    INNER JOIN SYS.COLUMNS C ON T.OBJECT_ID = C.OBJECT_ID
    INNER JOIN sys.types TP ON C.user_type_id = TP.user_type_id
    INNER JOIN sys.objects d ON T.object_id = d.object_id 
    LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE T.name = 'Cliente'
ORDER BY T.name, C.column_id;
