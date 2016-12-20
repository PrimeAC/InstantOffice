#Triggers
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

#populates Date table
DROP PROCEDURE IF EXISTS load_date_dim;
DELIMITER //
CREATE PROCEDURE load_date_dim()
  BEGIN
    DECLARE v_full_date DATETIME;
    SET v_full_date = '2016-01-01 00:00:00';
    WHILE v_full_date < '2018-01-01 00:00:00' DO
      INSERT INTO Data(
        date_id,
        date_day,
        date_week,
        date_month_number,
        date_semester,
        date_year,
        data
      ) VALUES (
        YEAR(v_full_date) * 10000 + MONTH(v_full_date)*100 + DAY(v_full_date),
        DAY(v_full_date),
        WEEK(v_full_date),
        MONTH(v_full_date),
        (QUARTER(v_full_date) / 6) + 1,
        YEAR(v_full_date),
        DATE(v_full_date)
      );
      SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
    END WHILE;
  END;
//

DELIMITER ;

#populates Time table
DROP PROCEDURE IF EXISTS load_time_dim;
DELIMITER //

CREATE PROCEDURE load_time_dim()
  BEGIN
    DECLARE v_full_time DATETIME;
    SET v_full_time = '1996-04-25 00:00:00';
    WHILE v_full_time < '1996-04-25 23:59:59' DO
      INSERT INTO Tempo (
        time_of_day,
        hour_of_day,
        minute_of_day
      ) VALUES (
        HOUR(v_full_time)*60 + MINUTE(v_full_time),
        HOUR(v_full_time),
        MINUTE(v_full_time)
      );
      SET v_full_time = DATE_ADD(v_full_time, INTERVAL 1 MINUTE);
    END WHILE;
  END;
//

DELIMITER ;
