SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS User CASCADE;
DROP TABLE IF EXISTS Fiscal CASCADE;
DROP TABLE IF EXISTS Edificio CASCADE;
DROP TABLE IF EXISTS Alugavel CASCADE;
DROP TABLE IF EXISTS Arrenda CASCADE;
DROP TABLE IF EXISTS Fiscaliza CASCADE;
DROP TABLE IF EXISTS Espaco CASCADE;
DROP TABLE IF EXISTS Posto CASCADE;
DROP TABLE IF EXISTS Oferta CASCADE;
DROP TABLE IF EXISTS Aluga CASCADE;
DROP TABLE IF EXISTS Paga CASCADE;
DROP TABLE IF EXISTS Estado CASCADE;
DROP TABLE IF EXISTS Reserva CASCADE;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE User
(
  nif      INTEGER      NOT NULL,
  nome     VARCHAR(255) NOT NULL,
  telefone INTEGER      NOT NULL,
  PRIMARY KEY (nif)
);

CREATE TABLE Fiscal
(
  id      INTEGER      NOT NULL,
  empresa VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Edificio
(
  morada VARCHAR(255) NOT NULL,
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
  id     INTEGER      NOT NULL,
  morada VARCHAR(255) NOT NULL,
  codigo INTEGER      NOT NULL,
  PRIMARY KEY (id, morada, codigo),
  FOREIGN KEY (id) REFERENCES Fiscal (id),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo)
);

CREATE TABLE Espaco
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
  codigo_espaco INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo),
  FOREIGN KEY (morada, codigo_espaco) REFERENCES Espaco (morada, codigo)
);

CREATE TABLE Oferta
(
  morada      VARCHAR(255) NOT NULL,
  codigo      INTEGER      NOT NULL,
  data_inicio TIMESTAMP    NOT NULL,
  data_fim    TIMESTAMP    NOT NULL,
  tarifa      INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo, data_inicio),
  FOREIGN KEY (morada, codigo) REFERENCES Alugavel (morada, codigo)
);

CREATE TABLE Reserva
(
  numero INTEGER NOT NULL,
  PRIMARY KEY (numero)
);

CREATE TABLE Paga
(
  numero INTEGER      NOT NULL,
  data   VARCHAR(255) NOT NULL,
  metodo VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);

CREATE TABLE Aluga
(
  morada      VARCHAR(255) NOT NULL,
  codigo      INTEGER      NOT NULL,
  data_inicio TIMESTAMP    NOT NULL,
  nif         INTEGER      NOT NULL,
  numero      INTEGER      NOT NULL,
  PRIMARY KEY (morada, codigo, data_inicio, nif, numero),
  FOREIGN KEY (morada, codigo, data_inicio) REFERENCES Oferta (morada, codigo, data_inicio),
  FOREIGN KEY (nif) REFERENCES User (nif),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);

CREATE TABLE Estado
(
  numero    INTEGER      NOT NULL,
  timestamp TIMESTAMP    NOT NULL,
  estado    VARCHAR(255) NOT NULL,
  PRIMARY KEY (numero, timestamp),
  FOREIGN KEY (numero) REFERENCES Reserva (numero)
);
