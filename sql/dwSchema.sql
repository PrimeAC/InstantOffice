SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Localizacao CASCADE;
DROP TABLE IF EXISTS Tempo CASCADE;
DROP TABLE IF EXISTS Data CASCADE;
DROP TABLE IF EXISTS Reserva_Factos CASCADE;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Localizacao
(
  location_id INTEGER NOT NULL AUTO_INCREMENT,
  posto       INTEGER,
  espaco      INTEGER,
  edificio    VARCHAR(255),
  PRIMARY KEY (location_id)
);

CREATE TABLE Tempo
(
  time_id       INTEGER NOT NULL AUTO_INCREMENT,
  time_of_day   INTEGER NOT NULL,
  hour_of_day   INTEGER NOT NULL,
  minute_of_day INTEGER NOT NULL,
  PRIMARY KEY (time_id)
);

CREATE TABLE Data
(
  date_id           INTEGER NOT NULL,
  date_day          INTEGER NOT NULL,
  date_week         INTEGER NOT NULL,
  date_month_number INTEGER NOT NULL,
  date_semester     INTEGER NOT NULL,
  date_year         INTEGER NOT NULL,
  data              DATE    NOT NULL,
  PRIMARY KEY (date_id)
);

CREATE TABLE Reserva_Factos
(
  reserva_id  INTEGER NOT NULL,
  date_id     INTEGER NOT NULL,
  time_id     INTEGER NOT NULL,
  location_id INTEGER NOT NULL,
  nif         INTEGER NOT NULL,
  value       INTEGER NOT NULL,
  duration    INTEGER NOT NULL,
  PRIMARY KEY (reserva_id, date_id, time_id),
  FOREIGN KEY (date_id) REFERENCES Data (date_id)
    ON DELETE CASCADE,
  FOREIGN KEY (time_id) REFERENCES Tempo (time_id)
    ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES Localizacao (location_id)
    ON DELETE CASCADE,
  FOREIGN KEY (nif) REFERENCES User (nif)
    ON DELETE CASCADE
);