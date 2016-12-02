# a) Quais os espaços com postos que nunca foram alugados?
SELECT
  morada,
  codigo
FROM Espaco
WHERE (morada, codigo) NOT IN (
  SELECT
    morada,
    codigo_espaco AS codigo
  FROM Posto
    NATURAL JOIN Aluga
    NATURAL JOIN Estado
  WHERE estado = "aceite"
);

# b) Quais os edificios com numero de reservas superior a media?
SELECT morada
FROM (
       SELECT AVG(count_reservas) AS average
       FROM (
              SELECT
                morada,
                COUNT(*) AS count_reservas
              FROM Reserva
                NATURAL JOIN Aluga
              GROUP BY morada
            ) AS countT1) AS averageT,
  (
    SELECT
      morada,
      COUNT(*) AS count_reservas
    FROM Reserva
      NATURAL JOIN Aluga
    GROUP BY morada) AS countT2
WHERE count_reservas > average;

#c)Quais utilizadores cujos alugáveis foram fiscalizados sempre pelo mesmo fiscal?
SELECT nif
FROM (SELECT
        nif,
        COUNT(*) AS n_alugaveis
      FROM Arrenda
      GROUP BY nif) AS aux1 NATURAL JOIN
  (SELECT
     count(nif) AS fiscal_count,
     nif,
     id
   FROM Arrenda
     NATURAL JOIN Fiscaliza
   GROUP BY nif, id) AS aux2
WHERE n_alugaveis = fiscal_count;

#MAYBE QUERY D
SELECT
  morada,
  containing_space_code AS codigo,
  SUM(money_made)          total
FROM (
       SELECT
         money_made_table.morada,
         IFNULL(codigo_espaco, money_made_table.codigo) containing_space_code,
         money_made
       FROM Posto
         RIGHT JOIN (
                      SELECT
                        morada,
                        codigo,
                        (1 + DATEDIFF(data_fim, data_inicio)) * tarifa AS money_made
                      FROM Paga
                        NATURAL JOIN Aluga
                        NATURAL JOIN Oferta
                      WHERE YEAR(data) = 2016
                    ) AS money_made_table ON Posto.morada = money_made_table.morada AND Posto.codigo = money_made_table.codigo
     ) AS A
GROUP BY morada, containing_space_code