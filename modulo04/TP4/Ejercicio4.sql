
-- Ejercicio 1
DROP DATABASE IF EXISTS Institución_educativa;
CREATE DATABASE Institución_educativa;
USE Institución_educativa;

CREATE TABLE `Alumnos` (
  Cod_matricula INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) DEFAULT NULL,
  FechaNacimiento DATE,
  DNI INT,
  Email VARCHAR(45) DEFAULT NULL
);

INSERT INTO Alumnos  VALUES ('1', 'Andrea', 13-12-2004, '43287654', 'andrea@gmail.com');
INSERT INTO Alumnos  VALUES ('2', 'Pedro', 08-09-2002,'35875643', 'pedro@outlook.com');
INSERT INTO Alumnos  VALUES ('3', 'Aleli', 13-08-2003, '47938172', 'aleli@outlook.com');

CREATE TABLE `Curso` (
  Cod_curso INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_curso`)
);

INSERT INTO Curso (Cod_curso, nombre) VALUES ('1', 'Programacion');
INSERT INTO Curso (Cod_curso, nombre) VALUES ('2', 'Ingles');
INSERT INTO Curso (Cod_curso, nombre) VALUES ('3', 'Contabilidad');

CREATE TABLE `Alumno_curso` (
  id_alumno INT NOT NULL,
  id_curso INT NOT NULL,
  PRIMARY KEY (id_alumno, id_curso),
  FOREIGN KEY (id_alumno) references Alumnos(Cod_matricula) ON UPDATE CASCADE,
  FOREIGN KEY (id_curso) references Curso(Cod_curso) ON UPDATE CASCADE
);

CREATE TABLE `Profesor` (
  Id_Profesor INT NOT NULL PRIMARY KEY,
  Nombre_p VARCHAR(45),
  Especialidad VARCHAR(40),
  Email_p VARCHAR(45) DEFAULT NULL
);

INSERT INTO Profesor  VALUES ('1', 'Miguel', 'Programacion', 'miguel@gmail.com');
INSERT INTO Profesor  VALUES ('2', 'Aldana', 'Ingles', 'aldanacat@outlook.com');
INSERT INTO Profesor  VALUES ('3', 'Martin', 'Contabilidad', 'martin@gmail.com');

CREATE TABLE `Curso_profesor` (
  id_profesor INT NOT NULL,
  Id_curso INT NOT NULL,
  PRIMARY KEY (id_profesor, Id_curso),
  FOREIGN KEY (Id_profesor) references Profesor(Id_Profesor) ON UPDATE CASCADE,
  FOREIGN KEY (Id_curso) references Curso(Cod_curso) ON UPDATE CASCADE
);



-- Ejercicio 2

DROP DATABASE IF EXISTS Personal;
CREATE DATABASE Personal;
USE Personal;

CREATE TABLE `Pais` (
  Id_Pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nombre_pais VARCHAR(45)
);

 INSERT INTO Pais VALUES ('1', 'Argentina');
 INSERT INTO Pais VALUES ('2', 'Brasil');
 INSERT INTO Pais VALUES ('3', 'Chile');

CREATE TABLE `Provincia` (
  Id_Provincia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nombre_provincia VARCHAR(45)
);

INSERT INTO Provincia VALUES ('1', 'Misiones');
INSERT INTO Provincia VALUES ('2', 'Cordoba');
INSERT INTO Provincia VALUES ('3', 'Buenos_Aires');

CREATE TABLE `Pais_provincia` (
  id_provincia INT NOT NULL,
  id_pais INT DEFAULT NULL,
  PRIMARY KEY (id_provincia, id_pais),
  FOREIGN KEY (id_provincia) references Provincia(Id_Provincia) ON UPDATE CASCADE,
  FOREIGN KEY (id_pais) references Pais(Id_Pais) ON UPDATE CASCADE
);

CREATE TABLE `Localidad` (
  Id_localidad INT NOT NULL PRIMARY KEY,
  Nombre_localidad VARCHAR(45) NOT NULL,
  Codigo_postal INT NOT NULL,
  Id_Provincia INT NOT NULL,
  FOREIGN KEY (Id_Provincia) references Provincia (Id_Provincia)
);

INSERT INTO Localidad VALUES (1, 'Andresito', '3385', 1);
INSERT INTO Localidad VALUES (2, 'Cura Brochero', '7655', 2);
INSERT INTO Localidad VALUES (3, 'Mar del Plata', '7600', 3);

CREATE TABLE `Empleados` (
  Id_empleado INT NOT NULL PRIMARY KEY,
  Nombre_em VARCHAR(45) DEFAULT NULL,
  Telefono VARCHAR(45),
  DNI INT,
  Email VARCHAR(45) DEFAULT NULL,
  Fecha_alta DATE,  
  Id_localidad INT NOT NULL,
  FOREIGN KEY (Id_localidad) references Localidad(Id_localidad)
);

INSERT INTO Empleados VALUES (1, 'Camila', '3763546374', 34576354, 'Cami@gmail.com', 13/12/2022, 1);
INSERT INTO Empleados VALUES (2, 'Julieta', '0113453745', 34756743, 'Juliii@outlook.com', 12/09/2022, 3);
INSERT INTO Empleados VALUES (3, 'Ines', '3743543215', 23657354, 'Ines@gmial.com', 07/04/2022, 2);



-- Ejercicio 3

DROP DATABASE IF EXISTS Reservas;
CREATE DATABASE Reservas;
USE Reservas;

CREATE TABLE `Clientes` (
  Id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre_cliente VARCHAR(45) DEFAULT NULL,
  Telefono VARCHAR(45) DEFAULT NULL,
  DNI INT,
  direccion VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`Id_cliente`)
);

INSERT INTO Clientes VALUES (1, 'Juan', 3756645312,'45081754', NUll);
INSERT INTO Clientes VALUES (2, 'Andrea', 3456835436,'21381754', NUll);
INSERT INTO Clientes VALUES (3, 'Julieta', 2354984635,'29653767', 'Avenida Güemes, casa 7');

CREATE TABLE `Reservas` (
  Id_reserva INT NOT NULL AUTO_INCREMENT,
  Fecha_inicio date,
  Fecha_final date,
  Precio_total INT,
  Cantidad INT,
  PRIMARY KEY (`Id_reserva`)
);

  INSERT INTO Reservas VALUES (1, 12/03/2020, 12/04/2020, '76.000', 2);
  INSERT INTO Reservas VALUES (2, 10/04/2020, 12/05/2020, '100.000', 4);
  INSERT INTO Reservas VALUES (3, 09/05/2020, 12/06/2020, '104.000', 2);

CREATE TABLE `cliente_reserva` (
  id_cliente INT NOT NULL,
  id_reserva INT NOT NULL,
  PRIMARY KEY (id_cliente, id_reserva),
  FOREIGN KEY (id_cliente) references Clientes(Id_cliente),
  FOREIGN KEY (id_reserva) references Reservas(Id_reserva)
);

CREATE TABLE `Coche` (
  Matricula INT,
  Modelo VARCHAR(45),
  Color VARCHAR(45),
  Marca VARCHAR(45),
  Precio_alquiler INT,
  Gasolina_disponible VARCHAR(45),
  Id_reserva INT,
  PRIMARY KEY (`Matricula`),
  CONSTRAINT FOREIGN KEY (Id_reserva) references Reservas(Id_reserva)
);

INSERT INTO Coche VALUES (1, 'C4', 'rojo', 'citroen','25.000', '40 litros', '1');
INSERT INTO Coche VALUES (2, '308', 'azul', 'peugeot','30.000', '54 litros', '2');
INSERT INTO Coche VALUES (3, 'Clase c', 'gris', 'mercedez','40.000', '35 litros', '3');
