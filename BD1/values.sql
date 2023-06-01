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
		(idCargo, "TI"),
        (idCargo, "Aux. Estoque");
  
  
-- -----------------------------------------------------
-- Inserir valores na tabela funcionário
-- -----------------------------------------------------
INSERT INTO funcionario 
VALUES	(idFuncionario, 12345678900, 'João da Silva', 'Rua A, 123', 'Manhã', '111234567', 'joao.silva@example.com', 1),
		(idFuncionario, '98765432100', 'Maria Santos', 'Avenida B, 456', 'Tarde', '2298765432', 'maria.santos@example.com', 2),
		(idFuncionario, '55544433300', 'Pedro Oliveira', 'Rua C, 789', 'Noite', '3355554444', 'pedro.oliveira@example.com', 3),
		(idFuncionario, '88899977700', 'Ana Pereira', 'Avenida D, 987', 'Manhã', '4488889999', 'ana.pereira@example.com', 3),
		(idFuncionario, '22233355500', 'Carlos Santos', 'Rua E, 321', 'Tarde', '5522223333', 'carlos.santos@example.com', 3);
        
        