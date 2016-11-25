/*
 drop table User cascade;
 drop table Fiscal cascade;
 drop table Edificio cascade;
 drop table Alugavel cascade;
 drop table Arrenda cascade;
 drop table Fiscaliza cascade;
 drop table Espaço cascade;
 drop table Posto cascade;
 drop table Oferta cascade;
 drop table Aluga cascade;
 drop table Paga cascade;
 drop table Estado cascade;
 drop table Reserva cascade;
*/
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

/* populate relations */

insert into User	values (221122,	'Antonio',		961234567);
insert into User	values (212121,	'Alberto',		911234567);
insert into User	values (123456,	'Joao',		911234568);
insert into User	values (121212,	'Roberto',	911234569);
insert into User	values (123123,	'Carlos',		911234566);
insert into User	values (444444,	'Daniel',	911234565);
insert into User	values (212122,	'Bruno',	911234564);
insert into User	values (202020,	'Afonso',	911234563);
insert into User	values (121213,	'Facas',		911234562);
insert into User	values (313131,	'Ana',	911234561);
insert into User	values (303030,	'Maria',	911234560);

insert into Fiscal	values (90, 'Lda');
insert into Fiscal  values (91, 'Lda');
insert into Fiscal  values (92, 'frutas');
insert into Fiscal  values (93, 'mudanças');
insert into Fiscal  values (94, 'frutas');
insert into Fiscal  values (95, 'desemprego');
insert into Fiscal  values (96, 'desemprego');

insert into Edificio  values ('A');
insert into Edificio  values ('B');
insert into Edificio  values ('C');
insert into Edificio  values ('D');
insert into Edificio  values ('E');
insert into Edificio  values ('F');
insert into Edificio  values ('G');
insert into Edificio  values ('H');
insert into Edificio  values ('I');

insert into Alugavel  values ('A', 1234,'');
insert into Alugavel  values ('B', 1234,'');
insert into Alugavel  values ('C', 1234,'');
insert into Alugavel  values ('D', 1234,'');
insert into Alugavel  values ('E', 1234,'');
insert into Alugavel  values ('F', 1234,'');  
insert into Alugavel  values ('G', 1234,'');
insert into Alugavel  values ('H', 1234,'');
insert into Alugavel  values ('I', 1234,'');

insert into Arrenda  values ('A', 1234,221122);
insert into Arrenda  values ('B', 1234,221122);
insert into Arrenda  values ('C', 1234,313131);
insert into Arrenda  values ('D', 1234,444444);
insert into Arrenda  values ('E', 1234,202020);
insert into Arrenda  values ('F', 1234,313131);
insert into Arrenda  values ('G', 1234,303030);
insert into Arrenda  values ('H', 1234,121212);
insert into Arrenda  values ('I', 1234,313131);  

insert into Fiscaliza  values (90,'I', 1234);
insert into Fiscaliza  values (98,'A', 1234);
insert into Fiscaliza  values (97,'B', 1234);
insert into Fiscaliza  values (96,'C', 1234);
insert into Fiscaliza  values (95,'D', 1234);
insert into Fiscaliza  values (94,'E', 1234);
insert into Fiscaliza  values (93,'F', 1234);
insert into Fiscaliza  values (92,'G', 1234);
insert into Fiscaliza  values (91,'H', 1234);
  
insert into Espaço  values ('A', 1234);
insert into Espaço  values ('B', 1234);
insert into Espaço  values ('C', 1234);
insert into Espaço  values ('D', 1234);
insert into Espaço  values ('E', 1234);
insert into Espaço  values ('F', 1234);  
insert into Espaço  values ('G', 1234);
insert into Espaço  values ('H', 1234);
insert into Espaço  values ('I', 1234);

insert into Posto  values ('A', 1234, 1234);
insert into Posto  values ('B', 1234, 1234);
insert into Posto  values ('C', 1234, 1234);
insert into Posto  values ('D', 1234, 1234);
insert into Posto  values ('E', 1234, 1234);
insert into Posto  values ('F', 1234, 1234);
insert into Posto  values ('G', 1234, 1234);
insert into Posto  values ('H', 1234, 1234);
insert into Posto  values ('I', 1234, 1234);

insert into Oferta  values ('A', 1234, '1/10/16', '1/11/16', 650);
insert into Oferta  values ('B', 1234, '1/10/16', '1/11/16', 620);
insert into Oferta  values ('C', 1234, '1/10/16', '1/11/16', 610);
insert into Oferta  values ('D', 1234, '1/10/16', '1/11/16', 350);  
insert into Oferta  values ('E', 1234, '1/10/16', '15/10/16', 650);
insert into Oferta  values ('F', 1234, '1/10/16', '1/11/16', 650);
insert into Oferta  values ('G', 1234, '1/10/16', '1/11/16', 650);
insert into Oferta  values ('H', 1234, '1/10/16', '1/11/16', 650);
insert into Oferta  values ('I', 1234, '1/10/16', '1/11/16', 650);

insert into Aluga  values ('A', 1234, '1/10/16', 221122, 6);
insert into Aluga  values ('B', 1234, '1/10/16', 221122, 4);
insert into Aluga  values ('C', 1234, '1/10/16', 313131, 1);
insert into Aluga  values ('D', 1234, '1/10/16', 444444, 3);  
insert into Aluga  values ('E', 1234, '1/10/16', 202020, 2);
insert into Aluga  values ('F', 1234, '1/10/16', 313131, 5);
insert into Aluga  values ('G', 1234, '1/10/16', 303030, 7);
insert into Aluga  values ('H', 1234, '1/10/16', 121212, 8);
insert into Aluga  values ('I', 1234, '1/10/16', 313131, 0);

insert into Paga  values (0, '1/10/16', 'cartao');
insert into Paga  values (1, '1/10/16', 'cartao');
insert into Paga  values (2, '1/10/16', 'dinheiro');
insert into Paga  values (3, '1/10/16', 'cartao');
insert into Paga  values (4, '1/10/16', 'cheque');
insert into Paga  values (5, '1/10/16', 'cartao');
insert into Paga  values (6, '1/10/16', 'cartao');
insert into Paga  values (7, '1/10/16', 'cartao');
insert into Paga  values (8, '1/10/16', 'dinheiro');

insert into Estado  values (0, '1/10/16', 'aceite');
insert into Estado  values (1, '1/10/16', 'pendente');
insert into Estado  values (2, '1/10/16', 'aceite');
insert into Estado  values (3, '1/10/16', 'aceite');
insert into Estado  values (4, '1/10/16', 'cancelado');  
insert into Estado  values (5, '1/10/16', 'rejeitado');
insert into Estado  values (6, '1/10/16', 'aceite');
insert into Estado  values (7, '1/10/16', 'pendente');
insert into Estado  values (8, '1/10/16', 'aceite');

insert into Reserva  values (8);
insert into Reserva  values (1);
insert into Reserva  values (2);
insert into Reserva  values (3);
insert into Reserva  values (4);
insert into Reserva  values (5);
insert into Reserva  values (6);
insert into Reserva  values (7);
insert into Reserva  values (0);



