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
);