CREATE DATABASE automotiva_db;

USE automotiva_db;

CREATE TABLE Funcionario (
    CodFuncionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    Cargo VARCHAR(50)
);


INSERT INTO Funcionario (CodFuncionario, Nome, CPF, Cargo) VALUES
	(1, 'Carlos Silva', '381.542.719-06', 'Vendedor'),
	(2, 'Mariana Santos', '729.163.458-21', 'Gerente'),
	(3, 'Joao Oliveira', '514.827.306-49', 'Atendente'),
	(4, 'Ana Souza', '963.415.782-10', 'Caixa'),
	(5, 'Pedro Costa', '246.739.581-32', 'Vendedor');

	SELECT * FROM Funcionario;


CREATE TABLE Cliente (
    CodCliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    TipoCliente VARCHAR(30),
    DescontoEspecial DECIMAL(5,2)
);

INSERT INTO Cliente (CodCliente, Nome, TipoCliente, DescontoEspecial) VALUES
	(1, 'Lucas Almeida', 'Pessoa Fisica', 5.00),
	(2, 'Beatriz Lima', 'Pessoa Fisica', 10.00),
	(3, 'Mercado Central', 'Pessoa Juridica', 15.00),
	(4, 'Rafael Mendes', 'Pessoa Fisica', 0.00),
	(5, 'Loja do GG', 'Pessoa Juridica', 20.00);

	SELECT * FROM Cliente;

CREATE TABLE Fornecedor (
    CodFornecedor INT PRIMARY KEY,
    RazaoSocial VARCHAR(100),
    CNPJ VARCHAR(18)
);

INSERT INTO Fornecedor (CodFornecedor, RazaoSocial, CNPJ) VALUES
	(1, 'Metalurgica Brasil LTDA', '18.426.735/0001-42'),
	(2, 'Pecas Sao Paulo LTDA', '32.751.864/0001-19'),
	(3, 'Ferragens Nacional LTDA', '47.293.618/0001-53'),
	(4, 'Industria ABC LTDA', '61.584.327/0001-76'),
	(5, 'Distribuidora Paulista LTDA', '85.316.492/0001-08');

	SELECT * FROM Fornecedor;

CREATE TABLE Telefone_Funcionario (
    IdTelefoneFuncionario INT PRIMARY KEY,
    Numero VARCHAR(20),
    Tipo VARCHAR(20),
    CodFuncionario INT,
    FOREIGN KEY (CodFuncionario) REFERENCES Funcionario(CodFuncionario)
);

INSERT INTO Telefone_Funcionario (IdTelefoneFuncionario, Numero, Tipo, CodFuncionario) VALUES
	(1, '(11) 91234-5678', 'Celular', 1),
	(2, '(11) 92345-6789', 'Celular', 2),
	(3, '(11) 93456-7890', 'Celular', 3),
	(4, '(11) 94567-8901', 'Celular', 4),
	(5, '(11) 95678-9012', 'Celular', 5);

	SELECT * FROM Telefone_Funcionario;

CREATE TABLE Telefone_Cliente (
    IdTelefoneCliente INT PRIMARY KEY,
    Numero VARCHAR(20),
    Tipo VARCHAR(20),
    CodCliente INT,
    FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente)
);

INSERT INTO Telefone_Cliente (IdTelefoneCliente, Numero, Tipo, CodCliente) VALUES
	(1, '(11) 96781-2345', 'Celular', 1),
	(2, '(11) 97892-3456', 'Celular', 2),
	(3, '(11) 98903-4567', 'Comercial', 3),
	(4, '(11) 99014-5678', 'Celular', 4),
	(5, '(11) 90125-6789', 'Comercial', 5);
	
	SELECT * FROM Telefone_Cliente;

CREATE TABLE Telefone_Fornecedor (
    IdTelefoneFornecedor INT PRIMARY KEY,
    Numero VARCHAR(20),
    Tipo VARCHAR(20),
    CodFornecedor INT,
    FOREIGN KEY (CodFornecedor) REFERENCES Fornecedor(CodFornecedor)
);

INSERT INTO Telefone_Fornecedor (IdTelefoneFornecedor, Numero, Tipo, CodFornecedor)VALUES
	(1, '(11) 95512-3487', 'Comercial', 1),
	(2, '(11) 96623-4598', 'Comercial', 2),
	(3, '(11) 97734-5609', 'Comercial', 3),
	(4, '(11) 98845-6710', 'Comercial', 4),
	(5, '(11) 99956-7821', 'Comercial', 5);
	
	SELECT * FROM Telefone_Fornecedor;

CREATE TABLE Peca (
    CodPeca INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao VARCHAR(255),
    PrecoUnitario DECIMAL(10,2),
    CodFornecedor INT,
    FOREIGN KEY (CodFornecedor) REFERENCES Fornecedor(CodFornecedor)
);

INSERT INTO Peca (CodPeca, Nome, Descricao, PrecoUnitario, CodFornecedor) VALUES
	(1, 'Parafuso', 'Parafuso de ferro 5cm', 2.50, 1),
	(2, 'Porca', 'Porca de metal', 1.50, 2),
	(3, 'Arruela', 'Arruela de ferro', 0.80, 3),
	(4, 'Chave de Fenda', 'Chave de fenda media', 15.00, 4),
	(5, 'Alicate', 'Alicate universal', 25.00, 5);
	
	SELECT * FROM Peca;

CREATE TABLE Pedido (
    CodPedido INT PRIMARY KEY,
    DataPedido DATE,
    Status VARCHAR(30),
    CodCliente INT,
    CodFuncionario INT,
    FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
    FOREIGN KEY (CodFuncionario) REFERENCES Funcionario(CodFuncionario)
);

INSERT INTO Pedido (CodPedido, DataPedido, Status, CodCliente, CodFuncionario) VALUES
	(1, '2026-09-01', 'Concluido', 1, 3),
	(2, '2026-09-02', 'Pendente', 4, 1),
	(3, '2026-09-05', 'Concluido', 2, 5),
	(4, '2026-09-08', 'Em andamento', 5, 2),
	(5, '2026-09-12', 'Pendente', 3, 4);

	SELECT * FROM Pedido;

CREATE TABLE Item_Pedido (
    IdItemPedido INT PRIMARY KEY,
    CodPedido INT,
    CodPeca INT,
    Quantidade INT,
    PrecoPraticado DECIMAL(10,2),
    FOREIGN KEY (CodPedido) REFERENCES Pedido(CodPedido),
    FOREIGN KEY (CodPeca) REFERENCES Peca(CodPeca)
);

INSERT INTO Item_Pedido (IdItemPedido, CodPedido, CodPeca, Quantidade, PrecoPraticado) VALUES
	(1, 1, 1, 12, 2.50),
	(2, 2, 4, 3, 15.00),
	(3, 3, 2, 25, 1.50),
	(4, 4, 5, 2, 25.00),
	(5, 5, 3, 67, 0.80);

	SELECT * FROM Item_Pedido;