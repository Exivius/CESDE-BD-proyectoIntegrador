USE dbCineMaxCESDE;

---------------------------
-- 1. GENEROS (20)
---------------------------
INSERT INTO tblGeneros (nombre) VALUES
('Accion'),('Comedia'),('Drama'),('Terror'),('Romance'),
('Ciencia Ficcion'),('Aventura'),('Animacion'),('Suspenso'),('Fantasia'),
('Documental'),('Musical'),('Crimen'),('Misterio'),('Historia'),
('Guerra'),('Deporte'),('Western'),('Biografia'),('Familia');

---------------------------
-- 2. SALAS (20)
---------------------------
INSERT INTO tblSalas (nombreSala, capacidad) VALUES
('Sala 1',80),('Sala 2',90),('Sala 3',100),('Sala 4',110),('Sala 5',120);

---------------------------
-- 3. CLIENTES (20)
---------------------------
INSERT INTO tblClientes (nombre, edad, correoElectronico, telefono) VALUES
('Juan Perez',25,'juan.perez@gmail.com','3000000001'),
('Maria Gomez',30,'maria.gomez@gmail.com','3000000002'),
('Carlos Lopez',28,'carlos.lopez@gmail.com','3000000003'),
('Laura Martinez',22,'laura.martinez@gmail.com','3000000004'),
('Andres Torres',35,'andres.torres@gmail.com','3000000005'),
('Camila Ramirez',27,'camila.ramirez@gmail.com','3000000006'),
('David Herrera',31,'david.herrera@gmail.com','3000000007'),
('Sofia Castro',24,'sofia.castro@gmail.com','3000000008'),
('Jorge Moreno',40,'jorge.moreno@gmail.com','3000000009'),
('Valentina Vargas',21,'valentina.vargas@gmail.com','3000000010'),
('Felipe Rios',29,'felipe.rios@gmail.com','3000000011'),
('Daniela Ortiz',26,'daniela.ortiz@gmail.com','3000000012'),
('Sebastian Navarro',33,'sebastian.navarro@gmail.com','3000000013'),
('Paula Mendoza',23,'paula.mendoza@gmail.com','3000000014'),
('Luis Cruz',38,'luis.cruz@gmail.com','3000000015'),
('Natalia Silva',27,'natalia.silva@gmail.com','3000000016'),
('Mateo Reyes',20,'mateo.reyes@gmail.com','3000000017'),
('Juliana Pardo',32,'juliana.pardo@gmail.com','3000000018'),
('Diego Leon',36,'diego.leon@gmail.com','3000000019'),
('Isabella Mejia',19,'isabella.mejia@gmail.com','3000000020');

---------------------------
-- 4. PELICULAS (20)
---------------------------
INSERT INTO tblPeliculas (nomPelicula,duracionMinutos,clasificacionEdad,precioBase,fkGeneroID) VALUES
('Avengers Final',180,'+13',15000,1),
('Titanic',195,'+13',12000,5),
('El Conjuro',112,'+18',13000,4),
('Frozen',102,'TP',10000,8),
('Joker',122,'+18',14000,3),
('Interestelar',169,'+13',15000,6),
('Coco',105,'TP',10000,8),
('Gladiador',155,'+18',13000,15),
('Batman',176,'+13',15000,1),
('Toy Story',90,'TP',9000,8),
('Rapido y Furioso',130,'+13',14000,1),
('El Origen',148,'+13',15000,6),
('Deadpool',108,'+18',14000,2),
('Shrek',95,'TP',9000,8),
('Matrix',136,'+18',15000,6),
('Spiderman',120,'+13',14000,1),
('Cars',100,'TP',9000,8),
('Up',96,'TP',9500,8),
('It',135,'+18',13000,4),
('Avatar',162,'+13',15000,6);

---------------------------
-- 5. FUNCIONES (20)
---------------------------
INSERT INTO tblFunciones (horario,fkPeliculaID,fkSalaId) VALUES
('2026-05-01 10:00',1,1),('2026-05-01 12:00',20,2),
('2026-05-01 14:00',3,3),('2026-05-01 16:00',4,4),
('2026-05-01 18:00',5,5),('2026-05-01 20:00',6,5),
('2026-05-01 22:00',7,5),('2026-05-02 10:00',8,1),
('2026-05-02 12:00',9,3),('2026-05-02 14:00',10,1),
('2026-05-02 16:00',11,1),('2026-05-02 18:00',12,1),
('2026-05-02 20:00',13,2),('2026-05-02 22:00',14,2),
('2026-05-03 10:00',15,3),('2026-05-03 12:00',16,3),
('2026-05-03 14:00',17,4),('2026-05-03 16:00',18,3),
('2026-05-03 18:00',19,5),('2026-05-03 20:00',20,5);

---------------------------
-- 6. TICKETS (20)
---------------------------
INSERT INTO tblTickets (cantidadTickets,precioTotalPagado,fkClienteId,fkFuncionId,fechaCompra) VALUES
(2,30000,1,21,'2026-01-14 14:22:05'),
(1,12000,2,22,'2026-04-03 18:45:12'),
(3,39000,3,3,'2026-02-28 11:15:30'),
(2,20000,4,4,'2026-05-10 20:05:44'),
(4,56000,5,5,'2026-03-19 16:33:21'),
(1,15000,6,6,'2026-01-05 09:12:18'),
(2,20000,7,7,'2026-05-21 22:40:59'),
(3,39000,8,8,'2026-02-11 13:50:11'),
(1,15000,9,9,'2026-04-27 10:02:35'),
(2,18000,10,10,'2026-03-08 17:19:42'),
(3,42000,11,11,'2026-01-25 19:55:13'),
(2,30000,12,12,'2026-05-02 12:04:26'),
(1,14000,13,13,'2026-04-14 08:30:00'),
(2,18000,14,14,'2026-02-17 15:14:52'),
(3,45000,15,15,'2026-03-22 21:10:07'),
(1,14000,16,16,'2026-01-31 11:42:19'),
(2,18000,17,17,'2026-05-15 14:28:33'),
(3,28500,18,18,'2026-04-09 16:01:50'),
(2,26000,19,19,'2026-03-12 19:36:24'),
(1,15000,20,20,'2026-05-23 09:15:00');

--Agregando datos a la tblEstadoCliente
INSERT INTO tblEstadoCliente (nomEstado)
VALUES('Activo'),('Inactivo');