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
      call Dates_overlap_with_existing_rows();
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
              WHERE estado = "aceite" AND numero = new.numero
                    AND Estado.timestamp > new.data
              GROUP BY numero)
    THEN
      CALL date_must_be_after_estado();
    END IF;
  END //

DELIMITER ;