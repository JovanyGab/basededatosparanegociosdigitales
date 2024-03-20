create database Practica1
go

use Practica1
go

create table tblContacto (
	ContactoId int not null,
	nombre varchar (50) not null,
	constraint pk_tbl_Contacto
	primary key (ContactoId),
	constraint unique_nombre
	unique(nombre)
)
go

-- Crear tabla Telefono


Create table tblTelefono (
	TelefonoId int not null ,
	NumeroTel varchar (10) not null,
	ContactoId int not null
	constraint pk_tbl_Producto
	primary key (TelefonoId),
	constraint fk_tblTelefono_tblContacto
	foreign key (ContactoId)
	references tblContacto(ContactoId)
)
go