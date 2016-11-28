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
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Dates overlap with existing rows';
    END IF;
  END //

DELIMITER ;
