USE dbCineMaxCESDE;

--Agregando el estado activo a todos los registros de la tblClientes
UPDATE tblClientes
SET estadoId = 1;

select * from tblPeliculas;
select * from tblGeneros;
select * from tblSalas;
select * from tblFunciones;
select * from tblClientes;
select * from tblTickets;
select * from tblEstadoCliente;

/*Consultas*/

/*Cantidad de peliculas por genero*/
SELECT G.nombre, COUNT(peliculaID) AS cantidadPeliculas
FROM tblGeneros AS G
INNER JOIN tblPeliculas AS P
ON G.generoID = P.fkGeneroID
GROUP BY G.nombre;

/*Calcular la capacidad total de todas las salas de cine*/
SELECT SUM(capacidad)
FROM tblSalas;

--UPDATE: Actualizar la Capacidad de una sala (simulando que se vendió un ticket y hay menos asientos disponibles).
UPDATE tblSalas
SET capacidad = capacidad - 3
WHERE salaId = 5;

/*DELETE: Eliminar registros de la tabla Clientes que no hayan comprado un ticket en los últimos 3 meses
(simulación de limpieza de datos).*/
SELECT *
FROM tblClientes AS c
LEFT JOIN tblTickets AS t
ON c.clienteId = t.fkClienteId
--DATEADD permite sumar o restar intervalos de tiempo en este caso, a la fecha de compra
--Le estamos restando 3 meses tomando como referencia la fecha actual
WHERE t.fechaCompra <= DATEADD(month, -3, GETDATE());

UPDATE tblClientes
SET estadoId = 2
from tblClientes AS C
INNER JOIN tblTickets AS T
ON C.clienteId = T.fkClienteId
WHERE T.fechaCompra <= DATEADD(month, -3, GETDATE());

CREATE PROCEDURE usp_Cambio_Estado
/*Se piede el numero de meses para restarlo a la fecha actual y traer
Los clientes que coincidan con el criterio*/
@meses INT
AS
BEGIN
	UPDATE tblClientes
	--El estado dos es inactivo
	SET estadoId = 2
	from tblClientes AS C
	INNER JOIN tblTickets AS T
	ON C.clienteId = T.fkClienteId
	--Usando el parametro de entrada, le resta los meses ingresados a la fecha actual
	WHERE T.fechaCompra <= DATEADD(month, -@meses, GETDATE());
END;

EXEC usp_Cambio_Estado 1;

/*Reporte Avanzado (JOIN): Crear un SELECT que combine al menos tres tablas (Peliculas, Funciones, Salas)
para mostrar una lista detallada: "Título de la Película", "Horario", "Nombre de la Sala" y "Capacidad de la Sala"
(utilizando un INNER JOIN).*/

SELECT P.nomPelicula AS Pelicula, F.horario AS Horario, S.nombreSala AS Sala, S.capacidad AS Capacidad
FROM tblSalas AS S INNER JOIN tblFunciones AS F
ON S.salaId = F.fkSalaId
INNER JOIN tblPeliculas AS P
ON F.fkPeliculaId = P.peliculaID;

/*Procedimiento Almacenado: Crear un Procedimiento Almacenado llamado usp_Registrar_Compra
que reciba los parámetros necesarios (Cliente, Función, Cantidad, Precio)
e inserte automáticamente un registro en la tabla Tickets.*/

ALTER PROCEDURE usp_Registrar_Compra
@cantidadTickets TINYINT,
@precioTotal FLOAT,
@clienteId INT,
@funcionId INT
AS
BEGIN
	--Pregunta si existe el cliente
	IF NOT EXISTS (SELECT clienteId FROM tblClientes WHERE clienteId = @clienteId)
	BEGIN
		SELECT 'El cliente no existe'
	END
	ELSE
		--Pregunta si existe la función
		IF NOT EXISTS (SELECT funcionId FROM tblFunciones WHERE funcionId = @funcionId)
		BEGIN
			SELECT 'La funcion no existe'
		END
		ELSE
			--Inserta el registro en la tabla de tickets
			INSERT INTO tblTickets (cantidadTickets,precioTotalPagado,fkClienteId,fkFuncionId)
			VALUES(@cantidadTickets,@precioTotal,@clienteId,@funcionId);
			SELECT 'Compra realizada con éxito';
			--Le resta a la capacidad de la sala basado en la cantidad de tickets que compra el cliente
			UPDATE tblSalas
			SET capacidad = capacidad - @cantidadTickets
			FROM tblSalas AS S
			INNER JOIN tblFunciones AS F
			ON S.salaId = F.fkSalaId
			WHERE F.funcionId = @funcionId;

END;

EXEC usp_Registrar_Compra 3,32000,12,12;