CREATE DATABASE db_vendadecarros;
USE db_vendadecarros;

CREATE TABLE carros (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    combustivel VARCHAR(1) NOT NULL
);

INSERT INTO carros (placa, marca, modelo, ano, combustivel) VALUES
    ('ABC1234', 'Ford', 'Corcel II', 1982, 'G'),
    ('JKG5678', 'Ford', 'Focus', 2001, 'A'),
    ('LKO8954', 'Renault', 'Clio', 2007, 'F'),
    ('MMS1609', 'VolksWagen', 'Fusca', 1973, 'G'),
    ('ASD123', 'Honda', 'Civic', 2010, 'F'),
    ('gtr4596', 'GM', 'Corsa', 2004, 'A');

SELECT * FROM carros;

CREATE TABLE vendedores (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carro VARCHAR(10) NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    comissao DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (carro) REFERENCES carros(placa)
);

INSERT INTO vendedores (codigo, nome, carro, cidade, estado, comissao) VALUES
    (1, 'Juca da Silva', 'ABC1234', 'Pelotas', 'RS', 3.50),
    (3, 'Antonio Vieira', 'JKG5678', 'Dois Vizinhos', 'PR', 5.00),
    (44, 'Julieta da Silva', NULL, 'Verê', 'PR', 2.50),
    (6, 'Maria Francisca', 'LKO8954', 'Dois Vizinhos', 'PR', 2.00),
    (45, 'Marieta da Silva', NULL, 'Verê', 'PR', 2.80),
    (9, 'juca silva', NULL, 'PELOTAS', 'RS', 3.50),
    (18, 'Maria Guedes', 'MMS1609', 'Brasília', 'DF', 5.40),
    (20, 'Jian de Barros', 'ASD123', 'Curitiba', 'PR', 3.40),
    (28, 'Fagundes de azevedo', NULL, 'Verê', 'PR', 2.80),
    (40, 'Ari Ribas', 'gtr4596', 'Erechim', 'RS', 3.50);

SELECT * FROM vendedores;

INSERT INTO carros (placa, marca, modelo, ano, combustivel) VALUES
    ('NEl1010', 'Fiat', 'Uno', 2012, 'F'),
    ('NPW2020', 'Chevrolet', 'Onix', 2019, 'F'),
    ('NEW3030', 'Volkswagen', 'Gol', 2015, 'G'),
    ('LAL0220', 'Pegeot', '206', 2010, 'G');

SELECT * FROM carros;

UPDATE vendedores
SET carro = 'NEl1010'
WHERE codigo = 44;

UPDATE vendedores
SET carro = 'NPW2020' 
WHERE codigo = 45;

UPDATE vendedores 
SET carro = 'NEW3030' 
WHERE codigo = 9;

UPDATE vendedores 
SET carro = 'LAL0220' 
WHERE codigo = 28;

SELECT * FROM vendedores;