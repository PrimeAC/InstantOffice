SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN Localizacao
GROUP BY date_month_number,
  date_day,
  posto,
  espaco WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  NULL AS date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN Localizacao
GROUP BY posto, date_month_number,
  espaco WITH ROLLUP
UNION SELECT
        avg(value),
        NULL AS date_month_number,
        date_day,
        posto,
        espaco
      FROM Reserva_Factos
        NATURAL JOIN Data
        NATURAL JOIN Localizacao
      GROUP BY date_day, posto,
        espaco WITH ROLLUP
UNION SELECT
        avg(value),
        date_month_number,
        date_day,
        NULL AS posto,
        espaco
      FROM Reserva_Factos
        NATURAL JOIN Data
        NATURAL JOIN Localizacao
      GROUP BY espaco, date_day,
        date_month_number WITH ROLLUP
UNION SELECT
        avg(value),
        date_month_number,
        NULL AS date_day,
        NULL AS posto,
        espaco
      FROM Reserva_Factos
        NATURAL JOIN Data
        NATURAL JOIN Localizacao
      GROUP BY date_month_number,
        espaco WITH ROLLUP
UNION SELECT
        avg(value),
        NULL AS date_month_number,
        NULL AS date_day,
        posto,
        espaco
      FROM Reserva_Factos
        NATURAL JOIN Data
        NATURAL JOIN Localizacao
      GROUP BY posto,
        espaco WITH ROLLUP;