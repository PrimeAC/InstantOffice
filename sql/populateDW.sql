SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE Tempo;
TRUNCATE Data;
TRUNCATE Localizacao;
TRUNCATE Reserva_Factos;
SET FOREIGN_KEY_CHECKS = 1;

CALL load_date_dim();

CALL load_time_dim();

INSERT INTO Localizacao (espaco, edificio) (
  SELECT
    codigo,
    morada
  FROM Espaco);

INSERT INTO Localizacao (posto, espaco, edificio) (
SELECT
codigo,
codigo_espaco,
morada
FROM Posto);

INSERT INTO Reserva_Factos (reserva_id, date_id, time_id, location_id, nif, value, duration) (
  SELECT
    numero,
    date_id,
    time_id,
    location_id,
    nif,
    tarifa * (DATEDIFF(data_fim, data_inicio) + 1),
    DATEDIFF(data_fim, data_inicio) + 1
  FROM Paga P
    NATURAL JOIN Aluga
    NATURAL JOIN Oferta O
    NATURAL LEFT JOIN Posto
    JOIN Localizacao L
      ON L.edificio = O.morada AND
         (L.espaco = O.codigo AND
          L.posto IS NULL) OR
         (L.posto = O.codigo AND
          L.espaco = Posto.codigo_espaco)
    JOIN Data D
      ON D.date_day = DAY(P.data) AND
         D.date_month_number = MONTH(P.data) AND
         D.date_year = YEAR(P.data)
    JOIN Tempo T
      ON T.hour_of_day = HOUR(P.data) AND
         T.minute_of_day = MINUTE(P.data)
);

