CREATE DATABASE Adidas;
use adidas;


## Inicio tablas -------------------------------------------------
# creamos tablas de secciones
create table seccionHombre(
id_seccionHombre int  not null auto_increment primary key,
tipo varchar (50) not null
);
create table seccionMujer(
id_seccionMujer int  not null auto_increment primary key,
tipo varchar (50) not null
);
create table seccionNinios(
id_seccionNinios int not null auto_increment primary key,
tipo varchar (50) not null
);

#creamos tablas de marcas
create table adidasOriginals(
id_adidasOriginals int not null auto_increment primary key,
estilo varchar(100) not null
);
create table adidasSsportwear(
id_adidasSsportwear int not null auto_increment primary key,
estilo varchar (100) not null
);
create table adidasTerrex(
id_adidasTerrex int not null auto_increment primary key,
estilo varchar (100) not null
);
create table adidasStellMccartney(
id_adidasStellMccartney int not null auto_increment primary key,
estilo varchar (100) not null
);
create table adidasEndPlasticWaste(
id_adidasEndPlasticWaste int not null auto_increment primary key,
estilo varchar (100) not null
);

# creamos tabla stock
create table stock(
id_stock int not null auto_increment primary key,
cantidad int not null
);

#creamos tabla colores
create table colores(
id_colores int not null auto_increment primary key,
color varchar (45) not null
);

#creamos tabla descuentoPromocion
create table descuentoPromocion(
id_descuentoPromocion int not null auto_increment primary key,
`porcentaje de descuento` int not null
);

#creamos tabla marcas
create table marcas(
id_marcas int not null auto_increment primary key,
marcas varchar (45) not null,
id_adidasOriginals int,
id_adidasSsportwear int,
id_adidasTerrex int, 
id_adidasStellMccartney int,
id_adidasEndPlasticWaste int,
foreign key (id_adidasOriginals) references adidasOriginals(id_adidasOriginals) on update cascade on delete cascade,
foreign key (id_adidasSsportwear) references adidasSsportwear(id_adidasSsportwear) on update cascade on delete cascade,
foreign key (id_adidasTerrex) references adidasTerrex(id_adidasTerrex) on update cascade on delete cascade,
foreign key (id_adidasStellMccartney) references adidasStellMccartney(id_adidasStellMccartney) on update cascade on delete cascade,
foreign key (id_adidasEndPlasticWaste) references adidasEndPlasticWaste(id_adidasEndPlasticWaste) on update cascade on delete cascade
);

#creamos tabla productos
create table productos(
id_productos int not null auto_increment primary key,
descripcion_productos varchar (100) not null,
precio_unitario int not null,
id_marcas int,
id_stock int not null,
id_descuentoPromocion int,
foreign key (id_marcas) references marcas(id_marcas) on update cascade on delete cascade,
foreign key (id_stock) references stock(id_stock) on update cascade on delete cascade,
foreign key (id_descuentoPromocion) references descuentoPromocion(id_descuentoPromocion) on update cascade on delete cascade
);

#creamos tabla categoria
create table categoria(
id_categoria int not null auto_increment primary key,
categoria varchar (50) not null,
id_productos int not null,
id_seccionHombre int,
id_seccionMujer int,
id_seccionNinios int,
foreign key (id_productos) references productos (id_productos) on update cascade on delete cascade,
foreign key (id_seccionHombre) references seccionhombre (id_seccionHombre) on update cascade on delete cascade,
foreign key (id_seccionHombre) references seccionmujer (id_seccionMujer) on update cascade on delete cascade,
foreign key (id_seccionNinios) references seccionninios (id_seccionNinios) on update cascade on delete cascade
);

#creamos tabla productos_color
create table productos_color(
id_producolor int not null auto_increment primary key,
id_productos int not null,
id_color int not null,
foreign key (id_productos) references productos(id_productos) on update cascade on delete cascade,
foreign key (id_color) references colores(id_colores) on update cascade on delete cascade
);

#creamos tabla forma de pago
create table formaPago(
id_formaPago int not null auto_increment primary key,
Metodo_pago varchar(45) not null
);

#creamos tabla clientes web
create table clientesWeb(
id_clientesWeb int not null auto_increment primary key,
nombre varchar (50) not null,
apellido varchar (50) not null,
genero varchar (30),
fecha_nacimiento date not null,
telefono_movil int not null,
email varchar (100) not null
);

#creamos tabla clientes adiclub
create table clientesAdiclub(
id_clientesAdiclub int not null auto_increment primary key, 
nombre varchar (50) not null,
apellido varchar (50) not null,
genero varchar (50) not null,
fecha_nacimiento date not null,
telefono_movil int not null,
email varchar (70) not null,
id_descuento int ,
password varchar(40) not null,
FOREIGN KEY (id_descuento) REFERENCES adidas.descuentopromocion (id_descuentoPromocion) ON DELETE CASCADE ON UPDATE CASCADE
);

#creamos tabla envios
create table envios(
id_envios int auto_increment primary key,
fechaHora_despacho datetime,
fechaHora_entrega datetime,
direccion_envio varchar (70) not null
);

#creamos tabla carrito
create table carrito(
id_carrito int not null auto_increment primary key,
id_clientesWeb int,
id_clientesAdiclub int,
id_formaPago int not null,
costos_envio int not null,
con_iva int not null,
monto_final decimal (9,2) not null,
id_envios int,
foreign key (id_clientesWeb) references clientesWeb (id_clientesWeb) on update cascade on delete cascade,
foreign key (id_clientesAdiclub) references clientesAdiclub (id_clientesAdiclub) on update cascade on delete cascade,
foreign key (id_formaPago) references formaPago (id_formaPago) on update cascade on delete cascade,
foreign key (id_envios) references envios (id_envios) on update cascade on delete cascade
);

#creamos tabla de relacion productos carrito
create table productosCarrito(
id_produCarrito int not null auto_increment primary key,
id_carrito int not null,
id_productos int not null,
cantidad_productos int not null,
submonto int not null,
foreign key (id_carrito) references carrito (id_carrito) on update cascade on delete cascade,
foreign key (id_productos) references productos (id_productos) on update cascade on delete cascade
);

#creamos tabla factura
create table factura(
id_factura int not null auto_increment primary key,
id_carrito int not null,
fecha_compra datetime not null,
foreign key (id_carrito) references carrito (id_carrito) on update cascade on delete cascade
);

#creamos tabla venta 
create table venta(
id_venta int not null auto_increment primary key,
id_factura int not null,
foreign key (id_factura) references factura (id_factura) on update cascade on delete cascade
);
## FINALIZAMOS LA CREACION DE TABLAS -------------------------------------------------------


## INSERTAMOS DATOS EN LAS DISTINTAS TABLAS--------------------------------------------------------------------------------------------------------
#Introduciomos datos a la tabla adidasendolasticwaste
INSERT INTO adidas.adidasendplasticwaste (id_adidasEndPlasticWaste, estilo) VALUES ('1', 'adidas_Parley'),('2', 'runForTheOceans'),('3', 'vegano'),
('4', 'tecnologia_primegreen'),('5', 'tecnologia_primeblue'),('6', 'sustentabilidad');

#Introduciomos datos a la tabla adidasoriginals
INSERT INTO adidas.adidasoriginals (estilo) VALUES ('calzado'),('ropa'),('accesorios'),('ZX'),('NMB'),('young_series'),('stan_Smith'),('superstar'),('adicolor');

#Modificamos dato id_adidasoriginasl de tabla adidasoriginals
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '1' WHERE (`id_adidasOriginals` = '10');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '2' WHERE (`id_adidasOriginals` = '11');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '3' WHERE (`id_adidasOriginals` = '12');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '4' WHERE (`id_adidasOriginals` = '13');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '5' WHERE (`id_adidasOriginals` = '14');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '6' WHERE (`id_adidasOriginals` = '15');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '7' WHERE (`id_adidasOriginals` = '16');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '8' WHERE (`id_adidasOriginals` = '17');
UPDATE `adidas`.`adidasoriginals` SET `id_adidasOriginals` = '9' WHERE (`id_adidasOriginals` = '18');

#Introducimos datos a la tabla adidassportwear
INSERT INTO adidas.adidasssportwear (id_adidasSsportwear, estilo) VALUES 
('1', 'Ropa_Hombre'),('2', 'Ropa_Mujer'),('3', 'novedades'),('4', 'ZNE'),('5', 'Stripes'),('6', 'clima'),('7', 'Essentials');

#Introducimos datos a la tabla adidasstellmccartney
INSERT INTO adidas.adidasstellmccartney (id_adidasStellMccartney,estilo) VALUES ('1','ropa'),('2','training');

#Introducimos datos a la tabla adidasterrex
INSERT INTO adidas.adidasterrex (id_adidasTerrex,estilo) VALUES ('1','zapatillas_hombre'),('2','zapatillas_mujer'),('3','zapatillas_ninios'),('4','ropa');

#Introducimos datos a la tabla seccionhombre
INSERT INTO adidas.seccionhombre (id_seccionHombre,tipo) VALUES ('1','calzado'),('2','ropa'),('3','accesorios'),('4','tendencias'),('5','deportes'),('6','para_principiantes');

#Introducimos datos a la tabla seccionmujer
INSERT INTO adidas.seccionmujer (id_seccionMujer,tipo) VALUES ('1','calzado'),('2','ropa'),('3','accesorios'),('4','tendencias'),('5','deportes'),('6','para_principiantes');

#Introducimos datos a la tabla seccionninios
INSERT INTO adidas.seccionninios (id_seccionNinios,tipo) VALUES ('1','calzado_ninios'),('2','calzado_ninias'),('3','deportes'),('4','ropa_ninios'),('5','ropa_ninias'),('6','para_principiantes');

#Introducimos datos a la tabla marcas
INSERT INTO adidas.marcas (id_marcas, marcas, id_adidasOriginals) VALUES 
('1', 'adidasOriginals', '1'),('2', 'adidasOriginals', '2'),('3', 'adidasOriginals', '3'),
('4', 'adidasOriginals', '4'),('5', 'adidasOriginals', '5'),('6', 'adidasOriginals', '6'),
('7', 'adidasOriginals', '7'),('8', 'adidasOriginals', '8'),('9', 'adidasOriginals', '9');
INSERT INTO adidas.marcas (id_marcas, marcas, id_adidasSsportwear) VALUES ('10', 'adidasSportwear', '1'),
('11', 'adidasSportwear', '2'),('12', 'adidasSportwear', '3'),('13', 'adidasSportwear', '4'),
('14', 'adidasSportwear', '5'),('15', 'adidasSportwear', '6'),('16', 'adidasSportwear', '7');
INSERT INTO adidas.marcas (id_marcas, marcas, id_adidasTerrex) VALUES ('17', 'adidasTerrex', '1'),('18', 'adidasTerrex', '2'),('19', 'adidasTerrex', '3'),
('20', 'adidasTerrex', '4');
INSERT INTO adidas.marcas (id_marcas, marcas, id_adidasStellMccartney) VALUES ('21', 'adidasStellMccartney', '1'),('22', 'adidasStellMccartney', '2');
INSERT INTO adidas.marcas (id_marcas, marcas, id_adidasEndPlasticWaste) VALUES ('23', 'adidasEndPlasticWaste', '1'),('24', 'adidasEndPlasticWaste', '2'),
('25', 'adidasEndPlasticWaste', '3'),('26', 'adidasEndPlasticWaste', '4'),('27', 'adidasEndPlasticWaste', '5'),('28', 'adidasEndPlasticWaste', '6');

#Introducimos datos tabla colores
INSERT INTO adidas.colores (id_colores, color) VALUES ('1', 'Core Black / Carbon / Grey Six'),
('2','Grey Two / Cloud White / Legend Ink'),('3','Grey Four /Grey Two / Pulse Lime'),('4','Grey Six / Grey Four / Core Black'),
('5','Core Black / Chalk White / Core Black'),('6','Magic Earth'),('7','Magic Lime'),('8','Violet Tone / Crystal White / Solar Red'),
('9','Grey Three / Grey Four / Turbo'),('10','black'),('11','Dash Grey / Cloud White / Sky Rush'),('12','Magic Mauve / Almost Pink / Turbo'),
('13','Beige Tone / Sandy Beige / Core Black'),('14','blanca / celeste'),('15','blanco / negro'),('16','negro / blanco'),
('17','blanco / rojo'),('18','rojo'),('19','Magic Grey / Silver Metallic / Blue Rush'),('20','Blue Tint / Silver Metallic / Blue Rush'),
('21', 'coral'),('22', 'blanco'),('23', 'Cloud White / Crew Navy / Night Flash'),('24', 'Core Black / Cloud White / Core Black'),
('25', 'rosa'),('26', 'Cloud White / Silver Metallic / Core Black'),('27', 'gris'),('28', 'multicolor'),('29', 'Core Black / Core Black / Red'),
('30', 'Cloud White / Cloud White / Cloud White'),('31', 'Cloud White / Cloud White / Core Black'),('32', 'amarillo'),('33', 'crema'),('34', 'blanco / celecte');


#insertamos valores a la tabla stock
INSERT INTO adidas.stock (id_stock, cantidad) VALUES ('1', '10'),
('2', '21'),('3', '45'),('4', '45'),('5', '213'),('6', '50'),('7', '96'),('8', '8'),('9', '66'),('10', '13'),('11', '15'),
('12', '26'),('13', '154'),('14', '22'),('15', '26'),('16', '12'),('17', '2'),('18', '5'),('19', '5'),('20', '88'),('21', '56'),
('22', '56'),('23', '1'),('24', '14'),('25', '66'),('26', '87'),('27', '16'),('28', '156'),('29', '3'),('30', '33'),('31', '325'),
('32', '25'),('33', '6'),('34', '1'),('35', '2'),('36', '0'),('37', '3'),('38', '4'),('39', '6'),('40', '5'),('41', '2'),
('42', '65'),('43', '2'),('44', '6'),('45', '13'),('46', '6'),('47', '1'),('48', '5'),('49', '63'),('50', '1'),('51', '56'),
('52', '6'),('53', '21'),('54', '12'),('55', '6'),('56', '1'),('57', '13'),('58', '1'),('59', '51'),('60', '631'),('61', '31'),
('62', '5'),('63', '13'),('64', '131'),('65', '31'),('66', '31'),('67', '31'),('68', '31'),('69', '31'),('70', '3'),('71', '51'),
('72', '3'),('73', '5'),('74', '1'),('75', '56'),('76', '156'),('77', '11'),('78', '5'),('79', '151'),('80', '51'),('81', '6');

#insertamos valores a la tabla descuentopromocion
INSERT INTO `adidas`.`descuentopromocion` (`id_descuentoPromocion`, `porcentaje de descuento`) VALUES ('1', '5'),('2', '10'),('3', '15'),('4', '20'),('5','40');
		
#Introducimos datos a la tabla productos
INSERT INTO adidas.productos (id_productos, descripcion_productos, precio_unitario, id_marcas,id_stock) VALUES
('1','ZAPATILLAS DE TRAIL RUNNING TERREX SOULSTRIDE','32999','17','1'),('2','ZAPATILLAS TERREX AX4 PRIMEGREEN HIKING','32999','17','2'),
('3','ZAPATILLAS TERREX BOAT S.RDY WATER','30999','17','3'),('4','MULTI 1/2 FL','17999','20','4'),('5','ZAPATILLAS DE TRAIL RUNNING TERREX SOULSTRIDE','32999','18','5'),
('6','ZAPATILLAS DE TRAIL RUNNING TRACEFINDER','20999','18','6'),('7','ZAPATILLAS ACUÁTICAS CLIMACOOL JAWPAW SLIP-ON','20999','17','7'),
('8','ZAPATILLAS ACUÁTICAS CLIMACOOL JAWPAW SLIP-ON','17999','18','8'),('9','BUZO TERREX EVERYHIKE HALF-ZIP FLEECE','20999','20','9'),
('10','ZAPATILLAS DE TRAIL RUNNING TRACEFINDER','18999','18','10'),('11','HYPERHIKER K','18999','19','11'),('12','ZAPATILLAS DE SENDERISMO TERREX HYPERHIKER CORTE BAJO','16999','19','12'),
('13','ZAPATILLAS AX2R (UNISEX)','18999','19','13'),('14','CAMISETA TITULAR ARGENTINA 22 MESSI','17999','10','15'),('15','CAMISETA TITULAR ARGENTINA 22 MESSI','18999','10','15'),
('16','SHORT TITULAR ARGENTINA 22','8999','10','16'),('17','BUZO CON CAPUCHA DAME 8 INNOVATION','24999','12','17'),('18','PANTALÓN ACAMPANADO ADIDAS X KARLIE KLOSS','24999','12','18'),
('19','PANTALÓN ACAMPANADO ADIDAS X KARLIE KLOSS','13999','11','19'),('20','CAMISETA LOCAL RIVER PLATE 21/22','14999','11','20'),('21','CALZAS LARGAS TECHFIT MARIMEKKO TIRO ALTO','36999','11','21'),
('22','ZAPATILLAS SUPERNOVA','36999','12','22'),('23','ZAPATILLAS ULTRABOOST 22 COLD.RDY','57999','13','23'),('24','GORRA DE CUATRO PANELES HEAT.RDY','6999','13','24'),
('25','MEDIAS CLÁSICAS ALPHASKIN (UNISEX)','4499','13','25'),('26','REMERA PARA CORRER RUN IT 3 TIRAS PB','8999','14','26'),('27','REMERA PARA CORRER RUN IT 3 TIRAS FAST','8999','14','27'),
('28','CAMPERA MARATHON 3 TIRAS','23999','14','28'),('29','REMERA DE COMPRESIÓN MANGAS LARGAS','10999','15','29'),('30','ZAPATILLAS CLIMACOOL VENT HEAT READY','34999','15','30'),
('31','CHOMBA AEROREADY DESIGNED TO MOVE SPORT','9999','15','31'),('32','ZAPATILLAS RUNFALCON','16999','16','32'),('33','TOP DEPORTIVO ESSENTIALS','7499','16','33'),
('34','REMERA ESSENTIALS','11398','21','34'),('35','CALZAS P ESS TIGHT','2799','16','35'),('36','ZAPATILLAS AX2R COMFORT (UNISEX)','20999','16','36'),('37','ZAPATILLAS DISNEY FORUM BOLD','37999','1','37'),
('38','ZAPATILLAS DISNEY FORUM BOLD','37999','26','38'),('39','ZAPATILLAS FORUM LOW','36999','26','39'),('40','OJOTAS ADILETTE','11999','1','40'),('41','BUZO DISNEY BAMBI ESTAMPADO','24999','2','41'),
('42','PANTALÓN DISNEY BAMBI ESTAMPADO','24999','2','42'),('43','BUZO CON CAPUCHA SKATEBOARDING 4.0 LOGO (GÉNERO NEUTRO)','18999','2','43'),('44','CAMPERA DEPORTIVA ADICOLOR CLASSICS PRIMEBLUE SST','26999','2','44'),
('45','MOCHILA','9999','3','45'),('46','MOCHILA HER STUDIO LONDON CLASSIC','11999','3','46'),('47','RIÑONERA','12999','3','47'),('48','GORRA TREFOIL BASEBALL (UNISEX)','6999','3','48'),
('49','MEDIAS CLÁSICAS ORIGINALS COLLAB 2 PARES','5999','3','49'),('50','ZAPATILLAS ZX 1K BOOST 2.0','30999','4','50'),('51','ZAPATILLAS DISNEY ZX 8000','38999','4','51'),
('52','ZAPATILLAS NMD_R1','38999','5','52'),('53','ZAPATILLAS NMD_R1','41999','5','53'),('54','ZAPATILLAS STAN SMITH DISNEY HULK AND THOR','27999','7','54'),('55','BUZO ESTAMPADO ALGODÓN ORGÁNICO','9999','7','55'),
('56','REMERA DE ALGODÓN ORGÁNICO DISNEY RENÉ','4498','7','56'),('57','ZAPATILLAS STAN SMITH','9098','7','57'),('58','ZAPATILLAS STAN SMITH MARIMEKKO','29999','7','58'),('59','ZAPATILLAS SUPERSTAR','31999','8','59'),
('60','ZAPATILLAS SUPERSTAR','28999','8','60'),('61','ZAPATILLAS SUPERSTAR 360','15999','8','61'),('62','ZAPATILLAS SUPERSTAR 360 DISNEY minie','13999','8','62'),('63','ZAPATILLAS SUPERSTAR 360 DISNEY mikey','13999','8','63'),
('64','BUZO ADICOLOR ESSENTIALS FELPA','17999','9','64'),('65','PANTALÓN DEPORTIVO SST BLOCKED','19999','9','65'),('66','CAMPERA DEPORTIVA SST BLOCKED','24999','9','66'),
('67','BUZO ADICOLOR ESSENTIALS TRIFOLIO CUELLO REDONDO','16999','9','67'),('68','ZAPATILLAS DURAMO SL','18999','24','68'),('69','ZAPATILLAS ULTRABOOST 22','55999','23','69'),
('70','ZAPATILLAS SUPERSTAR','31999','23','70'),('71','CAMPERA SST PRIMEBLUE','24999','23','71'),('72','ZAPATILLAS DE CICLISMO VELOSAMBA VEGANAS','32999','25','72'),
('73','ZAPATILLAS OZELLE CLOUDFOAM LIFESTYLE RUNNING','22999','26','73'),('74','CAMISETA ARQUERO ARGENTINA 22','16999','26','74'),('75','ZAPATILLAS RUN FALCON 2.0','18999','26','75'),
('76','ZAPATILLAS ADISTAR','41999','27','76'),('77','ZAPATILLAS PARA CORRER SOLARGLIDE 5','43999','27','77'),('78','ENTERIZO YOGA ACANALADO','20999','27','78'),
('79','CAMISETA TITULAR ARGENTINA 22','16999','28','79'),('80','ZAPATILLAS DURAMO SL 2.0','21999','28','80'),('81','ZAPATILLAS RESPONSE','23999','28','81'); 

INSERT INTO adidas.productos (id_productos,descripcion_productos,precio_unitario,id_marcas,id_stock,id_descuentoPromocion) VALUES (NULL,'CASMISETA BOCA JUNIORS','16999','2','5','5'),(NULL,'ZAPATILLAS RETROPY P9','47999','1','12','1');

#introduciomos datos a la tabla productos_color
INSERT INTO adidas.productos_color (id_producolor,id_productos,id_color) VALUE ('1','1','1'),('2','1','2'),
('3','1','3'),('4','1','4'),('5','2','29'),('6','3','6'),('7','3','1'),('8','4','2'),('9','5','3'),('10','5','4'),
('11','6','5'),('12','6','6'),('13','6','7'),('14','7','8'),('15','8','9'),('16','9','10'),('17','10','11'),
('18','11','12'),('19','12','30'),('20','12','31'),('21','12','33'),('22','13','29'),('23','13','28'),('24','14','27'),
('25','14','14'),('26','15','18'),('27','15','15'),('28','16','19'),('29','16','25'),('30','16','29'),('31','17','27'),
('32','18','26'),('33','18','21'),('34','19','18'),('35','19','10'),('36','20','18'),('37','20','15'),('38','20','16'),('39','21','1'),
('40','21','22'),('41','21','3'),('42','22','1'),('43','22','4'),('44','23','5'),('45','24','5'),('46','25','6'),('47','25','1'),
('48','26','2'),('49','27','32'),('50','27','34'),('51','28','5'),('52','29','18'),('53','29','19'),('54','29','16'),('55','30','10'),
('56','30','14'),('57','31','21'),('58','32','22'),('59','32','15'),('60','33','16'),('61','33','13'),('62','33','22'),('63','34','23'),
('64','34','33'),('65','35','30'),('66','35','32'),('67','36','25'),('68','36','18'),('69','36','10'),('70','37','25'),('71','37','27'),
('72','38','29'),('73','39','1'),('74','39','10'),('75','39','18'),('76','40','33'),('77','40','31'),('78','41','30'),('79','41','32'),
('80','41','20'),('81','42','2'),('82','42','4'),('83','42','6'),('84','43','8'),('85','44','10'),('86','44','12'),('87','45','14'),
('88','45','16'),('89','46','18'),('90','46','20'),('91','46','22'),('92','47','24'),('93','47','26'),('94','48','7'),('95','49','6'),	
('96','49','5'),('97',	'50	',10),('98','50','18'),('99','51','10'),('100','51','18'),('101','52','28'),('102','53','30'),('103','53','32'),
('104','54','34'),('105','54','33'),('106','54','31'),('107','55','29'),('108','55','27'),('109','56','25'),('110','57','23'),('111','58','21'),
('112','58','19'),('113','59','17'),('114','60','15'),('115','60','13'),('116','61','11'),('117','61','9'),('118','62','7'),('119','62','5'),
('120','63','28'),('121','64','6'),('122','65','5'),('123','65','17'),('124','66','30'),('125','67','18'),('126','67','10'),('127','68','11'),
('128','68','31'),('129','68','21'),('130','69','20'),('131','69','33'),('132','70','18'),('133','70','22'),('134','71','11'),('135','72','10'),
('136','72','6'),('137','73','7'),('138','73','5'),('139','73','17'),('140','74','14'),('141','74','18'),('142','75','18'),('143','76','19'),
('144','76','13'),('145','77','11'),('146','78','28'),('147','78','27'),('148','79','24'),('149','79','31'),('150','79','30'),('151','80','30'),
('152','80','32'),('153','80','33'),('154','81','31'),('155','81','30'),('156','81','1'),('157','81','18');


#insertamos valores a la tabla categoria
INSERT INTO adidas.categoria (id_categoria, id_productos, categoria, id_seccionHombre) VALUES ('1','1','hombre','1'),('2','1','hombre','5'),
('3','2','hombre','1'),('4', '3', 'hombre', '1'),('5', '4', 'hombre', '2'),('11', '7', 'hombre ', '1'),('21', '15', 'hombre', '5'),('22', '16', 'hombre', '5'),
('24', '17', 'hombre', '2'),('30', '21', 'hombre', '1'),('31', '21', 'hombre', '5'),('34', '22', 'hombre', '1'),('36', '23', 'hombre', '3'),('38', '24', 'hombre', '3'),
('40', '25', 'hombre', '5'),('41', '25', 'hombre', '2'),('44', '27', 'hombre', '2'),('46', '28', 'hombre', '5'),('47', '29', 'hombre', '5'),('48', '29', 'hombre', '1'),
('49', '30', 'hombre', '2'),('50', '31', 'hombre', '5'),('51', '31', 'hombre', '1'),('60', '38', 'hombre', '1'),('62', '39', 'hombre', '1'),('66', '42', 'hombre', '2'),
('68', '43', 'hombre', '2'),('69', '44', 'hombre', '3'),('75', '47', 'hombre', '3'),('76', '48', 'hombre', '3'),('78', '49', 'hombre', '1'),('81', '51', 'hombre', '1'),
('83', '52', 'hombre', '1'),('85', '53', 'hombre', '1'),('100', '64', 'hombre', '2'),('101', '65', 'hombre', '2'),('102', '66', 'hombre', '4'),('103', '66', 'hombre', '2'),
('104', '67', 'hombre', '5'),('107', '67', 'hombre', '1'),('108', '68', 'hombre', '1'),('109', '68', 'hombre', '5'),('115', '71', 'hombre', '5'),('117', '72', 'hombre', '5'),
('118', '72', 'hombre', '1'),('119', '73', 'hombre', '5'),('122', '75', 'hombre', '1'),('123', '75', 'hombre', '5'),('126', '76', 'hombre', '1'),('127', '76', 'hombre', '5'),
('129', '78', 'hombre', '5'),('130', '78', 'hombre', '2');
INSERT INTO adidas.categoria (id_categoria, id_productos, categoria, id_seccionMujer) VALUES ('6', '5', 'mujer ', '1'),('7', '5', 'mujer', '5'),
('8', '2', 'mujer', '1'),('9', '6', 'mujer', '1'),('10', '6', 'mujer', '5'),('12', '8', 'mujer', '1'),('13', '9', 'mujer', '2'),('14', '10', 'mujer', '4'),
('25', '18', 'mujer', '2'),('26', '18', 'mujer', '5'),('28', '20', 'mujer', '2'),('29', '20', 'mujer', '5'),('32', '21', 'mujer','5'),('33', '21', 'mujer','1'),
('35', '22', 'mujer','1'),('37', '23', 'mujer', '3'),('39', '24', 'mujer', '3'),('42', '26', 'mujer', '5'),('43', '26', 'mujer', '2'),('45', '27', 'mujer', '5'),
('52', '31', 'mujer', '5'),('53', '32', 'mujer', '5'),('54', '33', 'mujer', '2'),('55', '34', 'mujer', '2'),('58', '36', 'mujer', '1'),('59', '37', 'mujer', '1'),
('61', '38', 'mujer', '1'),('63', '39', 'mujer', '1'),('64', '40', 'mujer', '2'),('65', '41', 'mujer', '2'),('67', '42', 'mujer', '2'),('70', '44', 'mujer', '3'),
('72', '46', 'mujer', '3'),('74', '47', 'mujer', '3'),('77', '48', 'mujer', '3'),('79', '49', 'mujer', '1'),('80', '50', 'mujer', '1'),('82', '51', 'mujer', '1'),
('84', '52', 'mujer', '1'),('90', '56', 'mujer', '1'),('91', '57', 'mujer', '1'),('92', '58', 'mujer', '1'),('95', '60', 'mujer', '4'),('96', '60', 'mujer', '1'),
('99', '63', 'mujer', '2'),('105', '67', 'mujer', '5'),('106', '67', 'mujer', '1'),('110', '68', 'mujer', '1'),('111', '68', 'mujer', '5'),('112', '69', 'mujer', '1'),
('113', '70', 'mujer', '2'),('114', '70', 'mujer', '3'),('116', '71', 'mujer', '5'),('120', '74', 'mujer', '5'),('121', '74', 'mujer', '1'),('124', '75', 'mujer', '1'),
('125', '75', 'mujer', '5'),('128', '77', 'mujer', '2'),('131', '78', 'mujer', '5'),('132', '79', 'mujer', '5'),('133', '79', 'mujer', '1'),('134', '80', 'mujer', '5'),
('135', '80', 'mujer', '1');
INSERT INTO adidas.categoria (id_categoria, id_productos, categoria, id_seccionNinios) VALUES ('15', '11', 'ninios', '1'),('16', '11', 'ninios', '2'),
('17', '12', 'ninios', '1'),('18', '13', 'ninios', '1'),('19', '13', 'ninios', '2'),('20', '14', 'ninios', '3'),('23', '16', 'ninios', '3'),('27', '19', 'ninio', '3'),
('56', '35', 'ninios', '1'),('57', '35', 'ninios', '2'),('71', '45', 'ninios', '6'),('73', '47', 'ninios', '6'),('86', '54', 'ninios', '4'),('87', '54', 'ninios', '5'),
('88', '55', 'ninios', '4'),('89', '55', 'ninios', '5'),('93', '59', 'ninios', '1'),('94', '59', 'ninios', '2'),('97', '61', 'ninios', '2'),('98', '62', 'ninios', '1');

#insertamos valores a la tabla formapago
INSERT INTO adidas.formapago (id_formaPago, Metodo_pago) VALUES ('1', 'Efectivo'),('2', 'Debito'),('3', 'Credito');

#insertamos valores a la tabla clientesweb
INSERT INTO adidas.clientesweb (id_clientesWeb, nombre, apellido, genero, fecha_nacimiento, telefono_movil, email) VALUES 
('1', 'Pedro', 'Funes', 'M', '1994-12-18', '1120350469', 'pedro@gmail.com'),('2', 'Carlos', 'Slim', 'M', '1975-09-05', '1165329402', 'carlos@gmail.com'),
('3', 'Brisa', 'Tela', 'F', '1984-10-14', '1169854387', 'brisa@gmail.com'),('4', 'Juan', 'Teco', 'M', '1998-01-29', '1116846547', 'juanteco@gmail.com'),
('5', 'Elsa', 'Perez', 'F', '1989-02-06', '1112544568', 'elsa@gmail.com'),('6', 'Juan', 'Perez', 'M', '1990-03-07', '1140654845', 'juanperez@gmail.com');


#insertamos valores a la tabla clientesadiclub
INSERT INTO adidas.clientesadiclub (id_clientesAdiclub, nombre, apellido, genero, fecha_nacimiento, telefono_movil,email,password) VALUES 
('1', 'Julieta', 'Ramello', 'F', '1989-05-19', '1148756925','jullirame@gmail.com','july154'),('2', 'Nicolas', 'Zarate', 'M', '1984-12-21', '1156982305','nicoz@gmail.com','niconico12'),
('3', 'Franchesca', 'Soria', 'F', '1999-06-19', '1145600230','franche99@gmail.com','franche245'),('4', 'Marcos', 'Juarez', 'M', '2001-11-26', '1120305469','marcosj01@gmail.com','marcoste18');

#actualizamos descuentos para los clientesadiclub
UPDATE adidas.clientesadiclub SET id_descuento = '3' WHERE (id_clientesAdiclub = '1');
UPDATE adidas.clientesadiclub SET id_descuento = '3' WHERE (id_clientesAdiclub = '2');
UPDATE adidas.clientesadiclub SET id_descuento = '3' WHERE (id_clientesAdiclub = '3');
UPDATE adidas.clientesadiclub SET id_descuento = '3' WHERE (id_clientesAdiclub = '4');

#insertamos datos a la tabla envios
INSERT INTO adidas.envios (id_envios, fechaHora_despacho, fechaHora_entrega, direccion_envio) VALUES ('1', '2022-08-15 09:38:00', '2022-08-15 12:10:00', 'Arieta 5533 V.Luzuriaga');

#insertamos datos en la tabla carrito
INSERT INTO adidas.carrito (id_carrito, id_ClientesAdiclub, id_formapago, costos_envio, con_iva, monto_final) VALUES  ('1', '2', '3', '0', '9449', '46279');
INSERT INTO adidas.carrito (id_carrito, id_ClientesAdiclub, id_formapago, costos_envio, con_iva, monto_final,id_envios) VALUES('2', '1', '1', '500', '1889', '11388','1');

#insertamos datos en la tabla productos_carrito
INSERT INTO adidas.productoscarrito (id_producarrito, id_carrito, id_productos, cantidad_productos, submonto) VALUES 
('1', '1', '18', '2', '33998'),('2', '1', '50', '1', '10999'),('3', '2', '23', '1', '8999');

#insertamos datos en la tabla factura 
INSERT INTO adidas.factura (id_factura,id_carrito,fecha_compra) VALUES ('1','1','2022-08-10 18:40:00'),('2','2','2022-08-14 14:44:00');

#insertamos datos a la tabla ventas
INSERT INTO adidas.venta (id_venta,id_factura) VALUES ('1','1'),('2','2');

# FINALIZAMOS LA INSERCION DE DATOS EN LAS TABLAS -------------------------------------------------------------


# INICIAMOS LA CREACION DE DISTINTAS VISTAS--------------------------------------------------------------------

#creamos vistas sobre los distintos tipos de clientes una para los clientes adiclub y otra para los clientes web
CREATE VIEW clientes_adiclub AS (SELECT concat(clientesadiclub.nombre,' ',clientesadiclub.apellido)as `nombre completo`,
clientesadiclub.genero as sexo,clientesadiclub.fecha_nacimiento,clientesadiclub.telefono_movil as cel,
clientesadiclub.email, descuentopromocion.`porcentaje de descuento` as `descuento de %` FROM clientesadiclub 
INNER JOIN descuentopromocion WHERE clientesadiclub.id_descuento=descuentopromocion.id_descuentoPromocion);

CREATE VIEW clientes_web AS (SELECT concat(clientesweb.nombre,clientesweb.apellido)as `nombre completo`,
clientesweb.genero as sexo,clientesweb.fecha_nacimiento,clientesweb.telefono_movil as cel,
clientesweb.email FROM clientesweb);

#creamos la vista para visualizar los distintos colores de los productos
CREATE VIEW colores_de_productos AS 
SELECT productos.id_productos as id, productos.descripcion_productos as producto, colores.color, productos.precio_unitario 
FROM adidas.productos_color
INNER JOIN adidas.productos on productos_color.id_productos=productos.id_productos
INNER JOIN adidas.colores where productos_color.id_color=colores.id_colores
ORDER BY productos.id_productos ASC;

#creamos vistas para visualizar los envios realizados respecto al clientes
CREATE VIEW envios_clientesweb AS 
SELECT envios.id_envios AS id, envios.fechaHora_entrega AS entrega, envios.direccion_envio, clientesweb.nombre,clientesweb.apellido,clientesweb.telefono_movil AS cel,clientesweb.email FROM envios
INNER JOIN carrito ON envios.id_envios=carrito.id_envios
INNER JOIN clientesweb ON carrito.id_ClientesWeb=clientesweb.id_clientesWeb ;

CREATE VIEW envios_adiclub AS 
SELECT envios.id_envios AS id, envios.fechaHora_entrega AS entrega, envios.direccion_envio, clientesadiclub.nombre,clientesadiclub.apellido,clientesadiclub.telefono_movil AS cel,clientesadiclub.email FROM envios
INNER JOIN carrito ON envios.id_envios=carrito.id_envios
INNER JOIN clientesadiclub ON carrito.id_ClientesAdiclub=clientesadiclub.id_clientesAdiclub ;
--------
#creamos vista para el resumen carrito
CREATE VIEW resumen_pedido1 AS 
SELECT sum(cantidad_productos),costos_envio AS Entrega,monto_final AS TOTAL,con_iva AS `(Iva incluido )` 
FROM adidas.carrito
INNER JOIN adidas.productoscarrito ON carrito.id_carrito=productoscarrito.id_carrito WHERE carrito.id_carrito=1;

CREATE VIEW resumen_pedido2 AS 
SELECT sum(cantidad_productos),costos_envio AS Entrega,monto_final AS TOTAL,con_iva AS `(Iva incluido )` 
FROM adidas.carrito
INNER JOIN adidas.productoscarrito ON carrito.id_carrito=productoscarrito.id_carrito WHERE carrito.id_carrito=2;

#creamos vista para consultar venta segun tipo de cliente 
CREATE VIEW consulta_ventas_Adiclub AS 
SELECT id_factura, CONCAT ( clientesadiclub.nombre,' ',clientesadiclub.apellido)AS `comprador Adiclub`,clientesadiclub.email,monto_final AS Importe,formapago.Metodo_pago,fecha_compra AS fecha 
FROM adidas.carrito  
INNER JOIN adidas.clientesadiclub on carrito.id_ClientesAdiclub=clientesadiclub.id_ClientesAdiclub 
INNER JOIN adidas.formapago on carrito.id_formapago=formapago.id_formaPago
INNER JOIN adidas.factura on carrito.id_carrito=factura.id_carrito;

CREATE VIEW consulta_ventas_Web AS 
SELECT id_factura, CONCAT ( clientesweb.nombre,' ',clientesweb.apellido)AS `comprador Adiclub`,clientesweb.email,monto_final AS Importe,formapago.Metodo_pago,fecha_compra AS fecha 
FROM adidas.carrito  
INNER JOIN adidas.clientesweb on carrito.id_ClientesWeb=clientesweb.id_clientesWeb 
INNER JOIN adidas.formapago on carrito.id_formapago=formapago.id_formaPago
INNER JOIN adidas.factura on carrito.id_carrito=factura.id_carrito;

#creamos vista del estilo calzado de la seccion hombre
create view calzado_hombre as 
select descripcion_productos,precio_unitario as precio from productos
inner join adidas.categoria on productos.id_productos=categoria.id_productos
inner join adidas.seccionhombre on categoria.id_seccionHombre=seccionhombre.id_seccionHombre where seccionhombre.id_seccionHombre=1;

#creamos vista de la tabla productos con la categoria, estilo y marca correspondiente de Hombre
create view ProductosDescripcionH as 
SELECT productos.id_productos,descripcion_productos,precio_unitario,categoria,tipo,marcas,cantidad as stock FROM adidas.productos
inner join adidas.categoria on categoria.id_productos=productos.id_productos
inner join adidas.seccionhombre on seccionhombre.id_seccionHombre=categoria.id_seccionHombre
inner join adidas.marcas on marcas.id_marcas=productos.id_marcas
inner join adidas.stock on stock.id_stock=productos.id_stock;

#creamos vista de la tabla productos con la categoria, estilo y marca correspondiente de Mujer
create view ProductosDescripcionM as 
SELECT productos.id_productos,descripcion_productos,precio_unitario,categoria,tipo,marcas,cantidad as stock FROM adidas.productos
inner join adidas.categoria on categoria.id_productos=productos.id_productos
inner join adidas.seccionmujer on seccionmujer.id_seccionMujer=categoria.id_seccionMujer
inner join adidas.marcas on marcas.id_marcas=productos.id_marcas
inner join adidas.stock on stock.id_stock=productos.id_stock;

#creamos vista de la tabla productos con la categoria, estilo y marca correspondiente de Ninios
create view ProductosDescripcionN as 
SELECT productos.id_productos,descripcion_productos,precio_unitario,categoria,tipo,marcas,cantidad as stock FROM adidas.productos
inner join adidas.categoria on categoria.id_productos=productos.id_productos
inner join adidas.seccionninios on seccionninios.id_seccionNinios=categoria.id_seccionNinios
inner join adidas.marcas on marcas.id_marcas=productos.id_marcas
inner join adidas.stock on stock.id_stock=productos.id_stock;


# FINALIZAMOS LA CREACION DE VISTAS-----------------------------------------------------------------------------------------


# INICIAMOS LA CREACION DE FUNCIONES----------------------------------------------------------------------------------------

#creamos la funcion para calcular el iva del producto

DELIMITER $$
USE `adidas`$$
CREATE FUNCTION `CalculoIVA` (precio_unitario int)
RETURNS INTEGER
deterministic
BEGIN
declare IVA int; 
set IVA= precio_unitario*1.21;
RETURN IVA;
END$$
DELIMITER ;
use adidas;
SELECT id_productos,descripcion_productos,precio_unitario,  CalculoIVA(precio_unitario) as IVA from adidas.productos;

#creamos funcion para aplicar descuento por cliente Adiclub

DELIMITER $$
USE `adidas`$$
CREATE FUNCTION `Descuento_Adiclub` (`porcentaje de descuento`int,monto_final int)
RETURNS INTEGER
deterministic
BEGIN
declare MontoFinal_DescuentoAdiclub int;
declare descuento int;
set descuento=(`porcentaje de descuento`*monto_final)/100;
set MontoFinal_DescuentoAdiclub=monto_final-descuento;

RETURN MontoFinal_DescuentoAdiclub;
END$$
DELIMITER ;
use adidas;
SELECT id_carrito,carrito.id_clientesAdiclub,monto_final,`porcentaje de descuento` as `Descuento de %`, Descuento_Adiclub(`porcentaje de descuento`,monto_final) as MontoFinalConDescAdiclub FROM adidas.carrito
inner join adidas.clientesadiclub on clientesadiclub.id_clientesAdiclub=carrito.id_clientesAdiclub
inner join adidas.descuentopromocion on clientesadiclub.id_descuento=descuentopromocion.id_descuentoPromocion;

#creamos funcion para calcular el impuesto de distintas cuotas con pago de credito

DELIMITER $$
USE `adidas`$$
CREATE FUNCTION `Recargo_TarjCredito` (monto_final int, cuotas int)
RETURNS INTEGER
deterministic
BEGIN
declare recargo int;
declare total int;
if cuotas=1 then
return monto_final;
end if;
if cuotas=3 then
set recargo=monto_final*.10;
set total=recargo+monto_final;
return total;
end if;
if cuotas=6 then
set recargo=monto_final*.20;
set total=recargo+monto_final;
return total;
end if;
if cuotas=9 then
set recargo=monto_final*.25;
set total=recargo+monto_final;
return total;
end if;
if cuotas=12 then
set recargo=monto_final*.30;
set total=recargo+monto_final;
return total;
end if;
END$$
DELIMITER ;

#creamos funcion para darnos el valor de las cuotas
USE `adidas`;
DROP function IF EXISTS `Cuotas_TarjCredito`;

DELIMITER $$
USE `adidas`$$
CREATE FUNCTION `Cuotas_TarjCredito` (monto_final int, cuotas int)
RETURNS INTEGER
deterministic
BEGIN
declare recargo int;
declare total int;
declare precio_cuotas int;
if cuotas=1 then
return monto_final;
end if;
if cuotas=3 then
set recargo=monto_final*.10;
set total=recargo+monto_final;
set precio_cuotas=total/3;
return precio_cuotas;
end if;
if cuotas=6 then
set recargo=monto_final*.20;
set total=recargo+monto_final;
set precio_cuotas=total/6;
return precio_cuotas;
end if;
if cuotas=9 then
set recargo=monto_final*.25;
set total=recargo+monto_final;
set precio_cuotas=total/9;
return precio_cuotas;
end if;
if cuotas=12 then
set recargo=monto_final*.30;
set total=recargo+monto_final;
set precio_cuotas=total/12;
return precio_cuotas;
end if;
END$$
DELIMITER ;



use adidas;
SELECT monto_final, Recargo_TarjCredito(monto_final,1)as `En 1 cuota`,Cuotas_TarjCredito(monto_final,1)as `En 1 pago de`,
Recargo_TarjCredito(monto_final,3)as `En 3 cuotas`,Cuotas_TarjCredito(monto_final,3)as `En 3 pagos de`, 
Recargo_TarjCredito(monto_final,6)as `En 6 cuotas`,Cuotas_TarjCredito(monto_final,6)as `En 6 pagos de`,
Recargo_TarjCredito(monto_final,9)as `En 9 cuotas`,Cuotas_TarjCredito(monto_final,9)as `En 9 pagos de`,
Recargo_TarjCredito(monto_final,12)as `En 12 cuotas`,Cuotas_TarjCredito(monto_final,12)as `En 12 pagos de`
 FROM adidas.carrito where id_formaPago=3;

SELECT monto_final, Recargo_TarjCredito(monto_final,3)as `En 3 cuotas`,Cuotas_TarjCredito(monto_final,3)as `En 3 pagos de` 
FROM adidas.carrito where id_formaPago=3;
#    FIN DE FUNCIONES ---------------------------------------------------------------


#    INICIO DE SP    ------------------------------------------------------------------------------------------------

#Creamos el SP para ordenar los productos de Hombre segun un campo de forma asc o desc
#lo hacemos sobre una vista la cual nos permite usar los campos categoria, tipo y marcas
USE `adidas`;
DROP procedure IF EXISTS `ordenamiento_productosH`;
DELIMITER $$
CREATE PROCEDURE ordenamiento_productosH (IN campo_a_ordenar VARCHAR(50), IN orden BOOLEAN)
-- orden=1 -> asc
-- orden=0 -> desc
-- Notar que si campo_a_ordenar='' entonces no importa el orden
BEGIN
IF campo_a_ordenar <> '' AND orden = 1 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar);
	ELSEIF campo_a_ordenar <> '' AND orden = 0 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar, ' DESC');
	ELSEIF campo_a_ordenar <> '' AND orden NOT IN (0,1) THEN
		SET @ordenar = 'No válido';
		SELECT 'Parámetro de ordenamiento ingresado no válido' AS Mensaje;
    ELSE
		SET @ordenar = '';
	END IF;
    IF @ordenar <> 'No válido' THEN
		SET @clausula_select = concat('SELECT * FROM productosdescripcionH ', @ordenar);
		PREPARE ejecucion FROM @clausula_select;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;
END$$
DELIMITER ;
# usamos el SP para ordenar los productos
CALL ordenamiento_productosH('precio_unitario',1);


#Creamos el SP para ordenar los productos de Hombre segun un campo de forma asc o desc
#lo hacemos sobre una vista la cual nos permite usar los campos categoria, tipo y marcas
USE `adidas`;
DROP procedure IF EXISTS `ordenamiento_productosM`;
DELIMITER $$
CREATE PROCEDURE ordenamiento_productosM (IN campo_a_ordenar VARCHAR(50), IN orden BOOLEAN)
-- orden=1 -> asc
-- orden=0 -> desc
-- Notar que si campo_a_ordenar='' entonces no importa el orden
BEGIN
IF campo_a_ordenar <> '' AND orden = 1 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar);
	ELSEIF campo_a_ordenar <> '' AND orden = 0 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar, ' DESC');
	ELSEIF campo_a_ordenar <> '' AND orden NOT IN (0,1) THEN
		SET @ordenar = 'No válido';
		SELECT 'Parámetro de ordenamiento ingresado no válido' AS Mensaje;
    ELSE
		SET @ordenar = '';
	END IF;
    IF @ordenar <> 'No válido' THEN
		SET @clausula_select = concat('SELECT * FROM productosdescripcionM ', @ordenar);
		PREPARE ejecucion FROM @clausula_select;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;
END$$
DELIMITER ;
# usamos el SP para ordenar los productos
CALL ordenamiento_productosM('id_productos',1);

#Creamos el SP para ordenar los productos de Hombre segun un campo de forma asc o desc
#lo hacemos sobre una vista la cual nos permite usar los campos categoria, tipo y marcas
USE `adidas`;
DROP procedure IF EXISTS `ordenamiento_productosN`;
DELIMITER $$
CREATE PROCEDURE ordenamiento_productosN (IN campo_a_ordenar VARCHAR(50), IN orden BOOLEAN)
-- orden=1 -> asc
-- orden=0 -> desc
-- Notar que si campo_a_ordenar='' entonces no importa el orden
BEGIN
IF campo_a_ordenar <> '' AND orden = 1 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar);
	ELSEIF campo_a_ordenar <> '' AND orden = 0 THEN
		SET @ordenar = concat('ORDER BY ', campo_a_ordenar, ' DESC');
	ELSEIF campo_a_ordenar <> '' AND orden NOT IN (0,1) THEN
		SET @ordenar = 'No válido';
		SELECT 'Parámetro de ordenamiento ingresado no válido' AS Mensaje;
    ELSE
		SET @ordenar = '';
	END IF;
    IF @ordenar <> 'No válido' THEN
		SET @clausula_select = concat('SELECT * FROM productosdescripcionN ', @ordenar);
		PREPARE ejecucion FROM @clausula_select;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;
END$$
DELIMITER ;
# usamos el SP para ordenar los productos
CALL ordenamiento_productosN('precio_unitario',1);

#creamos SP para borrar un producto de la lista
USE `adidas`;
DROP procedure IF EXISTS `delete_productos`;

DELIMITER $$
USE `adidas`$$
CREATE PROCEDURE delete_productos(id int)
BEGIN
DELETE FROM productos WHERE id_productos = id;
END$$
DELIMITER ;

#eliminamos el producto registrado con el id 80
CALL delete_productos(85);



#Creamos SP para insertar o actualizar valor de la tabla productos
USE `adidas`;
DROP procedure IF EXISTS `update_insert_productos`;

DELIMITER $$
USE `adidas`$$
CREATE PROCEDURE `update_insert_productos` (IN opcion INT, IN id_produc INT,IN descripcion varchar(100),IN precio int,IN stock int)
#opcion=1 INSERT
#OPCION=2 UPDATE
BEGIN
IF opcion=1 then 
	insert into productos (id_productos,descripcion_productos,precio_unitario,id_stock)value (id_produc,descripcion,precio,stock);
ELSEIF opcion=2 then
	update productos set descripcion_productos=descripcion, precio_unitario=precio, id_stock=stock where (id_productos=id_produc);
end if;
END$$
DELIMITER ;

CALL update_insert_productos(1,NULL,'BOXER ADIDAS','7000','10');
CALL update_insert_productos('2',77,'ZAPATILLAS PARA CORRER SOLARGLIDE 5','45999','77');

# FIN DE SP ------------------------------------------------------------------------------------


#  INICIO TRIGGERS-------------------------------------------------------------------------------

#Creamo triggers para la actualizacion de password 
use ADIDAS;
#	se crea la tabla log para el password
drop table if exists log_cambio_pwd;
CREATE TABLE log_cambio_pwd (
id_log INT auto_increment PRIMARY KEY,
id_clientesAdiclub INT,
Password_previa varchar(40),
Password_nueva varchar(40),
usuario varchar(20),
fecha  date,
hora  time
);

#proporciona informacion sobre las columnas de una tabla 
describe clientesadiclub;

#comenzamos la creacion del triggers
delimiter $$
DROP TRIGGER IF EXISTS log_cambio_Password $$
CREATE TRIGGER log_cambio_Password
AFTER UPDATE ON clientesadiclub
FOR EACH ROW
BEGIN
	IF new.password<>old.password OR old.password IS NULL THEN
		INSERT INTO log_cambio_pwd VALUES (DEFAULT, new.id_clientesAdiclub, old.password, new.password, user(),curdate(),curtime());
	END IF;
END $$
delimiter ;


UPDATE clientesadiclub set password='marquitos12' where id_clientesAdiclub=4;
UPDATE clientesadiclub set password='marquitos24' where id_clientesAdiclub=4;
UPDATE clientesadiclub set password='juli1812' where id_clientesAdiclub=1;
UPDATE clientesadiclub set password='vivalavida' where id_clientesAdiclub=3;

#creamos tabla para registros sobre productos
drop table if exists log_registro_productos;
create table log_registro_productos(
id_log int not null auto_increment primary key,
id_productos int,
descripcion_productos varchar (100) not null,
precio_unitario int not null,
usuario varchar(50),
fecha date,
hora time,
operacionRealizada varchar (50)
);

		#log de evento de insert
    
DROP TRIGGER  IF EXISTS log_insert_productos;
CREATE TRIGGER log_insert_productos
AFTER INSERT ON productos
FOR EACH ROW
INSERT INTO log_registro_productos VALUES (DEFAULT, new.id_productos,new.descripcion_productos,new.precio_unitario,user(),curdate(),curtime(),'INSERT');

-- lo probamos
INSERT INTO adidas.productos (id_productos,descripcion_productos,precio_unitario,id_marcas,id_stock) VALUES (NULL,'BUZO ADIDAS SPICK','19999','2','18'),(NULL,'ZAPATILLAS RETRO ADI','25999','1','12');
INSERT INTO adidas.productos (id_productos,descripcion_productos,precio_unitario,id_marcas,id_stock) VALUES (NULL,'GORRA ROGFORT','7550','2','24');
SELECT * FROM log_registro_productos;

		#log de evento de update
        
DROP TRIGGER  IF EXISTS log_update_productos;
CREATE TRIGGER log_update_productos
BEFORE UPDATE ON productos
FOR EACH ROW
INSERT INTO log_registro_productos VALUES (DEFAULT, new.id_productos,new.descripcion_productos,new.precio_unitario,user(),curdate(),curtime(),'UPDATE');

-- lo probamos
UPDATE productos SET descripcion_productos='PANTALÓN X KARLIE KLOSS', precio_unitario=26999 WHERE id_productos=18;
UPDATE productos SET  precio_unitario=10000 WHERE id_productos=16;
UPDATE productos SET  precio_unitario=8000 WHERE id_productos=102;
SELECT * FROM log_registro_productos;

		#log de evento de delete
use adidas;
DELIMITER $$
        
DROP TRIGGER  IF EXISTS log_delete_productos;
CREATE TRIGGER log_delete_productos
BEFORE DELETE ON productos
FOR EACH ROW
BEGIN 
INSERT INTO log_registro_productos (id_log,id_productos,descripcion_productos,precio_unitario,usuario,fecha,hora,operacionRealizada) VALUES (DEFAULT,OLD.id_productos,OLD.descripcion_productos,OLD.precio_unitario,user(),curdate(),curtime(),'DELETE');
END$$
DELIMITER ;

-- lo probamos

use ADIDAS;
DELETE FROM productos WHERE id_productos=101;
DELETE FROM productos WHERE id_productos=98;
DELETE FROM productos WHERE id_productos=97;
SELECT * FROM log_registro_productos;

    

#Usar en caso de que quieras eliminar alguna tabla en especifico. 
drop table seccionHombre;
drop table seccionMujer;
drop table seccionNinios;
drop table adidasOriginals;
drop table adidasSsportwear;
drop table adidasTerrex;
drop table adidasStellMccartney;
drop table adidasEndPlasticWaste;
drop table stock;
drop table colores;
drop table descuentoPromocion;
drop table marcas;
drop table productos;
drop table categoria;
drop table productos_color;
drop table formaPago;
drop table clientesWeb;
drop table clientesAdiclub;
drop table envios;
drop table carrito;
drop table productosCarrito;
drop table factura;
drop table venta;

#usar en caso de querer eliminar alguna vista
drop view clientes_adiclub;
drop view clientes_web;
drop view colores_de_producto;
drop view envios_clientesweb;
drop view envios_clientesadiclub;
drop view consulta_ventas_adiclub;
drop view consulta_ventas_web;
drop view resumen_pedido;
drop view resumen_pedido2;
drop view calzado_hombre;

# SELECCIONA PARA VISUALIZAR ALGUNAS DE LAS TABLAS YA CREADAS------
SELECT * FROM adidas.seccionhombre;
SELECT * FROM adidas.seccionmujer;
SELECT * FROM adidas.seccionninios;
SELECT * FROM adidas.adidasendplasticwaste;
SELECT * FROM adidas.adidasoriginals;
SELECT * FROM adidas.adidasssportwear;
SELECT * FROM adidas.adidasstellmccartney;
SELECT * FROM adidas.adidasterrex;
SELECT * FROM adidas.stock;
SELECT * FROM adidas.colores;
SELECT * FROM adidas.descuentopromocion;
SELECT * FROM adidas.marcas;
SELECT * FROM adidas.productos;
SELECT * FROM adidas.categoria;
SELECT * FROM adidas.productos_color;
SELECT * FROM adidas.clientesadiclub;
SELECT * FROM adidas.clientesweb;
SELECT * FROM adidas.envios;
SELECT * FROM adidas.formapago;
SELECT * FROM adidas.carrito;
SELECT * FROM adidas.productos_carrito;
SELECT * FROM adidas.factura;
SELECT * FROM adidas.ventas;


# SELECCIONA PARA VISUALIZAR ALGUNAS DE LAS VISTAS YA CREADAS------
SELECT * FROM  clientes_adiclub;
SELECT * FROM  clientes_web;
SELECT * FROM  colores_de_producto;
SELECT * FROM  envios_adiclub;
SELECT * FROM  envios_clientesweb;
SELECT * FROM  resumen_pedido;
SELECT * FROM  resumen_pedido2;
SELECT * FROM  consulta_ventas_adiclub;
SELECT * FROM  consulta_ventas_web;
SELECT * FROM  calzado_hombre;