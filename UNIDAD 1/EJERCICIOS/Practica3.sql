--Crear base de datos Practica2

Create database Practica3
go

--Usar Base de Datos

Use Practica3
go

--Craer tabla Cliente
create table tblCliente (
	ClienteId int not null,
	Nombre varchar(100) not null,
	Direccion varchar(100) not null,
	Telefono varchar(20) not null,
	constraint pk_tblCliente
	primary key (ClienteId),
	constraint unique_Nombre
	unique (Nombre)
)
go

--Crear tabla Empleado
create table tblEmpleado (
	EmpleadoId int not null,
	Nombre varchar(50) not null,
	Apellido varchar(80) not null,
	Sexo char(1) not null,
	Salario decimal(10,2) not null
	constraint pk_tblEmpleado
	Primary Key (EmpleadoId),
	constraint chk_Salario
	check(Salario >= 400 and Salario <=50000),
	constraint chk_Sexo
	check ( Sexo = 'h' or Sexo = 'm')
)
go

--Crear tabla Venta
create table tblVenta(
	VentaId int not null,
	Fecha date not null,
	ClienteId int not null,
	EmpleadoId int not null
	constraint pk_tblVenta
	Primary Key (VentaId),
	constraint fk_tbleVenta_tblCliente
	Foreign Key (ClienteId)
	references tblCliente(ClienteId),
	constraint fk_tbleVenta_tblEmpleado
	Foreign Key (EmpleadoId)
	references tblEmpleado(EmpleadoId),
)
go

--Crear tabla Producto

create table tblProducto (
	ProductoId int not null,
	Descripcion varchar (100) not null,
	Existencia  int not null,
	PrecioUnitario decimal (10,2) not null,
	constraint unique_Descripcion
	unique (Descripcion),
	constraint pk_tblProducto
	Primary key (ProductoId)
)
go

--Crear tabla DetalleVenta

Create table tblDetalleVenta (
	VentaId int not null,
	ProductoId int not null,
	Cantidad int not null, 
	Precio decimal (10,2)
	constraint pk_tblDetalleVenta
	Primary key (VentaId,ProductoId)
	constraint fk_tblDetalleVenta_tblVenta
	foreign key (VentaId)
	references tblVenta(VentaId),
	constraint  fk_tblDetalleVenta_tblProducto
	foreign key (ProductoId)
	references tblProducto(ProductoId)
)
go