CREATE DATABASE dbCineMaxCESDE;

USE dbCineMaxCESDE;

CREATE TABLE tblPeliculas(
	peliculaID INT IDENTITY PRIMARY KEY,
	nomPelicula VARCHAR(100) NOT NULL UNIQUE,
	duracionMinutos INT NOT NULL,
	clasificacionEdad CHAR(2) NOT NULL,
	precioBase FLOAT NOT NULL,
	fkGeneroID INT NOT NULL
);

CREATE TABLE tblGeneros(
  generoId INT IDENTITY PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL
);

CREATE TABLE tblSalas(
  salaId INT IDENTITY PRIMARY KEY,
  nombreSala VARCHAR(50) NOT NULL,
  capacidad INT NOT NULL
);

CREATE TABLE tblClientes(
  clienteId INT IDENTITY PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  correoElectronico VARCHAR(100) NOT NULL UNIQUE,
  telefono VARCHAR(10) NOT NULL
);

CREATE TABLE tblFunciones(
  funcionId INT IDENTITY PRIMARY KEY,
  horario DATETIME NOT NULL,
  fkPeliculaID INT NOT NULL,
  fkSalaId INT NOT NULL,
);

CREATE TABLE tblTickets(
  ticketId INT IDENTITY PRIMARY KEY,
  cantidadTickets TINYINT NOT NULL,
  precioTotalPagado FLOAT NOT NULL,
  fkClienteId INT NOT NULL,
  fkFuncionId INT NOT NULL,
  fechaCompra DATETIME DEFAULT GETDATE()
);

/*Creación de contraints*/

ALTER TABLE tblPeliculas
ADD CONSTRAINT FK_tblPeliculas_tblGeneros
FOREIGN KEY (fkGeneroID)
REFERENCES tblGeneros(GeneroID);

ALTER TABLE tblfunciones
ADD CONSTRAINT FK_tblFunciones_tblPeliculas
FOREIGN KEY (fkPeliculaID)
REFERENCES tblPeliculas(PeliculaID);

ALTER TABLE tblfunciones
ADD CONSTRAINT FK_tblFunciones_tblSalas
FOREIGN KEY (fkSalaID)
REFERENCES tblSalas(SalaID);

ALTER TABLE tblTickets
ADD CONSTRAINT FK_tblTickets_tblClientes
FOREIGN KEY (fkClienteID)
REFERENCES tblClientes(ClienteID);

ALTER TABLE tblTickets
ADD CONSTRAINT FK_tblTickets_tblFunciones
FOREIGN KEY (fkFuncionID)
REFERENCES tblFunciones(funcionID);

ALTER TABLE tblPeliculas
ALTER COLUMN clasificacionEdad CHAR(3) NOT NULL;

--Agregando el estado del cliente a la tabla tblClientes
ALTER TABLE tblClientes
ADD estadoId INT NOT NULL;


--Creación de la tabla para el estado del cliente
CREATE TABLE tblEstadoCliente(
	estadoId INT PRIMARY KEY IDENTITY (1,1),
	nomEstado VARCHAR(20) NOT NULL UNIQUE,
);

--Se crea la FK entre la tblClientes y tblEstadoCliente
ALTER TABLE tblClientes
ADD CONSTRAINT FK_tblClientes_tblEstadoCliente
FOREIGN KEY (estadoId)
REFERENCES tblEstadoCliente(estadoId);
