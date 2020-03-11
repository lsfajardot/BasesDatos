	create database base1;
	use base1;
create table localidades
	(
	localicli	int(2),
	nomlocali	varchar(20),
	primary key(localicli)
	);	

create table sucursales
	(
	codsuc	int(2),
	nomsuc	varchar(20),
	primary key(codsuc)
	);

create table clientes
	(
	cedcli	int(15),
	nomcli	varchar(50),
	localicli int(2),
	primary key(cedcli),
	foreign key(localicli) references localidades(localicli)
	);

create table tipoarticulos
	(
	tipoart	int(5),
	nomtipoart	varchar(50),
	primary key(tipoart)
	);

create table facturas
	(
	nrofac	int(8),
	fechfac	date,
	codsuc	int(2),
	cedcli	int(15),
	primary key(nrofac),
	foreign key(codsuc) references sucursales(codsuc),
	foreign key(cedcli) references clientes(cedcli)
	);

create table articulos
	(
	codart	int(3),
	nomart	varchar(30),
	valunart	int(10),
	tipoart	int(2),
	primary key(codart),
	foreign key (tipoart) references tipoarticulos(tipoart)
	);

create table factu_arti
	(
	nrofac int(8),
	codart int(2),
	cantvenart int(4),
	primary key(nrofac, codart),
	foreign key(nrofac) references facturas(nrofac),
	foreign key(codart) references articulos(codart)
	);