CREATE DATABASE  BD_Hotels;
USE  BD_Hotels;

CREATE TABLE Usuario(
idUsuario INT IDENTITY(1,1) PRIMARY KEY,
tipoUsuario VARCHAR(50) NOT NULL,
correo VARCHAR(100) NOT NULL,
contra VARCHAR(100) NOT NULL,
nombres VARCHAR(50) NOT NULL,
apellidoPaterno VARCHAR(50) NOT NULL,
apellidoMaterno VARCHAR(50) NOT NULL,
numeroNomina VARCHAR(100) NOT NULL,
fechaNacimiento DATE NOT NULL,
telefono1 VARCHAR(10) NOT NULL,
telefono2 VARCHAR(10) NULL,
usuarioRegistro VARCHAR(50) NOT NULL,
fechaRegistro DATE NOT NULL,
horaRegistro TIME NOT NULL


);

SELECT *FROM Usuario;

--Usuario para saber si la conexion fue exitosa
INSERT INTO Usuario (
    tipoUsuario,
    correo,
    contra,
    nombres,
    apellidoPaterno,
    apellidoMaterno,
    numeroNomina,
    fechaNacimiento,
    telefono1,
    telefono2,
    usuarioRegistro,
    fechaRegistro,
    horaRegistro
) VALUES (
    'Administrador',
    'juan.perez@example.com',
    'contrasena123',
    'Juan',
    'Pérez',
    'López',
    'A123456789',
    '1990-05-15',
    '5551234567',
    NULL,
    'admin',
    '2025-05-14',
    '09:30:00'
);

--Modificar la tabla
ALTER TABLE Usuario
ADD Activo BIT;

UPDATE Usuario
SET Activo = 1
WHERE nombres = 'Juan';

UPDATE Usuario
SET Activo = 1
WHERE idUsuario = idUsuario;


CREATE TABLE Hotel(
idHotel INT IDENTITY(1,1) PRIMARY KEY,
nombreHotel VARCHAR(100) NOT NULL,
ubicacion VARCHAR(100) NOT NULL,
domicilio VARCHAR(100) NOT NULL,
numeroPisos VARCHAR(100) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
fechaIniOpe VARCHAR(100) NOT NULL,
usuarioRegistro VARCHAR(100) NOT NULL,
fechaRegistro DATE NOT NULL,
horaRegistro TIME NOT NULL

);

CREATE TABLE Cliente(
idCliente INT IDENTITY(1,1) PRIMARY KEY,
nombreCompleto VARCHAR(100) NOT NULL,
apellidoMaterno VARCHAR(100) NOT NULL,
apellidoPaterno VARCHAR(100) NOT NULL,
ubicacion VARCHAR(100) NOT NULL,
RFC VARCHAR(100) NOT NULL,
correo VARCHAR(100) NOT NULL,
telefono1 VARCHAR(10) NOT NULL,
telefono2 VARCHAR(10)  NULL,
fechaNacimiento DATE NOT NULL,
estadoCivil VARCHAR(20),
usuarioCliente VARCHAR(50),
fechaCliente DATE NOT NULL,
horaRegistro TIME NOT NULL

);

CREATE TABLE Reserva(
folioFactura INT IDENTITY(100,10) PRIMARY KEY,
costoHospedaje DECIMAL(10,2) NOT NULL,
numeroDeNoches INT NOT NULL,
serviciosAdicionales VARCHAR(100) NOT NULL,
descuentosAplicados  DECIMAL(10,2) NOT NULL,
codigoReservacion UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
estadoReservacion VARCHAR(50) NOT NULL,
CheckIn BIT  NULL,
CheckOut BIT  NULL,
fechaReservacion DATE  NULL,
fechaCancelacion DATE  NULL,
anticipo DECIMAL(10,2)  NULL,
usuarioRegistro VARCHAR(50) NOT NULL,
montoTotal VARCHAR(20),
idCliente INT -- FK

);

ALTER TABLE Reserva
ADD 
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente);


CREATE TABLE TipoDeHabitacion(
idTipoHabitacion INT IDENTITY(1,1) PRIMARY KEY,
numeroCamas VARCHAR(100) NOT NULL,
tipoCamas VARCHAR(100) NOT NULL,
precioNochePersona VARCHAR(100) NOT NULL,
cantidadHabitacion VARCHAR(100) NOT NULL,
nivelHabitacion VARCHAR(100) NOT NULL,
caracteristicas VARCHAR(100) NOT NULL,
amenidades VARCHAR(10) NOT NULL,
cantidadPersonas VARCHAR(10)  NULL,
usuarioRegistro DATE NOT NULL,
fechaRegistro VARCHAR(20),
horaRegistro VARCHAR(50)

);

ALTER TABLE TipoDeHabitacion
ALTER COLUMN usuarioRegistro VARCHAR(50) NOT NULL;

ALTER TABLE TipoDeHabitacion
ALTER COLUMN  fechaRegistro DATE NOT NULL;

ALTER TABLE TipoDeHabitacion
ALTER COLUMN horaRegistro TIME NOT NULL;

ALTER TABLE TipoDeHabitacion
ALTER COLUMN cantidadPersonas INT NOT NULL;

ALTER TABLE TipoDeHabitacion
DROP COLUMN horaDeRegistro ;

ALTER TABLE TipoDeHabitacion
DROP COLUMN usuarioDeRegistro ;

ALTER TABLE TipoDeHabitacion
DROP COLUMN fechaDeRegistro;


ALTER TABLE Reserva
ADD idHotel INT;

ALTER TABLE Reserva ADD
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel);

CREATE TABLE Habitacion(
idHabitacion  INT IDENTITY(100,1) PRIMARY KEY,
estadoReservacion VARCHAR(50) NOT NULL,
idTipoHabitacion INT ,
FOREIGN KEY (idTipoHabitacion) REFERENCES TipoDeHabitacion(idTipoHabitacion)

);

--Tabla asociativa
CREATE TABLE RegistroHotel(
idRegistroHotel INT IDENTITY(1,1) PRIMARY KEY,
idUsuario INT ,
idHotel   INT ,
FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)

);

DROP TABLE RegistroHotel;
--Tabla asociativa
CREATE TABLE RegistroCliente(
idRegistroCliente INT IDENTITY(1,1) PRIMARY KEY,
idUsuario INT ,
idCliente  INT ,
FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)

);
DROP TABLE RegistroCliente;
--Tabla asociativa
CREATE TABLE ReservaDetalle(
idReservaDetalles INT IDENTITY(1,1),
numeroHabitaciones INT,
numeroHuespedesTotal INT,
idTipoHabitacion  INT ,
folioFactura INT,
FOREIGN KEY (idTipoHabitacion) REFERENCES tipoDeHabitacion(idTipoHabitacion),
FOREIGN KEY (folioFactura) REFERENCES Reserva(folioFactura)

);
ALTER TABLE ReservaDetalle
ALTER COLUMN numeroHabitaciones INT NOT NULL;

ALTER TABLE ReservaDetalle
ALTER COLUMN numeroHuespedesTotal INT NOT NULL;

