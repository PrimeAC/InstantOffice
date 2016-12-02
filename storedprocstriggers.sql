DROP TRIGGER IF EXISTS validate_dates;

DELIMITER //

# RI-1: "Não podem existir ofertas com datas sobrepostas"
CREATE TRIGGER validate_dates
BEFORE INSERT ON Oferta
FOR EACH ROW
  BEGIN
    IF exists(SELECT data_inicio
              FROM Oferta
              WHERE Oferta.morada = NEW.morada
                    AND Oferta.codigo = NEW.codigo
                    AND NEW.data_inicio < Oferta.data_fim
                    AND NEW.data_fim > Oferta.data_inicio)
    THEN
      CALL Dates_overlap_with_existing_rows();
    END IF;
  END //

DELIMITER ;


DROP TRIGGER IF EXISTS superior_date;

DELIMITER //

#b)RI-2: "A data de pagamento de uma reserva paga tem de ser superior ao timestamp do
#último estado dessa reserva"
CREATE TRIGGER superior_date
BEFORE INSERT ON Paga
FOR EACH ROW
  BEGIN
    IF EXISTS(SELECT *
              FROM Estado
              WHERE estado = 'aceite' AND numero = new.numero
                    AND Estado.timestamp > new.data
              GROUP BY numero)
    THEN
      CALL date_must_be_after_estado();
    END IF;
  END //

DELIMITER ;


# Stored Procedures
DROP PROCEDURE IF EXISTS totalPorEspaco;

DELIMITER //
# sums the total made by each space inside the given edificio
CREATE PROCEDURE totalPorEspaco(moradaToFind VARCHAR(255))
  BEGIN
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
                          WHERE morada = moradaToFind
                        ) AS money_made_table
               ON Posto.morada = money_made_table.morada AND Posto.codigo = money_made_table.codigo
         ) AS A
    GROUP BY morada, containing_space_code;
  END;
//

DELIMITER ;
