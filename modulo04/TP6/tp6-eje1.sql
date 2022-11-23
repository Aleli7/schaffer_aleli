-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
-- (id,nombre, cp,id_provincia). Tener en cuenta que:
-- ● En un país hay muchas provincias.
-- ● En una provincia hay muchas localidades.
CREATE TABLE `paises` (
id INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`)
);

CREATE TABLE `provincias` (
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
idpais INT NOT NULL,
FOREIGN KEY (idpais) REFERENCES paises(id)
);

CREATE TABLE `localidades` (
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
cp VARCHAR(10) NOT NULL,
id_provincia INT NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- ● direccion (varchar)
-- ● id_localidad (pk localidad) –Esta es un relación con la tabla proveedores
-- ● email
-- ● telefono
-- ● fecha_ingreso
-- ● tms (timestamp)
ALTER TABLE empleados ADD direccion VARCHAR(45);
ALTER TABLE empleados ADD id_localidad INT NOT NULL;
ALTER TABLE empleados ADD email VARCHAR(45);
ALTER TABLE empleados ADD telefono VARCHAR(45);
ALTER TABLE empleados ADD fecha_ingreso DATE;
ALTER TABLE empleados ADD tms TIMESTAMP;
ALTER TABLE empleados ADD CONSTRAINT FOREIGN KEY (id_localidad) REFERENCES localidades(id);

-- 3. Modificar la tabla departamentos usando ALTER TABLE y agregar los campos:
-- ● gasto (double)
-- ● tms (timestamp)
ALTER TABLE departamentos ADD gasto DOUBLE;
ALTER TABLE departamentos ADD tms TIMESTAMP;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,
-- empleados.
INSERT INTO paises VALUES(1, 'Argentina');
INSERT INTO paises VALUES(2, 'Francia');
INSERT INTO paises VALUES(3, 'Suiza');
INSERT INTO paises VALUES(4, 'Corea del Sur');
INSERT INTO paises VALUES(5, 'Finlandia');

INSERT INTO provincias VALUES(1, 'Córdoba', 1);
INSERT INTO provincias VALUES(2, NULL, 2);
INSERT INTO provincias VALUES(3, NULL, 3);
INSERT INTO provincias VALUES(4, NULL,4);
INSERT INTO provincias VALUES(5, NULL,5);

INSERT INTO localidades VALUES(1, 'Cura Brochero','X5891', 1);
INSERT INTO localidades VALUES(2, 'Paris','75007', 2);
INSERT INTO localidades VALUES(3, 'Berna', '3000', 3);
INSERT INTO localidades VALUES(4, 'Busan', '600011', 4);
INSERT INTO localidades VALUES(5, 'Helsinki', '00100', 5);

INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true, 76000, '2019-12-31 23:59:59');
INSERT INTO departamentos VALUES(2, 'Sistemas', 176000, true, 58000, '2020-07-12 13:43:54');
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 300000, true, 110000, '2021-09-08 01:52:12');
INSERT INTO departamentos VALUES(4, 'Contabilidad', 147000, true, 77000, '2022-03-09 07:07:07');
INSERT INTO departamentos VALUES(5, 'Comercial', 123400, true, 52000, '2022-09-15 04:21:19');

INSERT INTO empleados VALUES(1, '20-41481224-1', 'Marcos', 'Galperin', 1, 1,'Los olivos', 1, 'marcosgalperin@gmial.com', '011-4563247', '2022-09-15', '2022-09-15 23:59:59');
INSERT INTO empleados VALUES(2, '27-42482596-3',' André', 'Le glacier', 2, 1, 'Arc de Triomphe', 2, 'Le.glacier.mode@outlook.com', '3654-876545', '2022-03-09', '2022-03-09 01:52:12');
INSERT INTO empleados VALUES(3, '23-37928596-3', 'Adrian', 'Rossi', 3, 1, 'Avenida la valle', 3, 'adrian.mode@outlook.com', '3756-450213', '2021-03-09', '2021-03-09 13:43:54');
INSERT INTO empleados VALUES(4, '27-37928596-7', 'Jeon', 'Kim', 4, 1, 'Gamcheon Culture Village', 4, 'jeonkim@outlook.com', '4565-764537', '2020-04-15', '2020-04-15 01:52:12');
INSERT INTO empleados VALUES(5, '24-42481327-3', 'Andrea', 'Musso', 5, 1, 'Avenida Carlos Paz', 5, 'andreamusso@gmail.com', '3757-409806', '2022-09-15', '2022-09-15 07:07:07');


-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos TO movimientos;

-- 6. Agregar las entidades:
-- ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),
-- cuit,id_localidad fk, estado,tms)
-- ● Cajas(id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
-- Un proveedor está en una localidad.\
CREATE TABLE `marcas` (
id INT NOT NULL PRIMARY KEY,
nombre VARCHAR(45),
descripcion VARCHAR(277),
imagen LONGBLOB,
id_proveedor INT, 
estado BOOLEAN NOT NULL,
tms TIMESTAMP
);

CREATE TABLE `productos` (
id INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
descripcion VARCHAR(277),
id_marca INT NOT NULL,
stock VARCHAR(45),
precio INT,
estado BOOLEAN NOT NULL,
tms TIMESTAMP,
PRIMARY KEY (`id`),
FOREIGN KEY (id_marca) REFERENCES marcas(id)
);

CREATE TABLE `proveedores` (
id INT NOT NULL PRIMARY KEY,
razon_social VARCHAR(45),
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
naturaleza VARCHAR(8),
cuit VARCHAR(45),
id_localidad INT,
estado BOOLEAN NOT NULL,
tms TIMESTAMP,
FOREIGN KEY (id_localidad) REFERENCES localidades(id)
);

CREATE TABLE `cajas` (
id INT NOT NULL,
horainicio DATETIME,
horacierre DATETIME,
estado BOOLEAN NOT NULL,
tms TIMESTAMP,
PRIMARY KEY (`id`)
);


-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
-- secuencialmente y no fallar.
INSERT INTO marcas VALUES (1, 'Nestle','Empresa multinacional suiza de alimentos y bebidas', NULL, 1, 1, '2022-10-12 01:07:12');
INSERT INTO marcas VALUES (2, 'Felfort', 'Empresa chocolatera Argentina multinacional', NULL, 2, 1, '2022-08-03 01:43:12');
INSERT INTO marcas VALUES (3, 'Milka', 'Marca de chocolate de origen suizo, producida y distribuida por Mondelēz International.', NULL, 3, 1, '2022-04-15 08:04:07');
INSERT INTO marcas VALUES (4, 'Bonafide', 'Empresa líder en la elaboración y comercialización de café,bombones y chocolates.', 'https://www.flexxus.com.ar/wp-content/uploads/2018/03/bonafide-logo.png', 4, 1, '2022-11-09 01:54:12');
INSERT INTO marcas VALUES (5, 'Toblerone', 'Marca de chocolate de origen suizo, producida y distribuida por Mondelēz International.', NULL, 5, 1, '2022-03-09 07:07:07');


INSERT INTO productos VALUES (1, 'Bananita dolca','El clásico con suave relleno sabor a banana y una deliciosa cobertura de chocolate.', 1, '27000', 110, 1, '2022-03-09 07:07:07');
INSERT INTO productos VALUES (2, 'Paragüita Felfort', 'Chocolate a base de cacao con forma de paragüita.', 2, '12000', 55, 1, '2022-09-15 04:21:19');
INSERT INTO productos VALUES (3, 'Chocolate Milka', 'Chocolate con leche. Con aromatizante idéntico al natural vainillina.', 3, '6879', 240, 1, '2022-11-09 01:54:12');
INSERT INTO productos VALUES (4, 'Chocolate en rama', 'Chocolate en rama bonafide duo, con leche sabor avellana y chocolate blanco.', 4, '9877', 170, 1, '2022-03-19 01:37:12');
INSERT INTO productos VALUES (5, 'Toblerone', 'chocolate con leche de forma triangular con miel y turrón de almendras, con avellanas y nueces.', 5, '4302', 700, 1, '2022-10-12 01:07:12');

INSERT INTO proveedores VALUES (1, 'Distribuidores S.A','Ruben', 'Pezuck', 'Física','30-65374826-3', 2, 1, '2022-03-09 07:07:07');
INSERT INTO proveedores VALUES (2, 'La Delicia Felipe Fort S.A', 'Felipe', 'Felfort','Jurídica','30-35475635-7', 3, 1, '2022-04-15 08:04:07');
INSERT INTO proveedores VALUES (3, 'Milka S.R.L','Valentina', 'Musso','Física','30-34583026-5', 4 , 1, '2022-03-03 01:43:12');
INSERT INTO proveedores VALUES (4, 'Bonafide S.A', 'Gerardo', 'Trinks', 'Jurídica','30-54537829-6', 1, 1, '2022-01-03 01:34:19');
INSERT INTO proveedores VALUES (5, 'Mondelēz International Inc','Theodor', 'Toble', 'Jurídica','30-23548726-4', 5, 1, '2022-01-03 01:27:22');

INSERT INTO cajas VALUES (1, '2022-09-07 07:59:59', '2022-09-07 09:59:59', 1, '2022-09-07 07:59:59');
INSERT INTO cajas VALUES (2, '2022-09-07 09:59:59', '2022-09-07 13:59:59', 1, '2022-09-07 09:59:59');
INSERT INTO cajas VALUES (3, '2022-09-07 13:59:59', '2022-09-07 18:59:59', 1, '2022-09-07 13:59:59');
INSERT INTO cajas VALUES (4, '2022-09-07 14:59:59', '2022-09-07 19:59:59', 1, '2022-09-07 12:59:59');
INSERT INTO cajas VALUES (5, '2022-09-07 17:59:59', '2022-09-07 20:59:59', 1, '2022-09-07 17:59:59');


-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.
SELECT departamentos.nombre, departamentos.presupuesto, departamentos.gasto, presupuesto-gasto AS diferencia FROM departamentos
WHERE departamentos.estado IS NOT NULL;


-- 9. Listar todas todas las proveedores agrupadas por pais. En la vista se deberia ver el nombre
-- del pais y el nombre de la localidad.
SELECT proveedores.nombre, proveedores.apellido, localidades.nombre AS Localidad, paises.nombre AS Pais FROM proveedores 
RIGHT JOIN localidades ON localidades.id = proveedores.id_localidad
RIGHT JOIN provincias ON provincias.id = localidades.id_provincia 
RIGHT JOIN paises ON paises.id = provincias.idpais GROUP BY paises.nombre;


-- 10. Modificar (UPADTE):
-- ● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ● la fecha_ingreso y la localidad de otro empleado.
UPDATE empleados SET empleados.telefono = '3741-987646' WHERE empleados.idemplaedo = 1;
UPDATE empleados SET fecha_ingreso = '2022-04-15', id_localidad = 2 WHERE empleados.idemplaedo = 4;

-- 11. Insertar 5 vendedores.
INSERT INTO vendedores VALUES (1, 'Claudia', 'Müller', '20-41481224-1', 1);
INSERT INTO vendedores VALUES (2, 'Jorge', 'Lucero', '27-22482596-3', 2);
INSERT INTO vendedores VALUES (3, 'Julieta', 'Marcos', '23-12334224-2', 1);
INSERT INTO vendedores VALUES (4, 'Valeria', 'Musso', '20-15881229-6', 3);
INSERT INTO vendedores VALUES (5, 'Franco', 'Sager', '21-34757483-7', 2);


-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
-- tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
ALTER TABLE movimientos ADD id_producto FOREGIN KEY REFERENCES productos(id);
ALTER TABLE movimientos ADD tms TIMESTAMP;
ALTER TABLE movimientos ADD id_producto INT;
ALTER TABLE movimientos ADD CONSTRAINT fk_id_productos FOREIGN KEY (id_producto) REFERENCES productos(id);
ALTER TABLE movimientos ADD estado BOOLEAN NOT NULL;
ALTER TABLE movimientos ADD tms TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE movimientos ADD tipo_movimiento VARCHAR(7);

-- 13. Insertar 5 movimientos distintos.

-- Aclaracion: Aunque no formara parte de la consigna, inserté registros en la tabla clientes porque sin ello 
-- no podria hacer inserts en la tabla movimientos (Error code 1452).
INSERT INTO clientes VALUES (1, 'Ines', 'Schaffer', '20-23012767-1', NULL, 1);
INSERT INTO clientes VALUES (2, 'Dirce','Pitrowsky','20-45832764-1', NULL, 2);
INSERT INTO clientes VALUES (3, 'Tomas','Sager', '20-45632187-1', NULL, 1);
INSERT INTO clientes VALUES (4, 'Thea', 'Rafael', '20-43251627-1', NULL, 2);
INSERT INTO clientes VALUES (5, 'Rodolfo','Müller', '20-34264352-1', NULL, 1);

INSERT INTO movimientos VALUES (1, 7, '2022-08-19', 1, 1, 1, 1,'2022-03-09 01:52:12','Pedido' );
INSERT INTO movimientos VALUES (2, 4, '2022-05-13', 2, 2, 2, 1,'2022-09-07 09:59:52', 'Ingreso');
INSERT INTO movimientos VALUES (3, 9, '2022-06-22', 3, 3, 3, 0, DEFAULT, 'Egreso');
INSERT INTO movimientos VALUES (4, 8, '2022-09-27', 4, 4, 4, 1, DEFAULT, 'Ingreso');
INSERT INTO movimientos VALUES (5, 3, '2022-01-07', 5, 5, 5, 1,'2022-09-15 07:07:07', 'Pedido');

-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- ● 2 movimientos que fueron cargados mal.
-- ● un pais que tenga al menos 3 localidades.
 
UPDATE movimientos SET estado = 0 WHERE movimientos.id = 1 OR movimientos.id = 2;

WITH duplicados (nombre, id, repetidos )
AS
(   SELECT nombre, id, ROW_NUMBER()
        OVER( PARTITION BY nombre, id
        ORDER BY nombre, id ) AS repetidos
    FROM paises  INNER JOIN provincias ON paises.id = provincias.idpais
INNER JOIN localidades ON provincias.id = localidades.id_provincia WHERE localidades.estado = 1
)
UPDATE duplicados SET duplicados = 'NULL' WHERE repetidos = 3;

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
-- 5 updates de la tabla producto.
UPDATE productos, movimientos SET stock = stock + movimientos.cantidad WHERE productos.id = movimientos.id_producto AND tipo_movimiento = 'Ingreso'; 
UPDATE productos, movimientos SET stock = stock - movimientos.cantidad WHERE productos.id = movimientos.id_producto AND tipo_movimiento = 'Egreso';

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE `parametros` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tms TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cosas JSON,
    id_usuario INT
);

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
-- “grupo": "ventas"}
-- ● {"zonaHoraria": "America/Argentina/BuenosAires"}
-- ● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
-- "Diciembre"}
-- ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
-- "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
-- "31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO parametros (id) VALUES (1);
INSERT INTO parametros (id) VALUES (2);
INSERT INTO parametros (id) VALUES (3);
INSERT INTO parametros (id) VALUES (4);
INSERT INTO parametros (id) VALUES (5);

INSERT INTO parametros (id_usuario) VALUES (1);
INSERT INTO parametros (id_usuario) VALUES (2);
INSERT INTO parametros (id_usuario) VALUES (3);
INSERT INTO parametros (id_usuario) VALUES (4);
INSERT INTO parametros (id_usuario) VALUES (5);

INSERT INTO `parametros` (cosas) VALUES (
'{"idDeLaCosa": 101, "permisos": "PUT, GET"}'
'{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",
“grupo": "ventas"}'
'{"zonaHoraria": "America/Argentina/BuenosAires"}'
'{"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":
"Diciembre"}'
'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
"31634912,57","egreso": "9757142,66"}}}'
);
