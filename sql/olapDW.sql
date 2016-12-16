SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id
                FROM Localizacao) A
GROUP BY date_month_number,
  date_day,
  posto,
  espaco WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id
                FROM Localizacao) A
GROUP BY
  date_day,
  posto,
  espaco,
  date_month_number WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id
                FROM Localizacao) A
GROUP BY
  posto,
  espaco,
  date_month_number,
  date_day WITH ROLLUP
UNION
SELECT
  avg(value),
  date_month_number,
  date_day,
  posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id
                FROM Localizacao) A
GROUP BY
  espaco,
  date_month_number,
  date_day,
  posto WITH ROLLUP
UNION
SELECT
  avg(value),
  NULL AS date_month_number,
  date_day,
  NULL AS posto,
  espaco
FROM Reserva_Factos
  NATURAL JOIN Data
  NATURAL JOIN (SELECT
                  IFNULL(posto, -9999) AS posto,
                  espaco,
                  location_id
                FROM Localizacao) A
GROUP BY espaco, date_day
UNION SELECT
        avg(value),
        date_month_number,
        NULL AS date_day,
        posto,
        NULL AS espaco
      FROM Reserva_Factos
        NATURAL JOIN Data
        NATURAL JOIN (SELECT
                        IFNULL(posto, -9999) AS posto,
                        espaco,
                        location_id
                      FROM Localizacao) A
      GROUP BY date_month_number, posto;
