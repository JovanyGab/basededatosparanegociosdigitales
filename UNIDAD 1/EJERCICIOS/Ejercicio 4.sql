use Practica4

create table tbl Categoria(
CategoriaId int not null,
NumInventario int not null,
descripcion varchar(50) not null,
constraint pk_Categoria
primary key(CategoriaId, NumInventario)

)
create table tbl Producto(
productoId int not null,
descripcion varchar(100), not null,
precio decimal(10,2) not null,
stock int not null,
constraint pk_producto
primary key(productoId)
constraint fk_producto_categoria
foreign key cate

)
go