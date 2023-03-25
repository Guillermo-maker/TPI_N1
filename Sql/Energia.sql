create database Energia_SA;
use Energia_SA;

create table Barrio(id_barrio int primary key, nombre varchar (50));

insert into Barrio (id_barrio, nombre) values (1, "Villa Allende");
insert into Barrio (id_barrio, nombre) values (2, "Alberdi");
insert into Barrio (id_barrio, nombre) values (3, "Villa el libertador");
insert into Barrio (id_barrio, nombre) values (4, "Mendiolaza");
insert into Barrio (id_barrio, nombre) values (5, "Saldan");

create table TipoDocumento( id_documento int primary key, pais varchar (50));

insert into TipoDocumento (id_documento, pais) values (1, "Argentina");
insert into TipoDocumento (id_documento, pais) values (2, "Argentina");
insert into TipoDocumento (id_documento, pais) values (3, "Argentina");
insert into TipoDocumento (id_documento, pais) values (4, "Argentina");
insert into TipoDocumento (id_documento, pais) values (5, "Paraguay");


create table TipoServicio (id_servicio int primary key, nombre varchar (50), tarifa int);

insert into TipoServicio (id_servicio, nombre, tarifa) values (1,"Comercial",50);
insert into TipoServicio (id_servicio, nombre, tarifa) values (2,"Residencial",50);
insert into TipoServicio (id_servicio, nombre, tarifa) values (3,"Comercial",50);
insert into TipoServicio (id_servicio, nombre, tarifa) values (4,"Residencial",50);
insert into TipoServicio (id_servicio, nombre, tarifa) values (5,"Comercial",50);

create table Clientes(num_identificacion int primary key, nombre varchar (50), direccion varchar (50), correo_electronico varchar (50), num_telefono int, id_documento int, constraint id_d foreign key(id_documento) references TipoDocumento(id_documento), id_servicio int, constraint id_s foreign key (id_servicio)references TipoServicio(id_servicio));

insert into Clientes(num_identificacion, nombre, direccion, correo_electronico, num_telefono, id_documento,id_servicio) values (1,"Guillermo", "Huallil 9139", "g@gmail.com", 12515, 1,1);
insert into Clientes(num_identificacion, nombre, direccion, correo_electronico, num_telefono, id_documento,id_servicio) values (2,"Juan", "agua sacha 1232", "j@gmail.com", 52584, 2,2);
insert into Clientes(num_identificacion, nombre, direccion, correo_electronico, num_telefono, id_documento,id_servicio) values (3,"pedro", "Viracocha 9923", "p@gmail.com", 68854, 3,3);
insert into Clientes(num_identificacion, nombre, direccion, correo_electronico, num_telefono, id_documento,id_servicio) values (4,"Blanca", "Colon 8897", "b@gmail.com", 75965, 4,4);
insert into Clientes(num_identificacion, nombre, direccion, correo_electronico, num_telefono, id_documento,id_servicio) values (5,"Yaco", "Rafael Nuñez 2123", "y@gmail.com", 1329, 5,5);


create table Medidores(id_medidor int primary key, fecha_medicion date, consumo_real_Watts int, num_identificacion int, foreign key (num_identificacion) references Clientes(num_identificacion), id_barrio int, foreign key (id_barrio) references Barrio(id_barrio));

insert into Medidores(id_medidor,fecha_medicion,consumo_real_Watts,num_identificacion,id_barrio) values (1,'2023/01/21',500,1,1);
insert into Medidores(id_medidor,fecha_medicion,consumo_real_Watts,num_identificacion,id_barrio) values (2,'2023/02/13',650,2,2);
insert into Medidores(id_medidor,fecha_medicion,consumo_real_Watts,num_identificacion,id_barrio) values (3,'2023/01/10',600,3,3);
insert into Medidores(id_medidor,fecha_medicion,consumo_real_Watts,num_identificacion,id_barrio) values (4,'2023/01/14',550,5,5);
insert into Medidores(id_medidor,fecha_medicion,consumo_real_Watts,num_identificacion,id_barrio) values (5,'2023/01/20',500,5,5);


create table Factura(id_factura int primary key ,fecha_factura date, watts_consumidos int, monto_total int, id_servicio int,foreign key (id_servicio)references TipoServicio(id_servicio));

insert into Factura(id_factura,fecha_factura,watts_consumidos,monto_total,id_servicio) values (1, '2023/02/21', 500,5000,1);
insert into Factura(id_factura,fecha_factura,watts_consumidos,monto_total,id_servicio) values (2, '2023/03/21', 500,4222,2);
insert into Factura(id_factura,fecha_factura,watts_consumidos,monto_total,id_servicio) values (3, '2023/02/21', 500,6000,3);
insert into Factura(id_factura,fecha_factura,watts_consumidos,monto_total,id_servicio) values (4, '2023/02/21', 500,6888,4);
insert into Factura(id_factura,fecha_factura,watts_consumidos,monto_total,id_servicio) values (5, '2023/02/21', 500,2028,5);

create table PagoLinea(id_pagolinea int primary key, fecha_Vencimiento date, id_factura int, foreign key (id_factura) references Factura(id_factura),num_identificacion int, foreign key (num_identificacion) references Clientes(num_identificacion));

insert into PagoLinea(id_pagolinea, fecha_Vencimiento, id_factura, num_identificacion ) values (1, '2023/03/21', 1, 1);
insert into PagoLinea(id_pagolinea, fecha_Vencimiento, id_factura, num_identificacion ) values (2, '2023/04/21', 2, 2);
insert into PagoLinea(id_pagolinea, fecha_Vencimiento, id_factura, num_identificacion ) values (3, '2023/04/21', 3, 3);
insert into PagoLinea(id_pagolinea, fecha_Vencimiento, id_factura, num_identificacion ) values (4, '2023/04/21', 4, 4);
insert into PagoLinea(id_pagolinea, fecha_Vencimiento, id_factura, num_identificacion ) values (5, '2023/04/21', 5, 5);
