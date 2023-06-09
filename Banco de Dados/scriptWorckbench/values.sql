-- -----------------------------------------------------
-- Selecionar todas as tabelas
-- -----------------------------------------------------
SELECT * FROM cargo;
SELECT * FROM funcionario;
SELECT * FROM tipoPessoa;
SELECT * FROM cliente;
SELECT * FROM fornecedor;
SELECT * FROM produto;
SELECT * FROM estoque;
SELECT * FROM saida;
SELECT * FROM entrada;


-- -----------------------------------------------------
-- Inserir valores na tabela cargo
-- -----------------------------------------------------
INSERT INTO cargo
VALUES 	(idCargo, "Gerente"),
		(idCargo, "Técnico de informática"),
        (idCargo, "Auxiliar Estoque");
        
        
-- -----------------------------------------------------
-- Inserir valores na tabela funcionário
-- -----------------------------------------------------
INSERT INTO funcionario 
VALUES	(idFuncionario, 12345678900, 'João da Silva', 'Rua A, 123', 'Manhã', '111234567', 'joao.silva@example.com', 1),
		(idFuncionario, '98765432100', 'Maria Santos', 'Avenida B, 456', 'Tarde', '2298765432', 'maria.santos@example.com', 2),
		(idFuncionario, '55544433300', 'Pedro Oliveira', 'Rua C, 789', 'Noite', '3355554444', 'pedro.oliveira@example.com', 3),
		(idFuncionario, '88899977700', 'Ana Pereira', 'Avenida D, 987', 'Manhã', '4488889999', 'ana.pereira@example.com', 3),
		(idFuncionario, '22233355500', 'Carlos Santos', 'Rua E, 321', 'Tarde', '5522223333', 'carlos.santos@example.com', 3);
        

-- -----------------------------------------------------
-- Inserir valores na tabela tipoPessoa
-- -----------------------------------------------------
INSERT INTO tipoPessoa
VALUES  (idTipoPessoa, 'Fisica'),
		(idTipoPessoa, 'Juridica');
        

-- -----------------------------------------------------
-- Inserir valores na tabela cliente
-- -----------------------------------------------------        
INSERT INTO cliente
VALUES  (idCliente, 12345678910, 'João Silva', 'Rua das Flores, 123', '(11) 1234-5678', 'joao.silva@example.com', 1, 1),
		(idCliente, 98765432100, 'Maria Souza', 'Avenida dos Estados, 456', '(21) 9876-5432', 'maria.souza@example.com', 2, 1),
		(idCliente, 12345678000190, 'Empresa ABC', 'Rua Comercial, 789', '(31) 2468-1357', 'contato@empresaabc.com', 3, 2),
		(idCliente, 98765432000121, 'Pedro Santos', 'Travessa das Pedras, 789', '(41) 3691-2580', 'pedro.santos@example.com', 1, 1),
		(idCliente, 12345678901234, 'Empresa XYZ', 'Avenida Principal, 321', '(51) 7531-9024', 'contato@empresaxyz.com', 2, 2);
        
        
-- -----------------------------------------------------
-- Inserir valores na tabela fornecedor
-- -----------------------------------------------------  
INSERT INTO fornecedor
VALUES	(idFornecedor, 12345678000101, "Tech Solutions Ltda."),
		(idFornecedor, 23456789000102, "Comércio de Moda Fashionista S.A."),
		(idFornecedor, 34567890000103, "Engenharia e Construções Excelência Ltda."),
		(idFornecedor, 45678901000104, "Café Delícia do Vale Ltda."),
		(idFornecedor, 56789012000105, "Serviços de Marketing Digital Criativo S.A.");


-- -----------------------------------------------------
-- Inserir valores na tabela produto
-- -----------------------------------------------------  
INSERT INTO produto
VALUES	(789654321001, "Refrigerante Cola Classic"),
		(789654321002, "Suco Natural de Laranja"),
        (789654321003, "Água Mineral Sem Gás"),
        (789654321004, "Cerveja Puro Malte IPA"),
        (789654321005, "Energético PowerBoost");


-- -----------------------------------------------------
-- Inserir valores na tabela saída
-- -----------------------------------------------------  
INSERT INTO saida
VALUES	(idSaida, 78, '2023-05-15', "Reposição de estoque", 789654321003, 2, 1),
		(idSaida, 12, '2023-06-02', "Revenda", 789654321005, 2, 5),
        (idSaida, 65, '2023-06-07', "Vencimento do produto", 789654321002, 1, 4);
        

-- -----------------------------------------------------
-- Inserir valores na tabela entrada
-- -----------------------------------------------------
INSERT INTO entrada
VALUES	(idEntrada, 572, 87, '2023-05-25', '2023-11-04', 2, 789654321003),
		(idEntrada, 854, 152, '2023-05-04', '2024-01-02', 4, 789654321005),
        (idEntrada, 321, 43, '2023-05-25', '2024-02-28', 3, 789654321002);
        

-- -----------------------------------------------------
-- Inserir valores na tabela estoque
-- -----------------------------------------------------
INSERT INTO estoque
VALUES	(idEstoque, 144, 32, 789654321003),
		(idEstoque, 82, 14, 789654321005),
        (idEstoque, 112, 40, 789654321002);