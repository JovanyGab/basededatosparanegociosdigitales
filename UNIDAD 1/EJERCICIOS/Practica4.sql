--Creat BD Practica 4
Create database Practica4
go 

Use  Practica4
go

--Crear Tabla Categoria 
Create table tblCategoria (
	CategoriaId int not null, 
	NumeroInventario int not null,
	Decripcion varchar (50) not null,
	constraint pk_tblCategoria 
	Primary Key (CategoriaId, numeroInventario)
)
go
--Crear tabla Producto

Create table tblProducto (
	ProductoId int not null,
	Descripcion varchar(50) not null,
	Cantidad int not null,
	Precio decimal (10,2) not null,
	CategoriaId int not null,
	NumeroInventario int not null,
	constraint pk_tblProducto
	Primary key (ProductoId),
	constraint fk_tblProducto_tblCategoria
	foreign key (CategoriaId, NumeroInventario)
	references tblCategoria (CategoriaId,NumeroInventario)

)
go