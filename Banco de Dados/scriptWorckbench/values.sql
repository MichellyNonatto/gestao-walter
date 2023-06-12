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
VALUES	(idFuncionario, 12345678900, 'João da Silva', 'Rua A, 123', 'Manhã', '111234567', 'joao.silva@example.com', '1985-07-15', 1),
		(idFuncionario, '98765432100', 'Maria Santos', 'Avenida B, 456', 'Tarde', '2298765432', 'maria.santos@example.com', '1992-11-28', 2),
		(idFuncionario, '55544433300', 'Pedro Oliveira', 'Rua C, 789', 'Noite', '3355554444', 'pedro.oliveira@example.com', '1979-04-03', 3),
		(idFuncionario, '88899977700', 'Ana Pereira', 'Avenida D, 987', 'Manhã', '4488889999', 'ana.pereira@example.com', '2001-06-09', 3),
		(idFuncionario, '22233355500', 'Carlos Santos', 'Rua E, 321', 'Tarde', '5522223333', 'carlos.santos@example.com', '1998-12-22', 3),
        (idFuncionario,'11122233344', 'Maria Silva', 'Avenida X, 123', 'Manhã', '5511122233', 'maria.silva@example.com', '1990-05-10', 2),
        (idFuncionario, '33344455566', 'Ana Oliveira', 'Rua Y, 789', 'Noite', '5533344455', 'ana.oliveira@example.com', '1995-06-15', 1);
        

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
VALUES	(idFornecedor, 12345678000101, "Refresko Co."),
		(idFornecedor, 23456789000102, "Bebidas Delícia"),
		(idFornecedor, 34567890000103, "Sabores Líquidos"),
		(idFornecedor, 45678901000104, "Liquid Euphoria"),
		(idFornecedor, 56789012000105, "Viva Drinks Corp.");


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
-- Inserir valores na tabela estoque
-- Para isso utilizamos o conceito de trigger, que são objetos do banco de dados que, 
-- relacionados a certa tabela, permitem a realização de processamentos em consequência 
-- de uma determinada ação como, por exemplo, a inserção de um registro.
-- -----------------------------------------------------

-- Atualiza a quantidade de produtos na tabela "estoque" quando uma nova entrada é registrada
DELIMITER $$
CREATE TRIGGER atualiza_qtd_produto_entrada
AFTER INSERT ON entrada
FOR EACH ROW
BEGIN
    -- Verifica se o produto já existe no estoque
    DECLARE existe_produto INT DEFAULT 0;
    SET existe_produto = (SELECT COUNT(*) FROM estoque WHERE produto_codBarras = NEW.produto_codBarras);

    -- Se o produto não existir no estoque, cria uma nova instância na tabela "estoque"
    IF existe_produto = 0 THEN
        INSERT INTO estoque (qtdProdutoEntrada, qtdProdutoSaida, qtdProdutoTotal, produto_codBarras)
        VALUES (NEW.qtdProduto, 0, NEW.qtdProduto, NEW.produto_codBarras);
    ELSE
        -- Atualiza a quantidade de produtos de entrada e total no estoque
        UPDATE estoque
        SET qtdProdutoEntrada = qtdProdutoEntrada + NEW.qtdProduto,
            qtdProdutoTotal = qtdProdutoTotal + NEW.qtdProduto
        WHERE produto_codBarras = NEW.produto_codBarras;
    END IF;
END;
$$

-- Atualiza a quantidade de produtos na tabela "estoque" quando uma nova saída é registrada
CREATE TRIGGER atualiza_qtd_produto_saida
AFTER INSERT ON saida
FOR EACH ROW
BEGIN
    -- Atualiza a quantidade de produtos de saída e total no estoque
    UPDATE estoque
    SET qtdProdutoSaida = qtdProdutoSaida + NEW.qtdProduto,
        qtdProdutoTotal = qtdProdutoTotal - NEW.qtdProduto
    WHERE produto_codBarras = NEW.produto_codBarras;
END;

        
-- -----------------------------------------------------
-- Inserir valores na tabela entrada
-- -----------------------------------------------------
INSERT INTO entrada
VALUES	(idEntrada, 572, 87, '2023-05-25', '2023-11-04', 2, 789654321003),
		(idEntrada, 854, 152, '2023-05-04', '2024-01-02', 4, 789654321005),
        (idEntrada, 321, 43, '2022-05-25', '2023-02-28', 3, 789654321002);
        
        
-- -----------------------------------------------------
-- Inserir valores na tabela saída
-- -----------------------------------------------------  
INSERT INTO saida
VALUES	(idSaida, 78, '2023-05-15', "Venda", 789654321003, 1, 2),
		(idSaida, 12, '2023-06-02', "Venda", 789654321005, 5, 2),
        (idSaida, 25, '2023-06-04', "Vencimento do produto", 789654321002, 4, null),
        (idSaida, 3, '2023-06-07', "Vencimento do produto", 789654321005, 4, null);
        
