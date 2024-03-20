--Crear DB Practica5
Create database Practica5
go 

Use  Practica5
go

--Crear una tabla que contenga un campo calculado

create table PruebaCalculado( 
	id int not null identity (1,1) ,
	nombre varchar (50) not null,
	precio decimal (10,2) not null ,
	existencia int not null,
	importe as 
	(precio * existencia),
	constraint pk_pruebacalculo
	primary key (id)
)
go 

select * from PruebaCalculado


insert into PruebaCalculado
VALUES	('Chanclotas', 345,4)