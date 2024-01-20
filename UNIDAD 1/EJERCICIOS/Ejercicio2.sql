--Practica 2
create database Practica2
go
use Practica2
create table tblCliente(
ClienteId int not null,
constraint pk_tblCliente
primary key(ClienteId), 
NombreC varchar (100) not null,
Direccion varchar (100),
Telefono varchar(20),
constraint unique_NombreC
unique(NombreC)
)
create table tblEmpleado(
IdEmpleado int not null,
constraint pk_tblEmpleado
primary key(IdEmpleado),
Nombre varchar(50),
Apellidos varchar(50),
Sexo char(1),
--
Salario decimal(10,2),
constraint chk_salario
check(salario>400 and salario<=50000) 
)
create table tblVenta(
 idVenta int not null,  
 fecha date not null, 
 idcliente int not null,
 idempleado int not null,
  constraint pk_tblVenta
   primary key(idVenta),
  constraint fk_tblcliente
  foreign key(idcliente)
  references tblcliente(ClienteId),
  constraint fk_tblempleado
  foreign key(idempleado)
  references tblempleado(idEmpleado)
)
CREATE TABLE tblProducto(
   idProducto int not null,
   descripcion varchar(200) not null,
   existencia int not null,
   precioUnitario decimal(10,2) not null, 
   constraint pk_tblproducto
   primary key (idProducto),
   constraint unique_descripcion
   unique(descripcion)
)
create table detalle_venta(
  idVenta int not null,
  idProducto int not null,
  precio decimal(10,2) not null,
  cantidad int not null, 
  constraint pk_detalle_venta
  primary key(idVenta,idProducto),
  constraint fk_tblVenta
  foreign key(idVenta)
  references tblVenta(IdVenta),
  constraint fk_tblproducto
  foreign key(idProducto)
  references tblProducto(idProducto),
)

go

drop table tblVenta
use Practica2


--Practica 4
create database Practica4
use Practica4

create table tbl