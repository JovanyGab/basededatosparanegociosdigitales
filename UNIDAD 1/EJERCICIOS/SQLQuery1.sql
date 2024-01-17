use dbentornosvip

create table tblProducto(
productoId int not null,
nombreP varchar (50)  not null,
precio decimal (10,2) not null,
existencia int not null,
constraint pk_tblProducto
primary key(productoId),
constraint unique_nombreP
unique(nombreP),
constraint chk_precio
check(precio> 0.0 and precio<10000),
constraint chk_existencia
check (existencia >=0),
constraint fk_tblProducto_tblCategoria
foreign key(categoriaId)
references tblcategoria(categoriaId)

)