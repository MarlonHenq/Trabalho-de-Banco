DELIMITER $$

CREATE PROCEDURE InserirItemFormula(IN PIDFormula INT, IN PIDInsumo INT,IN IDLote INT, IN QuantPrescrita INT, IN UnidadePrescrita VARCHAR(30))
BEGIN

    IF ((SELECT COUNT(*) FROM (SELECT R.IDRestricao FROM (SELECT I.IDFormula, I.IDInsumo FROM ITEMFORMULA as I WHERE I.IDFormula = PIDFormula) as I, RESTRICAO as R WHERE R.IDInsumo = I.IDInsumo) as R WHERE R.IDRestricao = PIDInsumo) > 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não foi possível incluir o INSUMO devido a uma restrição medicamentosa';
    ELSE
        IF ((SELECT COUNT(*) FROM (SELECT IDFormula,IDInsumo,IDLote FROM ITEMFORMULA as I WHERE I.IDFormula = PIDFormula and I.IDInsumo = IDInsumo and I.IDLote = IDLote) AS nome) > 0) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não foi possível incluir o INSUMO devido a ele já ter sido inserido anteriormente';
        ELSE
            INSERT INTO ITEMFORMULA (IDFormula, IDInsumo, IDLote, QuantPrescrita, UnidadePrescrita) VALUES (PIDFormula, PIDInsumo, IDLote, QuantPrescrita, UnidadePrescrita);
        END IF;
    END IF;

END $$

DELIMITER ;
