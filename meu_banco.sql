
CREATE DATABASE farmacia;
USE farmacia;

CREATE TABLE cliente (
    id_cliente  INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    cpf         VARCHAR(11) NOT NULL,
    telefone    VARCHAR(15),
    email       VARCHAR(100),
    endereco    VARCHAR(200)
);

CREATE TABLE funcionario (
    id_funcionario  INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    cpf             VARCHAR(11) NOT NULL,
    cargo           VARCHAR(50) NOT NULL,
    salario         DECIMAL(10,2) NOT NULL
);

CREATE TABLE medicamento (
    id_medicamento  INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    preco           DECIMAL(10,2) NOT NULL,
    estoque         INT NOT NULL
);

CREATE TABLE venda (
    id_venda           INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente         INT NOT NULL,
    id_funcionario     INT NOT NULL,
    data_da_venda      DATETIME NOT NULL,
    valor_total        DECIMAL(10,2) NOT NULL,
    forma_do_pagamento VARCHAR(30) NOT NULL
);

CREATE TABLE item_venda (
    id_item_venda   INT AUTO_INCREMENT PRIMARY KEY,
    id_venda        INT NOT NULL,
    id_medicamento  INT NOT NULL,
    quantidade      INT NOT NULL,
    preco_unitario  DECIMAL(10,2) NOT NULL
);

-- dados
INSERT INTO cliente (id_cliente, nome, cpf, telefone, email, endereco) VALUES
(1, 'Ana Silva',      '11122233344', '(11) 98765-4321', 'ana.silva@email.com',      'Rua das Flores, 120 - São Paulo/SP'),
(2, 'Bruno Costa',    '22233344455', '(11) 97654-3210', 'bruno.costa@email.com',    'Av. Paulista, 500 - São Paulo/SP'),
(3, 'Carla Mendes',   '33344455566', '(21) 99876-5432', 'carla.mendes@email.com',   'Rua do Sol, 45 - Rio de Janeiro/RJ'),
(4, 'Diego Oliveira', '44455566677', '(31) 99123-4567', 'diego.oliveira@email.com', 'Rua Minas, 88 - Belo Horizonte/MG'),
(5, 'Elena Ferreira', '55566677788', '(41) 98888-7777', 'elena.ferreira@email.com', 'Rua Curitiba, 200 - Curitiba/PR'),
(6, 'Felipe Santos',  '66677788899', '(51) 97777-6666', 'felipe.santos@email.com',  'Av. Borges, 15 - Porto Alegre/RS');

INSERT INTO funcionario (id_funcionario, nome, cpf, cargo, salario) VALUES
(1, 'Heroiso Silva',  '10101010101', 'Farmacêutica', 4500.00),
(2, 'Ketilly Veras',  '20202020202', 'Atendente',    2200.00),
(3, 'Isaac Ferreira', '30303030303', 'Farmacêutica', 4500.00),
(4, 'Pedro Henrique', '40404040404', 'Gerente',      5500.00);

INSERT INTO medicamento (id_medicamento, nome, preco, estoque) VALUES
(1,  'Dipirona 500mg',         8.50, 150),
(2,  'Paracetamol 750mg',     12.00, 120),
(3,  'Ibuprofeno 600mg',      18.90,  80),
(4,  'Vitamina C 1g',         22.00, 200),
(5,  'Omeprazol 20mg',        25.50,  90),
(6,  'Losartana 50mg',        15.00,  60),
(7,  'Amoxicilina 500mg',     32.00,  45),
(8,  'Dorflex',               14.90, 100),
(9,  'Rivotril 2mg',          28.00,  30),
(10, 'Soro Fisiológico 500ml', 6.00, 180);

INSERT INTO venda (id_venda, id_cliente, id_funcionario, data_da_venda, valor_total, forma_do_pagamento) VALUES
(1, 1, 2, '2026-05-20 09:15:00', 25.00,  'Dinheiro'),
(2, 2, 2, '2026-05-20 10:30:00', 44.90,  'Cartão Débito'),
(3, 3, 1, '2026-05-21 14:00:00', 67.50,  'PIX'),
(4, 4, 3, '2026-05-21 16:45:00', 32.00,  'Cartão Crédito'),
(5, 5, 2, '2026-05-22 08:20:00', 52.90,  'PIX'),
(6, 1, 1, '2026-05-22 11:00:00', 40.50,  'Cartão Débito'),
(7, 6, 3, '2026-05-23 17:30:00', 28.00,  'Dinheiro'),
(8, 2, 2, '2026-05-24 09:50:00', 37.80,  'PIX');

INSERT INTO item_venda (id_item_venda, id_venda, id_medicamento, quantidade, preco_unitario, subtotal) VALUES
(1, 1, 1, 2,  8.50, 17.00),
(2, 1, 2, 1,  8.00,  8.00),
(3, 2, 8, 3, 14.90, 44.70),
(4, 3, 3, 2, 18.90, 37.80),
(5, 3, 6, 2, 15.00, 30.00),
(6, 4, 7, 1, 32.00, 32.00),
(7, 5, 4, 1, 22.00, 22.00),
(8, 5, 5, 1, 25.50, 25.50),
(9, 6, 9, 1, 28.00, 28.00),
(10, 7, 1, 2, 8.50, 17.00),
(11, 8, 8, 2, 14.90, 29.80);

--  deletei uma linha em cada tabela 
DELETE FROM item_venda WHERE id_item_venda = 11;
DELETE FROM venda WHERE id_venda = 7;
DELETE FROM medicamento WHERE id_medicamento = 10;
DELETE FROM funcionario WHERE id_funcionario = 4;
DELETE FROM cliente WHERE id_cliente = 6;

-- atualizar 
UPDATE cliente
SET nome = 'Ana Silva Santos',
    telefone = '(11) 99999-0000',
    email = 'ana.santos@email.com'
WHERE id_cliente = 1;

UPDATE funcionario
SET cargo = 'Atendente Sênior',
    salario = 2500.00
WHERE id_funcionario = 2;

UPDATE medicamento
SET preco = 9.00,
    estoque = 140
WHERE id_medicamento = 1;

UPDATE venda
SET valor_total = 26.00,
    forma_do_pagamento = 'PIX'
WHERE id_venda = 1;

UPDATE item_venda
SET quantidade = 3,
    subtotal = 27.00
WHERE id_item_venda = 1;

-- nova coluna 
ALTER TABLE venda
ADD COLUMN observacao VARCHAR(200) NULL;

-- relatório
SELECT * FROM cliente LIMIT 5;
SELECT * FROM funcionario LIMIT 3;
SELECT nome, preco, estoque FROM medicamento LIMIT 5;
SELECT id_venda, id_cliente, valor_total, forma_do_pagamento
FROM venda
ORDER BY data_da_venda DESC
LIMIT 3;
SELECT id_item_venda, id_venda, id_medicamento, quantidade, subtotal
FROM item_venda
LIMIT 5;

-- consulta 
SELECT * FROM cliente;
SELECT * FROM funcionario;
SELECT * FROM medicamento;
SELECT * FROM venda;
SELECT * FROM item_venda;