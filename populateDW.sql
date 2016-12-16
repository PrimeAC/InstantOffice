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

SELECT date_id FROM Data NATURAL JOIN Paga;

SELECT time_id FROM Tempo NATURAL JOIN (SELECT MINUTE(data) + HOUR(data) * 60 AS time_of_day FROM Paga) A;

SELECT nif FROM Aluga NATURAL JOIN Paga GROUP BY nif;

SELECT DATEDIFF(data_fim, data_inicio) * tarifa AS value FROM Paga NATURAL JOIN Aluga NATURAL JOIN Oferta;

SELECT DATEDIFF(data_fim, data_inicio) AS duration FROM Paga NATURAL JOIN Aluga NATURAL JOIN Oferta;

