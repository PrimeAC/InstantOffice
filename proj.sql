DROP TABLE IF EXISTS User CASCADE;
DROP TABLE IF EXISTS Fiscal CASCADE;
DROP TABLE IF EXISTS Edificio CASCADE;
DROP TABLE IF EXISTS Alugavel CASCADE;
DROP TABLE IF EXISTS Arrenda CASCADE;
DROP TABLE IF EXISTS Fiscaliza CASCADE;
DROP TABLE IF EXISTS Espaço CASCADE;
DROP TABLE IF EXISTS Posto CASCADE;
DROP TABLE IF EXISTS Oferta CASCADE;
DROP TABLE IF EXISTS Aluga CASCADE;
DROP TABLE IF EXISTS Paga CASCADE;
DROP TABLE IF EXISTS Estado CASCADE;
DROP TABLE IF EXISTS Reserva CASCADE;

create table User
   (nif	integer	not null unique,
    nome 	varchar(255)	not null,
    telefone 	integer	not null,
    primary key(nif));

create table Fiscal
   (id 	integer	not null unique,
    empresa 	varchar(255)	not null,
    primary key(id));

create table Edificio
   (morada 	varchar(255)	not null unique,
    primary key(morada));

create table Alugavel
   (morada 	varchar(255)	not null unique,
    codigo 	integer	not null unique,
    foto  varchar(255)  not null,
    primary key(morada, codigo),
    foreign key(morada) references Edificio(morada));

create table Arrenda
   (morada 	varchar(255)	not null unique,
    codigo		integer	not null unique,
    nif 		integer		not null,
    primary key(morada, codigo),
    foreign key(morada) references Alugavel(morada),
    foreign key(codigo) references Alugavel(codigo),
    foreign key(nif) references User(nif));

create table Fiscaliza
   (id 	integer	not null unique,
    morada 	varchar(255)	not null unique,
    codigo integer not null unique,
    primary key(id, morada, codigo),
    foreign key(id) references Fiscal(id),
    foreign key(morada) references Alugavel(morada),
    foreign key(codigo) references Alugavel(codigo));

create table Espaço
   (morada  varchar(255)  not null unique,
    codigo integer not null unique,
    primary key(morada, codigo),
    foreign key(morada) references Alugavel(morada),
    foreign key(codigo) references Alugavel(codigo));

create table Posto
   (morada  varchar(255)  not null unique,
    codigo integer not null unique,
    codigo_espaço varchar(255) not null,
    primary key(morada, codigo),
    foreign key(morada) references Alugavel(morada),
    foreign key(codigo) references Alugavel(codigo),
    foreign key(codigo_espaço) references Espaço(codigo));

create table Oferta
   (morada  varchar(255)  not null unique,
    codigo integer not null unique,
    data_inicio varchar(255) not null unique,
    data_fim varchar(255) not null,
    tarifa integer not null,
    primary key(morada, codigo, data_inicio),
    foreign key(morada) references Alugavel(morada),
    foreign key(codigo) references Alugavel(codigo));

create table Aluga
   (morada  varchar(255)  not null unique,
    codigo integer not null unique,
    data_inicio varchar(255) not null unique,
    nif integer not null unique,
    numero integer not null unique,
    primary key(morada, codigo, data_inicio, nif, numero),
    foreign key(morada) references Oferta(morada),
    foreign key(codigo) references Oferta(codigo),
    foreign key(data_inicio) references Oferta(data_inicio),
    foreign key(nif) references User(nif),
    foreign key(numero) references Reserva(numero));

create table Paga
   (numero integer not null unique,
    data  varchar(255)  not null,
    metodo varchar(255) not null,
    primary key(numero),
    foreign key(numero) references Reserva(numero));

create table Estado
   (numero integer not null unique,
    timestamp  varchar(255)  not null unique,
    estado varchar(255) not null,
    primary key(numero, timestamp),
    foreign key(numero) references Reserva(numero));

create table Reserva
   (numero integer not null unique,
    primary key(numero));
