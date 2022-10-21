
USE Sistema_educativo;

CREATE TABLE `Alumnos` (
  `Cod_matricula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `FechaNacimiento` Date,
  `DNI` int
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cod_matricula`),
);

insert into Alumnos (Cod_matricula, nombre, FechaNacimiento) values ('1', 'Ana', '13/12/2004');
insert into Alumnos (Cod_matricula, nombre, FechaNacimiento) values ('2', 'Pedro', '08/09/2002');
insert into Alumnos (Cod_matricula, nombre, FechaNacimiento) values ('3', 'Alan', '03/02/2008');



CREATE TABLE `Alumno_curso` (
  `id_alumno` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (id_alumno, id_curso),
  FOREIGN KEY (id_alumno) references Alumnos(Cod_matricula) ON UPDATE CASCADE,
  FOREIGN KEY (id_curso) references Curso(Cod_curso) ON UPDATE CASCADE,


);

CREATE TABLE `Curso` (
  `Cod_curso` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT DEFAULT,
  PRIMARY KEY (`Cod_curso`),
);

insert into Alumnos (Cod_curso, nombre) values ('1', 'Programacion');
insert into Alumnos (Cod_curso, nombre) values ('1', 'Ingles');
insert into Alumnos (Cod_curso, nombre) values ('1', 'Contabilidad');


CREATE TABLE `Profesor` (
  `Id_Profesor` int NOT NULL AUTO_INCREMENT,
  `Nombre_p` varchar(45) DEFAULT NULL,
  `Especialidad` varchar(40),
  `email_p` varchar(45) DEFAULT NULL,

  PRIMARY KEY (`Id_Profesor`),
);

insert into Profesor (Id_Profesor, Nombre_p, Especialidad) values ('1', 'Miguel', 'Programacion');
insert into Profesor (Id_Profesor, Nombre_p, Especialidad) values ('2', 'Aldana', 'Ingles');
insert into Profesor (Id_Profesor, Nombre_p, Especialidad) values ('3', 'Juan', 'Contabilidad');


CREATE TABLE `Curso_profesor` (
  `id_profesor` INT NOT NULL,
  `Id_curso` INT NOT NULL,
  PRIMARY KEY (id_profesor, Id_curso),
  FOREIGN KEY (Id_profesor) references Profesor(Id_Profesor) ON UPDATE CASCADE,
  FOREIGN KEY (Id_curso) references Curso(Cod_curso) ON UPDATE CASCADE,

);









USE Personal; 


CREATE TABLE `Empleado` (
  `Id_empleado` int NOT NULL AUTO_INCREMENT,
  `Nombre_em` varchar(45) DEFAULT NULL,
  `Telefono` INT,
  `DNI` int
  `email` varchar(45) DEFAULT NULL,
  `Fecha_alta` date  
  `Id_localidad`
  PRIMARY KEY (`Id_empleado`),
  CONSTRAINT FOREIGN KEY (Id_localidad) references Localidad(Id_localidad),
);

insert into Empleado (Id_empleado, Nombre_em, Telefono, DNI, Fecha_alta, id_localidad) values ('1', 'Ricardo', '3757-432876','1');
insert into Empleado (Id_empleado, Nombre_em, Telefono, DNI, Fecha_alta, id_localidad) values ('2', 'Luisa', '3757-543876','2');
insert into Empleado (Id_empleado, Nombre_em, Telefono, DNI, Fecha_alta, id_localidad) values ('3', 'Ruby', '3757-344556','3');



CREATE TABLE `Localidad` (
  `Id_localidad` int NOT NULL,
  `Nombre_localidad` varchar NOT NULL,
  `Codigo_postal` INT NOT NULL,
  `Id_Provincia` INT NOT NULL,
  PRIMARY KEY (`Id_localidad`),
  CONSTRAINT FOREIGN KEY (Id_Provincia) references Provincia(Id_Provincia),
);

insert into Localidad (id_localidad, Nombre_localidad, Codigo_postal) values ('1', 'Cura_Brochero', '7655');
insert into Localidad (id_localidad, Nombre_localidad, Codigo_postal) values ('2', 'Andresito', '3385');
insert into Localidad (id_localidad, Nombre_localidad, Codigo_postal) values ('3', 'Eldorado', '3366');

CREATE TABLE `Provincia` (
  `Id_Provincia` int NOT NULL AUTO_INCREMENT,
  `Nombre_provincia` varchar(45) NOT DEFAULT,
  PRIMARY KEY (`Id_provincia`),
);

insert into Provincia (Id_Provincia, Nombre_provincia) values ('1', 'Misiones');
insert into Provincia (Id_Provincia, Nombre_provincia) values ('2', 'Cordoba');
insert into Provincia (Id_Provincia, Nombre_provincia) values ('1', 'Buenos_Aires');


CREATE TABLE `Pais_provincia` (
  `id_provincia` int NOT NULL,
  `id_pais` INT DEFAULT NULL,
  PRIMARY KEY (id_provincia, id_pais),
  FOREIGN KEY (id_provincia) references Provincia(Id_Provincia) ON UPDATE CASCADE,
  FOREIGN KEY (id_pais) references Pais(Id_Pais) ON UPDATE CASCADE,,
);

CREATE TABLE `Pais` (
  `Id_Pais` INT NOT NULL,
  `Nombre_pais` varchar,
   PRIMARY KEY (`Id_Pais`),
);

 insert into Pais (Id_Pais, Nombre_pais) values ('1', 'Argentina');
 insert into Pais (Id_Pais, Nombre_pais) values ('2', 'Brasil');
 insert into Pais (Id_Pais, Nombre_pais) values ('3', 'Chile');





USE Reservas;


CREATE TABLE `Clientes` (
  `Id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) DEFAULT NULL,
  `Telefono` INT DEFAULT NULL,
  `DNI` int
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_cliente`),
);

insert into Clientes (Id_cliente, nombre_cliente, DNI) values ('1', 'Juan', '45081754');
insert into Clientes (Id_cliente, nombre_cliente, telefono, DNI, direccion) values ('1', 'Andrea', '21381754');
insert into Clientes (Id_cliente, nombre_cliente, telefono, DNI, direccion) values ('1', 'Julieta', '29653767');



CREATE TABLE `cliente_reserva` (
  `id_cliente` int NOT NULL,
  `id_reserva` varchar NOT NULL,
  PRIMARY KEY (id_reserva, id_cliente),
  FOREIGN KEY (id_cliente) references Clientes(Id_cliente) ON UPDATE CASCADE,
  FOREIGN KEY (id_reserva) references Reservas(Id_reserva) ON UPDATE CASCADE,
  
);

CREATE TABLE `Reservas` (
  `Id_reserva` int NOT NULL AUTO_INCREMENT,
  `Fecha_inicio` date,
  `Fecha_final` date,
  `Precio_total` INT,
  `Cantidad` INT,
  PRIMARY KEY (`Id_reserva`),
);

  insert into Reservas (Id_reserva, Fecha_inicio, Fecha_final, Precio_total, Cantidad) values ('1', '12/03/2020', '12/04/2020', '76.000', 2);
  insert into Reservas (Id_reserva, Fecha_inicio, Fecha_final, Precio_total, Cantidad) values ('2', '10/04/2020', '12/05/2020', '100.000', 4);
  insert into Reservas (Id_reserva, Fecha_inicio, Fecha_final, Precio_total, Cantidad) values ('3', '09/05/2020', '12/06/2020', '104.000', 2);



CREATE TABLE `Coche` (
  `Matricula` INT,
  `Modelo` varchar,
  `Color` varchar,
  `Marca` varchar,
  `Precio_alquiler` int,
  `Gasolina_disponible` int,
  `Id_reserva` INT,
  PRIMARY KEY (`Matricula`),
  CONSTRAINT FOREIGN KEY (Id_reserva) references Reservas(Id_reserva)
);

insert into Coche (Matricula, Modelo, Color, Marca, Precio_alquiler, Gasolina_disponible, Id_reserva) values ('1', 'C4', 'rojo', 'citroen','25.000', '40 litros', '1');
insert into Coche (Matricula, Modelo, Color, Marca, Precio_alquiler, Gasolina_disponible, Id_reserva) values ('1', '308', 'azul', 'peugeot','30.000', '54 litros', '2');
insert into Coche (Matricula, Modelo, Color, Marca, Precio_alquiler, Gasolina_disponible, Id_reserva) values ('1', 'Clase c', 'gris', '','40.000', '35 litros', '3');