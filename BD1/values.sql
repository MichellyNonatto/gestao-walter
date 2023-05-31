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