mysql -h localhost -u root -p

CREATE DATABASE Hoteleria;

USE Hoteleria;

CREATE TABLE Gerente (
    idGerente INT AUTO_INCREMENT PRIMARY KEY,
    NombreGerente VARCHAR(20) NOT NULL,
    ApellidoGerente1 VARCHAR(10) NOT NULL,
    ApellidoGerente2 VARCHAR(10) NOT NULL,
    Edad INT (3) NOT NULL,
    CorreoElectronico VARCHAR(40) NOT NULL UNIQUE,
    NumeroTelefonico VARCHAR(10) NOT NULL UNIQUE,
    NSS VARCHAR(9) NOT NULL UNIQUE,
    Domicilio VARCHAR(30) NOT NULL
);

CREATE TABLE Cliente
(
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(20) NOT NULL,
  ApellidoCliente1 VARCHAR(10) NOT NULL,
  ApellidoCliente2 VARCHAR(10) NOT NULL,
  CorreoElectronico VARCHAR(40) NOT NULL,
  NumeroTelefonico VARCHAR(10) NOT NULL,
  Direccion VARCHAR(60) NOT NULL
);

CREATE TABLE Habitacion
(
  idHabitacion INT AUTO_INCREMENT PRIMARY KEY,
  numeroHabitacion INT NOT NULL UNIQUE,
  tipo VARCHAR(12) NOT NULL,
  precio DECIMAL(8, 2) NOT NULL
);

CREATE TABLE Empleado
(
  idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
  NombreEmpleado VARCHAR(20) NOT NULL,
  ApellidoEmpleado1 VARCHAR(10) NOT NULL,
  ApellidoEmpleado2 VARCHAR(10) NOT NULL,
  Edad INT (3) NOT NULL,
  CorreoElectronico VARCHAR(40) NOT NULL UNIQUE,
  NumeroTelefonico VARCHAR(10) NOT NULL UNIQUE,
  NSS VARCHAR(9) NOT NULL UNIQUE,
  Domicilio VARCHAR(30) NOT NULL,
  Puesto VARCHAR(15) NOT NULL,
  Salario DECIMAL(8, 2) NOT NULL
);

CREATE TABLE Contratacion
(
  idContratacion INT AUTO_INCREMENT PRIMARY KEY,
  FechaContratacion DATE NOT NULL,
  idGerente INT NOT NULL,
  idEmpleado INT NOT NULL,
  FOREIGN KEY (idGerente) REFERENCES Gerente(idGerente),
  FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

CREATE TABLE Recepcionista
(
  idRecepcionista INT AUTO_INCREMENT PRIMARY KEY,
  idEmpleado INT NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

CREATE TABLE Camarista
(
  idCamarista INT AUTO_INCREMENT PRIMARY KEY,
  idEmpleado INT NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

CREATE TABLE PersonalMantenimiento
(
  idPersMantenimiento INT AUTO_INCREMENT PRIMARY KEY,
  idEmpleado INT NOT NULL,
  FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

CREATE TABLE Reservacion
(
  idReservacion INT AUTO_INCREMENT PRIMARY KEY,
  total DECIMAL(8, 2) NOT NULL,
  numeroDeHabitaciones INT NOT NULL,
  idCliente INT NOT NULL,
  idHabitacion INT NOT NULL,
  idRecepcionista INT NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
  FOREIGN KEY (idRecepcionista) REFERENCES Recepcionista(idRecepcionista)
);

CREATE TABLE LaborDeMantenimiento
(
  idReporte INT AUTO_INCREMENT PRIMARY KEY,
  actividad VARCHAR(100) NOT NULL,
  herramientaNecesaria VARCHAR(100) NOT NULL,
  insumosNecesarios VARCHAR(100) NOT NULL,
  idPersMantenimiento INT NOT NULL,
  idHabitacion INT NOT NULL,
  FOREIGN KEY (idPersMantenimiento) REFERENCES PersonalMantenimiento(idPersMantenimiento),
  FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion)
);

CREATE TABLE Limpieza
(
  idServicio INT AUTO_INCREMENT PRIMARY KEY,
  idHabitacion INT NOT NULL,
  idCamarista INT NOT NULL,
  FOREIGN KEY (idHabitacion) REFERENCES Habitacion(idHabitacion),
  FOREIGN KEY (idCamarista) REFERENCES Camarista(idCamarista)
);

CREATE TABLE RevisionYReporte
(
  idReporteGlobal INT AUTO_INCREMENT PRIMARY KEY,
  idGerente INT,
  idReservacion INT,
  idReporte INT,
  idServicio INT,
  FOREIGN KEY (idGerente) REFERENCES Gerente(idGerente),
  FOREIGN KEY (idReservacion) REFERENCES Reservacion(idReservacion),
  FOREIGN KEY (idReporte) REFERENCES LaborDeMantenimiento(idReporte),
  FOREIGN KEY (idServicio) REFERENCES Limpieza(idServicio)
);

