DELIMITER $$

    CREATE TRIGGER ATUALIZA_ESTOQUE
    BEFORE INSERT
    ON ITEMFORMULA FOR EACH ROW

    BEGIN
        -- 1
        IF (NEW.UnidadePrescrita = 'mg') THEN
            BEGIN
                SET @qtd_prescrita = (NEW.QuantPrescrita / 1000);
            END;
        END IF;
        --



        -- 2
        SELECT FatorEquivalencia INTO @fator_de_equivalencia FROM INSUMO WHERE IDInsumo = NEW.IDInsumo;

        SET @aplicado_equivalencia = @qtd_prescrita * @fator_de_equivalencia;
        --



        -- 3
        SELECT FatorCorrecao INTO @fator_de_correcao FROM INSUMO WHERE IDInsumo = NEW.IDInsumo;

        SET @aplicado_correcao = @aplicado_equivalencia * (@fator_de_correcao + 1);



        -- 4
        SELECT QuantBase INTO @qtd_base FROM FORMULA WHERE IDFormula = NEW.IDFormula;

        SET @qtd_solicitada = @qtd_base * @aplicado_correcao;
        --


        -- Retirada do estoque
        SELECT QuantEstoque INTO @qtd_estoque FROM ESTOQUE WHERE IDInsumo = NEW.IDInsumo and IDLote = NEW.IDLote;
        IF (@qtd_estoque >= @qtd_solicitada) THEN
            BEGIN
                UPDATE ESTOQUE SET QuantEstoque = (@qtd_estoque - @qtd_solicitada) WHERE IDInsumo = NEW.IDInsumo and IDLote = NEW.IDLote;
            END;
        END IF;
        --

    END;
$$
DELIMITER ;
