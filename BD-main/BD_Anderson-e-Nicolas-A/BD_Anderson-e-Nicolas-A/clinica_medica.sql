CREATE DATABASE clinica_medica

USE clinica_medica

CREATE TABLE tbl_paciente(
id_cliente INT,
nome VARCHAR (100),
rg VARCHAR (15),
endereco VARCHAR (100),
telefone VARCHAR (21),
convenio VARCHAR (30),
PRIMARY KEY (id_cliente)
);

INSERT INTO tbl_paciente (id_cliente, nome, rg, endereco, telefone, convenio) VALUES
(1, 'Lucas', '10.234.567-8', 'Rua Verde', '11-91234-5678', 'Amil'),
(2, 'Mariana', '20.345.678-9', 'Rua das Flores', '11-92345-6789', 'SulAmérica'),
(3, 'Beatriz', '30.456.789-0', 'Rua Sol', '11-93456-7890', 'Unimed'),
(4, 'Gabriel', '40.567.890-1', 'Rua Lua', '11-94567-8901', 'Notredame'),
(5, 'Carla', '50.678.901-2', 'Rua Estrela', '11-95678-9012', 'Porto Seguro');

SELECT * FROM tbl_paciente


CREATE TABLE tbl_medico(
crm VARCHAR(9),
nome VARCHAR(100),
rg VARCHAR(15),
endereco VARCHAR(100),
telefone VARCHAR(21),
PRIMARY KEY (crm)
);

INSERT INTO tbl_medico (crm, nome, rg, endereco, telefone) VALUES
('111222/sp', 'Roberto', '11.111.111-1', 'Rua dos Pinheiros', '11-98765-1111'),
('333444/sp', 'Fernanda', '22.222.222-2', 'Avenida Paulista', '11-98765-2222'),
('555666/sp', 'Carlos', '33.333.333-3', 'Rua Augusta', '11-98765-3333'),
('777888/sp', 'Juliana', '44.444.444-4', 'Rua Oscar Freire', '11-98765-4444'),
('999000/sp', 'Ricardo', '55.555.555-5', 'Avenida Brasil', '11-98765-5555');

SELECT * FROM tbl_medico


CREATE TABLE tbl_consulta (
codigo INT,
data DATE,
hora VARCHAR (5),
crm VARCHAR (9),
id_cliente INT,
PRIMARY KEY (codigo),
FOREIGN KEY (crm) REFERENCES tbl_medico (crm),
FOREIGN KEY (id_cliente) REFERENCES tbl_paciente (id_cliente)
);

INSERT INTO tbl_consulta (codigo, data, hora, crm, id_cliente) VALUES
(1, '2026-03-10', '09:00', '111222/sp', 1),
(2, '2026-03-11', '10:30', '777888/sp', 3),
(3, '2026-03-12', '11:15', '999000/sp', 1),
(4, '2026-03-13', '14:00', '111222/sp', 2),
(5, '2026-03-14', '16:45', '555666/sp', 5);

SELECT * FROM tbl_consulta