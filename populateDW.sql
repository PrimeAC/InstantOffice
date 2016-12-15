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

/*
(SELECT date_id FROM Data WHERE date_day = (SELECT DAY(data) FROM Paga WHERE numero = new.numero) AND
                 date_month_number = (SELECT MONTH(data) FROM Paga WHERE numero = new.numero) AND
                 date_year = (SELECT YEAR(data) FROM Paga WHERE numero = new.numero));

      #SET time = (SELECT time_id FROM Tempo WHERE hour_of_day = (SELECT HOUR(data) FROM Paga WHERE numero = new.numero) AND
      #            minute_of_day = (SELECT MINUTE(data) FROM Paga WHERE numero = new.numero));

      #SET location = (SELECT location_id FROM Localizacao l, (SELECT morada, codigo FROM Paga NATURAL JOIN Aluga WHERE numero = new.numero) AS
      #                A WHERE A.codigo = l.posto OR A.codigo = l.espaco AND l.edificio = A.morada);

      SET nif = (SELECT a.nif FROM Aluga a NATURAL JOIN Paga p WHERE p.numero = new.numero);

      SET value = (SELECT DATEDIFF(data_fim, data_inicio) * tarifa AS result FROM Paga NATURAL JOIN Aluga NATURAL JOIN
                  Oferta WHERE numero = new.numero);

    INSERT INTO Reserva_Factos (reserva_id, date_id, time_id, location_id, nif, value) VALUES (new.numero, data, 0, 0, nif, value);
  END //

DELIMITER ;

*/