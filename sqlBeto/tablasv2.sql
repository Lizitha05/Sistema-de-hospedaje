--Hecho por alberto
-- Crear base de datos y usarla
--CREATE DATABASE BD_Hotels1;
GO
USE BD_Hotels1;
GO

-- Tabla Usuario
CREATE TABLE Usuario (
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
    horaRegistro TIME NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);

-- Tabla Hotel
CREATE TABLE Hotel (
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

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nombreCompleto VARCHAR(100) NOT NULL,
    apellidoMaterno VARCHAR(100) NOT NULL,
    apellidoPaterno VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    RFC VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono1 VARCHAR(10) NOT NULL,
    telefono2 VARCHAR(10) NULL,
    fechaNacimiento DATE NOT NULL,
    estadoCivil VARCHAR(20),
    usuarioCliente VARCHAR(50),
    fechaCliente DATE NOT NULL,
    horaRegistro TIME NOT NULL
);

-- Tabla TipoDeHabitacion
CREATE TABLE TipoDeHabitacion (
    idTipoHabitacion INT IDENTITY(1,1) PRIMARY KEY,
    numeroCamas VARCHAR(100) NOT NULL,
    tipoCamas VARCHAR(100) NOT NULL,
    precioNochePersona VARCHAR(100) NOT NULL,
    cantidadHabitacion VARCHAR(100) NOT NULL,
    nivelHabitacion VARCHAR(100) NOT NULL,
    caracteristicas VARCHAR(100) NOT NULL,
    amenidades VARCHAR(10) NOT NULL,
    cantidadPersonas INT NOT NULL,
    usuarioRegistro VARCHAR(50) NOT NULL,
    fechaRegistro DATE NOT NULL,
    horaRegistro TIME NOT NULL
);

-- Tabla Habitacion
CREATE TABLE Habitacion (
    idHabitacion INT IDENTITY(100,1) PRIMARY KEY,
    estadoReservacion VARCHAR(50) NOT NULL,
    idTipoHabitacion INT,
    FOREIGN KEY (idTipoHabitacion) REFERENCES TipoDeHabitacion(idTipoHabitacion)
);

-- Tabla Reserva
CREATE TABLE Reserva (
    folioFactura INT IDENTITY(100,10) PRIMARY KEY,
    costoHospedaje DECIMAL(10,2) NOT NULL,
    numeroDeNoches INT NOT NULL,
    serviciosAdicionales VARCHAR(100) NOT NULL,
    descuentosAplicados DECIMAL(10,2) NOT NULL,
    codigoReservacion UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
    estadoReservacion VARCHAR(50) NOT NULL,
    CheckIn BIT NULL,
    CheckOut BIT NULL,
    fechaReservacion DATE NULL,
    fechaCancelacion DATE NULL,
    anticipo DECIMAL(10,2) NULL,
    usuarioRegistro VARCHAR(50) NOT NULL,
    montoTotal VARCHAR(20),
    idCliente INT,
    idHotel INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)
);

-- Tabla ReservaDetalle
CREATE TABLE ReservaDetalle (
    idReservaDetalles INT IDENTITY(1,1) PRIMARY KEY,
    numeroHabitaciones INT NOT NULL,
    numeroHuespedesTotal INT NOT NULL,
    idTipoHabitacion INT,
    folioFactura INT,
    FOREIGN KEY (idTipoHabitacion) REFERENCES TipoDeHabitacion(idTipoHabitacion),
    FOREIGN KEY (folioFactura) REFERENCES Reserva(folioFactura)
);

-- Tabla RegistroHotel
CREATE TABLE RegistroHotel (
    idRegistroHotel INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT,
    idHotel INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idHotel) REFERENCES Hotel(idHotel)
);

-- Tabla RegistroCliente
CREATE TABLE RegistroCliente (
    idRegistroCliente INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT,
    idCliente INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
