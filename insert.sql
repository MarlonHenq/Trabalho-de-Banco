USE FORMULAMAGISTRAL;

INSERT INTO CLIENTE
(
    Nome,
    CPF,
    RG,
    DataNascimento
) VALUES
('Rafael Ramos','0000000','000000X','1986-01-05'),
('Lucas Correa','0000001','109900X','2005-08-15'),
('João Pedro','0000002','000000X','2002-11-13'),
('Maria Eduarda','0000003','000000X','2002-07-13'),
('Ana Clara','0000004','004500X','1998-02-09'),
('Gabriela','0000005','000000X','2002-07-12'),
('Isabella','0000006','018000X','1986-06-18'),
('Manuela','0000007','000000X','1998-07-19'),
('Laura','0000008','000360X','2002-03-13'),
('Luiza','0000009','0002340X','1988-07-13'),
('Gabriel','0000019','0003240X','1989-05-15'),
('Valentina','0000010','743300X','1998-07-17'),
('Giovanna','0000011','000750X','2002-09-20'),
('Maria Luiza','0000012','0053500X','1990-09-13'),
('Heloísa','0000013','6363000X','1998-07-20'),
('Lorena','0000014','064065X','1990-12-03'),
('Lívia','0000015','000080X','2002-07-13');
--



-- Fazer uma procedure para validar o CRM e se o Medico já não foi cadastrado
INSERT INTO MEDICO
(
    Nome,
    CRM
) VALUES ('Doutor Ramos','00323390'),
('Doutor Correa','00323391'),
('Doutor Pedro','00323392'),
('Doutora Eduarda','00323393'),
('Doutora Clara','00323394'),
('Doutora Gabriela','00323395'),
('Doutora Isabella','00323396'),
('Doutora Manuela','00323397'),
('Doutora Laura','00323398'),
('Doutora Luiza','00323399'),
('Doutora Valentina','00323400'),
('Doutora Giovanna','00323401'),
('Doutora Luiza','00323402'),
('Doutora Heloísa','00323403'),
('Doutora Lorena','00323404'),
('Doutora Lívia','00323405');

--



-- Fazer uma procedure para colocar o produto de estoque na farmácia
INSERT INTO INSUMO
(
    Nome,
    FatorCorrecao,
    FatorEquivalencia,
    Bula,
    DCB,
    NroPortaria,
    CustoAquisicao,
    MargemLucro
) VALUES ('Ácido acetilsalicílico + cafeína',0.1,1.1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis elementum laoreet tortor, eget imperdiet diam viverra vitae. Donec a urna id ex maximus convallis. Aenean elit tortor, efficitur et commodo in, aliquet ut lorem. Nunc ut luctus enim. Nullam cursus urna libero, eget tincidunt nibh tempor sagittis. Donec vitae justo sit amet risus ullamcorper elementum eget nec magna. Sed maximus metus est, vitae ultrices velit accumsan non.','Doril',123,5.12,100),
('Epinefrina',0.1,1.1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis elementum laoreet tortor, eget imperdiet diam viverra vitae. Donec a urna id ex maximus convallis. Aenean elit tortor, efficitur et commodo in, aliquet ut lorem. Nunc ut luctus enim. Nullam cursus urna libero, eget tincidunt nibh tempor sagittis. Donec vitae justo sit amet risus ullamcorper elementum eget nec magna. Sed maximus metus est, vitae ultrices velit accumsan non.','Epi',456,10.2,30),
('Dipirona',0.1,1.1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis elementum laoreet tortor, eget imperdiet diam viverra vitae. Donec a urna id ex maximus convallis. Aenean elit tortor, efficitur et commodo in, aliquet ut lorem. Nunc ut luctus enim. Nullam cursus urna libero, eget tincidunt nibh tempor sagittis. Donec vitae justo sit amet risus ullamcorper elementum eget nec magna. Sed maximus metus est, vitae ultrices velit accumsan non.','Dip',50,6.15,40),
('Lidocaína',0.3,1.1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis elementum laoreet tortor, eget imperdiet diam viverra vitae. Donec a urna id ex maximus convallis. Aenean elit tortor, efficitur et commodo in, aliquet ut lorem. Nunc ut luctus enim. Nullam cursus urna libero, eget tincidunt nibh tempor sagittis. Donec vitae justo sit amet risus ullamcorper elementum eget nec magna. Sed maximus metus est, vitae ultrices velit accumsan non.','Lido',60,6.15,40)

;

-- Assim que criado o insumo, verifique o id dele e cadastre em Estoque e Restrição

INSERT INTO ESTOQUE
(
    IDInsumo,
    IDLote,
    QuantEstoque,
    UnidadeMedida
) VALUES (1,2,10,'mg'),
(2,1,12,'mg'),
(3,3,100,'mg'),
(4,1,45,'mg');


-- Verifique se tem uma restrição para adicionar

INSERT INTO RESTRICAO
(IDInsumo,
 IDRestricao
 )
VALUES
    (1,2),
    (2,3),
    (2,1),
    (2,4);


-- Fazer uma procedure para Venda, ver qual o produto que o Cliente quer retirar, ver qual o Id do cliente, fazer contagem de estoque da quantidade de produto
INSERT INTO VENDA
(
    DataVenda,
    DataPRevEntrega,
    FormaPgto,
    IDCliente
) VALUES ('2022-12-13','2022-12-13','Débito',1),
('2022-10-30','2022-10-30','Crédito',1),
('2022-09-19','2022-09-19','Débito',3),
('2022-04-20','2022-04-20','Crédito',4),
('2022-02-12','2022-02-12','Débito',3);

--



-- Fazer ???, validar se medico existe, validar se venda existe
INSERT INTO FORMULA
(
    Dose,
    QuantBase,
    UnidadeBase,
    NroNotificacao,
    DataValidade,
    IDVenda,
    IDMedico
) VALUES ('1 a cada 12h',2,'capsula',0,'2022-12-03',1,1),
('2 a cada 08h',1,'capsula',1,'2023-10-10',2,2),
('1 a cada 06h',1,'capsula',1,'2024-09-03',3,4),
('0.5 a cada 12h',2,'capsula',0,'2025-12-21',4,1)
;


-- Fazer ???
INSERT INTO ITEMFORMULA
(
    IDFormula,
    IDInsumo,
    IDLote,
    QuantPrescrita,
    UnidadePrescrita
) VALUES (1,1,1,3,'mg'),
(2,2,2,1,'ml'),
(3,3,3,1,'mg'),
(2,4,1,2,'mg');
