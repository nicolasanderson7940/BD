CREATE DATABASE confeitaria_db;

USE confeitaria_db;


CREATE TABLE tbl_confeitaria (
    CNPJ VARCHAR(18) PRIMARY KEY,
    Endereco VARCHAR(150),
    Telefone VARCHAR(20)
);

INSERT INTO tbl_confeitaria (CNPJ, Endereco, Telefone) VALUES
('12.345.678/0001-90', 'Rua das Flores, 120', '(11) 90254-2011'),
('23.456.789/0001-81', 'Av. Brasil, 250', '(11) 91234-5678'),
('34.567.890/0001-72', 'Rua do Egito, 80', '(11) 96776-6942'),
('45.678.901/0001-63', 'Rua Central, 45', '(11) 93456-7890'),
('56.789.012/0001-54', 'Av. Paulista, 500', '(11) 94567-1234');

SELECT * FROM tbl_confeitaria;

CREATE TABLE tbl_produto (
    Codigo INT PRIMARY KEY,
    Valor_Kg DECIMAL(10,2),
    Descricao VARCHAR(100)
);

INSERT INTO tbl_produto (Codigo, Valor_Kg, Descricao) VALUES
(6163, 67.99, 'Bolo'),
(4742, 20.99, 'Açai'),
(6742, 11.99, 'Salgado'),
(3281, 35.50, 'Doce'),
(9054, 42.75, 'Torta');

SELECT * FROM tbl_produto;

CREATE TABLE tbl_cliente (
    Codigo_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14)
);

INSERT INTO tbl_cliente (Codigo_Cliente, Nome, CPF) VALUES
(1, 'Ana', '420.873.670-11'),
(2, 'David', '244.101.120-17'),
(3, 'Yasmin', '345.732.673-10'),
(4, 'Lucas', '518.294.630-25'),
(5, 'Julia', '673.845.210-08');

SELECT * FROM tbl_cliente;

CREATE TABLE tbl_telefone (
    ID_Telefone INT PRIMARY KEY,
    Codigo_Cliente INT,
    Telefone VARCHAR(20),
    FOREIGN KEY (Codigo_Cliente) REFERENCES tbl_cliente(Codigo_Cliente)
);

INSERT INTO tbl_telefone (ID_Telefone, Codigo_Cliente, Telefone) VALUES
(1, 2, '(11) 90254-2011'),
(2, 3, '(11) 91234-5678'),
(3, 1, '(11) 96776-6942'),
(4, 5, '(11) 93456-7890'),
(5, 4, '(11) 94567-1234');

SELECT * FROM tbl_telefone;

CREATE TABLE tbl_pedido (
    ID_Pedido INT PRIMARY KEY,
    Bolo VARCHAR(10),
    Doce VARCHAR(10),
    Salgado VARCHAR(10)
);

INSERT INTO tbl_pedido (ID_Pedido, Bolo, Doce, Salgado) VALUES
(1, 'Não', 'Sim', 'Sim'),
(2, 'Sim', 'Não', 'Não'),
(3, 'Não', 'Sim', 'Sim'),
(4, 'Sim', 'Sim', 'Não'),
(5, 'Não', 'Não', 'Sim');

SELECT * FROM tbl_pedido;

CREATE TABLE tbl_item_pedido (
    Codigo_Pedido INT,
    Codigo_Item INT,
    Codigo_Produto INT,
    PRIMARY KEY (Codigo_Pedido, Codigo_Item),
    FOREIGN KEY (Codigo_Pedido) REFERENCES tbl_pedido(ID_Pedido),
    FOREIGN KEY (Codigo_Produto) REFERENCES tbl_produto(Codigo)
);

INSERT INTO tbl_item_pedido (Codigo_Pedido, Codigo_Item, Codigo_Produto) VALUES
(2, 1, 6742),
(1, 2, 6163),
(3, 3, 4742),
(4, 4, 9054),
(5, 5, 3281);

SELECT * FROM tbl_item_pedido;

CREATE TABLE tbl_endereco (
    ID_Endereco INT PRIMARY KEY,
    Logradouro VARCHAR(150),
    Numero INT,
    Bairro VARCHAR(100),
    Cidade VARCHAR(100)
);

INSERT INTO tbl_endereco (ID_Endereco, Logradouro, Numero, Bairro, Cidade) VALUES
(1, 'Rua do Futuro', 67, 'Wallace', 'São Paulo'),
(2, 'Rua das Flores', 69, 'Triple T', 'Xique-Xique'),
(3, 'Rua do Egito', 42, 'Yaqueen', 'Belo Horizonte'),
(4, 'Av. Brasil', 120, 'Centro', 'Campinas'),
(5, 'Rua Central', 25, 'Jardim', 'Santos');

SELECT * FROM tbl_endereco;