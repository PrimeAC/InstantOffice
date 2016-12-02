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
  WHERE estado = 'aceite'
);

# b) Quais os edificios com numero de reservas superior a media?
SELECT morada
FROM Aluga
GROUP BY morada
HAVING COUNT(*) > (
  SELECT AVG(count_reservas) AS average
  FROM (
         SELECT
           morada,
           COUNT(*) AS count_reservas
         FROM Aluga
         GROUP BY morada
       ) AS countT1
);

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

# e)
SELECT
  morada,
  codigo
FROM Espaco
WHERE (morada, codigo) NOT IN (
  SELECT DISTINCT
    morada,
    codigo_espaco AS codigo
  FROM Posto
  WHERE (morada, codigo, codigo_espaco) NOT IN (
    SELECT
      morada,
      codigo,
      codigo_espaco
    FROM Posto
      NATURAL JOIN Aluga
      NATURAL JOIN Estado
    WHERE estado = 'aceite'
  )
)
