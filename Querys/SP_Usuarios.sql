--ESTE QUERY ES ESPECIFICAMENTE PARA PROCEDURES DE LOS USUARIOS 🗣🗣🗣

--INICIAR SESION
--Declaramos el procedure
CREATE PROCEDURE SP_ValidaUser 
--Variables que va a recibir el el procedure, en este caso:
--Correo
--Contraseña
@SP_Correo VARCHAR(100),
@SP_Contraseña VARCHAR(100)
AS
BEGIN

--DML usamos el select para seleccionar la tabla
SELECT *  --Seleciona la
FROM --Tabla de
Usuario --NombreTabla
WHERE  correo = @SP_Correo AND contra = @SP_Contraseña ;--Donde 

END

--GESTION DE USUARIOS , select, insert, update , delete

CREATE PROCEDURE SP_GestionDeUsuario
    @Opc CHAR(1),
    @SP_idUsuario INT = NULL,
    @SP_tipoUsuario VARCHAR(50) = NULL,
    @SP_correo VARCHAR(100) = NULL,
    @SP_contra VARCHAR(100) = NULL,
    @SP_nombres VARCHAR(50) = NULL,
    @SP_apellidoPaterno VARCHAR(50) = NULL,
    @SP_apellidoMaterno VARCHAR(50) = NULL,
    @SP_numeroNomina VARCHAR(100) = NULL,
    @SP_fechaNacimiento DATE = NULL,
    @SP_telefono1 VARCHAR(10) = NULL,
    @SP_telefono2 VARCHAR(10) = NULL,
    @SP_usuarioRegistro VARCHAR(50) = NULL,
    @SP_fechaRegistro DATE = NULL,
    @SP_horaRegistro TIME = NULL

AS 
BEGIN 

IF @Opc = 'S'  --Si la opcion es igual a select 
BEGIN -- Comienza

SELECT * --Selecciona la
FROM Usuario  --Tabla de
WHERE Activo = 1;  --Donde Activo sea igual a 1

END --fin del select

ELSE IF @Opc='I' --Entonces si la opcion es insert
BEGIN -- Comienza

INSERT INTO Usuario  --Inserta en la tabla de
(tipoUsuario,correo ,contra ,nombres,apellidoPaterno ,apellidoMaterno ,numeroNomina ,
fechaNacimiento ,telefono1 ,telefono2 ,usuarioRegistro ,fechaRegistro ,horaRegistro )
VALUES  -- los siguientes valores
(@SP_tipoUsuario,@SP_correo ,@SP_contra ,@SP_nombres ,@SP_apellidoPaterno ,@SP_apellidoMaterno ,@SP_numeroNomina
,@SP_fechaNacimiento ,@SP_telefono1 ,@SP_telefono2 , @SP_usuarioRegistro ,@SP_fechaRegistro ,@SP_horaRegistro)

END  --fin del insert

ELSE IF @Opc = 'U' --Entonces si la opcion es Update
BEGIN --Comienza

UPDATE Usuario  --Actualiza la tabla de Usuario
SET  -- los siguientes parametros

tipoUsuario = @SP_tipoUsuario,
correo = @SP_correo,
contra = @SP_contra ,
nombres = @SP_nombres,
apellidoPaterno = @SP_apellidoPaterno,
apellidoMaterno= @SP_apellidoMaterno ,
numeroNomina = @SP_numeroNomina,
fechaNacimiento= @SP_fechaNacimiento ,
telefono1 = @SP_telefono1,
telefono2= @SP_telefono2,
usuarioRegistro = @SP_usuarioRegistro,
fechaRegistro = @SP_fechaRegistro,
horaRegistro = @SP_horaRegistro

WHERE  idUsuario = @SP_idUsuario   --valida por medio de la llave

END  --Fin del update


ELSE IF @Opc = 'D' --Entonces si es igual a delete
BEGIN --Comienza

UPDATE Usuario  --Actualiza usuario 
SET Activo = 0  --En la variable
WHERE idUsuario = @SP_idUsuario  --Donde la llave sea igua a id usuario

END --Finaliza

END