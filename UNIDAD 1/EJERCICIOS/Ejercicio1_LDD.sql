--SQL-LDD--
--Crear la base de datos bdentornosvip

CREATE DATABASE bdentornosvip
go
-- cambiar a la base de datos
USE bdentornosvip
go
--Crear una tabla categoria
Create table categoria  (
	categoriaId int not null ,
	descripcion varchar (100) not null,
	constraint pk_tblcategoria
	primary key (categoriaId),
	constraint unique_descripcion
	unique(descripcion)
)
go
-- crear ima tabla categoria
Create table Producto (
	productoId int not null,
	nombreP varchar(50) not null,
	precio decimal(10,2) not null,
	existencia int not null,
	categoriaId int not null
	constraint pk_tblProducto
	primary key (productoId),
	constraint unique_nombreP
	unique(nombreP),
	constraint chk_precio
	check(precio>0.0 and precio <=10000),
	constraint chk_exitencia
	check(existencia>=0),
	constraint fk_Producto_categoria
	foreign key (categoriaId)
	references categoria(categoriaId)
)
go
