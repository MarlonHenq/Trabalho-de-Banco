/*
    Grupo:
        Gustavo Henrique Cardoso de Araújo 2386712
        Marlon Henrique Sanches 2407388
        Rafael Ramos da Silva 2422719
*/

CREATE DATABASE FORMULAMAGISTRAL;

USE FORMULAMAGISTRAL;

Create table CLIENTE(
    IDCliente int PRIMARY KEY auto_increment,
    Nome VARCHAR(255),
    CPF varchar(11),
    RG varchar(15),
    DataNascimento date
);

Create table MEDICO(
    IDMedico int PRIMARY KEY auto_increment,
    Nome VARCHAR(255),
    CRM varchar(15)
);

Create table INSUMO(
    IDInsumo int PRIMARY KEY auto_increment,
    Nome VARCHAR(255),
    FatorCorrecao float(7,4),
    FatorEquivalencia float(7,4),
    Bula text,
    DCB text,
    NroPortaria int,
    CustoAquisicao float(10,2),
    MargemLucro float(12,4)
);

Create table ESTOQUE(
    IDInsumo int,
    IDLote int,
    QuantEstoque int,
    UnidadeMedida varchar(30),
    FOREIGN KEY FK_INSUMO (IDInsumo) REFERENCES INSUMO (IDInsumo),
    PRIMARY KEY (IDLote, IDInsumo)
);

Create table RESTRICAO(
    IDInsumo int,
    IDRestricao int,
    FOREIGN KEY FK_INSUMO (IDInsumo) REFERENCES INSUMO (IDInsumo),
    FOREIGN KEY FK_RESTRICAO (IDRestricao) REFERENCES INSUMO (IDInsumo),
    PRIMARY KEY (IDInsumo, IDRestricao)
);

Create table VENDA(
    IDVenda int PRIMARY KEY auto_increment,
    DataVenda date,
    DataPRevEntrega date,
    FormaPgto varchar(30),
    IDCliente int,
    FOREIGN KEY FK_CLIENTE (IDCliente) REFERENCES CLIENTE (IDCliente)
);

Create table FORMULA(
    IDFormula int PRIMARY KEY auto_increment,
    Dose varchar(255),
    QuantBase int,
    UnidadeBase varchar(30),
    NroNotificacao int,
    DataValidade date,
    IDVenda int,
    IDMedico int,
    FOREIGN KEY FK_VENDA (IDVenda) REFERENCES VENDA (IDVenda),
    FOREIGN KEY FK_MEDICO (IDMedico) REFERENCES MEDICO (IDMedico)
);

Create table ITEMFORMULA(
    IDFormula int,
    IDInsumo int,
    IDLote int,
    QuantPrescrita int,
    UnidadePrescrita varchar(30),
    FOREIGN KEY FK_FORMULA (IDFormula) REFERENCES FORMULA (IDFormula),
    FOREIGN KEY FK_INSUMO (IDInsumo) REFERENCES INSUMO (IDInsumo),
    FOREIGN KEY FK_ESTOQUE (IDLote) REFERENCES ESTOQUE (IDLote),
    PRIMARY KEY (IDFormula, IDInsumo, IDLote)
);
