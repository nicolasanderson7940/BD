
CREATE DATABASE firma_db;

USE firma_db;

CREATE TABLE tbl_cliente(
	id_cliente INT,
	nome VARCHAR(100),
	endereco VARCHAR(100),
	email VARCHAR(200),
	status VARCHAR(40),
	telefone_cliente VARCHAR(21),
	limite_de_credito FLOAT,
	PRIMARY KEY (id_cliente)
);

INSERT INTO tbl_cliente 
(id_cliente, nome, endereco, email, status, telefone_cliente, limite_de_credito) 
VALUES
	(1, 'João Gomes', 'Rua dos Aurudo 67', 'aura67@gmail.com', 'Bom', '98775-9667', 100),
	(2, 'Larissa Manuela', 'Praça do dinheiro 100', 'SoyBrabo@gmail.com', 'RUIM', '95565-9689', 0),
	(3, 'TralareloTralala', 'Rua Mação da raiva', 'laringologista@gmail.com', 'REGULAR', '95643-9554', 1000),
	(4, 'Lucas', 'Rua Dos Bobos', 'Vaseferrar@gmail.com', 'BOM', '95463-9274', 200),
	(5, 'Harry Pereira', 'Rua Everybory', 'CavalosSaltitantes@gmail.com', 'BOM', '92433-2554', 666);

SELECT * FROM tbl_cliente;


CREATE TABLE tbl_produto(
	id_produto INT,
	nome_produto VARCHAR(100),
	preco FLOAT,
	quant_estoque INT,
	categoria VARCHAR(100),
	PRIMARY KEY (id_produto)
);

INSERT INTO tbl_produto (id_produto, nome_produto, preco, quant_estoque, categoria) VALUES
	(6, 'Sabamais', 876.54, 1, 'liquido'),
	(7, 'LimpaPlus', 1.25, 1000, 'pano'),
	(8, 'Omo', 0.50, 6700, 'pó'),
	(9, 'Admire', 5.09, 10, 'liquido'),
	(10, 'Pipa', 0.01, 2000, 'liquido');

SELECT * FROM tbl_produto;


CREATE TABLE tbl_pedido(
	id_pedido INT,
	id_cliente INT,
	id_produto INT,
	valor_total FLOAT,
	data_de_elaboracao INT,
	end_entrega VARCHAR(100),
	PRIMARY KEY (id_pedido),
	FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente),
	FOREIGN KEY (id_produto) REFERENCES tbl_produto(id_produto)
);

INSERT INTO tbl_pedido (id_pedido, id_cliente, id_produto, valor_total, data_de_elaboracao, end_entrega) VALUES
	(1, 1, 6, 876.54, 15092026, 'Rua dos Aurudo 67'),
	(2, 3, 7, 12.50, 14092026, 'Rua Mação da Raiva'),
	(3, 2, 8, 25.00, 13092026, 'Praça do Dinheiro 100'),
	(4, 5, 9, 50.90, 12092026, 'Rua Everybory'),
	(5, 4, 10, 0.01, 11092026, 'Rua Dos Bobos');

SELECT * FROM tbl_pedido;