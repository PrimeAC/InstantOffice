SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco,
  edificio
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id,
                  edificio
                FROM Localizacao) A
GROUP BY date_month_number,
  date_day,
  posto,
  espaco,
  edificio WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco,
  edificio
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id,
                  edificio
                FROM Localizacao) A
GROUP BY
  date_day,
  posto,
  espaco,
  edificio,
  date_month_number WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco,
  edificio
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id,
                  edificio
                FROM Localizacao) A
GROUP BY
  posto,
  espaco,
  edificio,
  date_month_number,
  date_day WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco,
  edificio
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id,
                  edificio
                FROM Localizacao) A
GROUP BY
  espaco,
  edificio,
  date_month_number,
  date_day,
  posto WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco,
  edificio
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id,
                  edificio
                FROM Localizacao) A
GROUP BY
  edificio,
  date_month_number,
  date_day,
  posto,
  espaco WITH ROLLUP;