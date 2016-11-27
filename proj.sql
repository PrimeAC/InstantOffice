SET FOREIGN_KEY_CHECKS = 0;
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
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE User
(
  nif      INTEGER      NOT NULL UNIQUE,
  nome     VARCHAR(255) NOT NULL,
  telefone INTEGER      NOT NULL,
  PRIMARY KEY (nif)
);

CREATE TABLE Fiscal
(
  id      INTEGER      NOT NULL UNIQUE,
  empresa VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Edificio
(
  morada VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (morada)
);

CREATE TABLE Alugavel
(
  morada VARCHAR(255) NOT NULL,
  codigo INTEGER      NOT NULL,
  foto   VARCHAR(255) NOT NULL,
  PRIMARY KEY (morada, codigo),
  FOREIGN KEY (morada) REFERENCES Edificio (morada)
);

CREATE TABLE Arrenda
(
  morada VARCHAR(255) NOT NULL,
  codigo INTEGER      NOT NULL,
  nif    INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo),
  FOREIGN KEY (nif) REFERENCES User (nif)
);

CREATE TABLE Fiscaliza
(
  id     INTEGER      NOT NULL UNIQUE,
  morada VARCHAR(255) NOT NULL,
  codigo INTEGER      NOT NULL,
  PRIMARY KEY (id, morada, codigo),
  FOREIGN KEY (id) REFERENCES Fiscal (id),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo)
);

CREATE TABLE Espaço
(
  morada VARCHAR(255) NOT NULL,
  codigo INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo)
);

CREATE TABLE Posto
(
  morada        VARCHAR(255) NOT NULL,
  codigo        INTEGER      NOT NULL,
  codigo_espaço INTEGER      NOT NULL UNIQUE,
  PRIMARY KEY (morada, codigo),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo),
  FOREIGN KEY (codigo_espaço) REFERENCES Espaço (codigo)
);

CREATE TABLE Oferta
(
  morada      VARCHAR(255) NOT NULL,
  codigo      INTEGER      NOT NULL,
  data_inicio VARCHAR(255) NOT NULL UNIQUE,
  data_fim    VARCHAR(255) NOT NULL,
  tarifa      INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo, data_inicio),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo)
);

CREATE TABLE Reserva
(
  numero INTEGER NOT NULL UNIQUE,
  PRIMARY KEY (numero)
);

CREATE TABLE Paga
(
  numero INTEGER      NOT NULL UNIQUE,
  data   VARCHAR(255) NOT NULL,
  metodo VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);

CREATE TABLE Aluga
(
  morada      VARCHAR(255) NOT NULL,
  codigo      INTEGER      NOT NULL,
  data_inicio VARCHAR(255) NOT NULL UNIQUE,
  nif         INTEGER      NOT NULL UNIQUE,
  numero      INTEGER      NOT NULL UNIQUE,
  PRIMARY KEY (morada, codigo, data_inicio, nif, numero),
  FOREIGN KEY (morada, codigo) REFERENCES Oferta (morada, codigo),
  FOREIGN KEY (data_inicio) REFERENCES Oferta (data_inicio),
  FOREIGN KEY (nif) REFERENCES User (nif),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);

CREATE TABLE Estado
(
  numero    INTEGER      NOT NULL UNIQUE,
  timestamp VARCHAR(255) NOT NULL UNIQUE,
  estado    VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero, timestamp),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);
