DROP DATABASE IF EXISTS stockControl;
CREATE SCHEMA IF NOT EXISTS stockControl;
USE stockControl;

-- -----------------------------------------------------
-- Tabela cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo (
  idCargo			INT				NOT NULL		AUTO_INCREMENT,
  descricao			VARCHAR(45)		NOT NULL,
  PRIMARY KEY (idcargo));

-- -----------------------------------------------------
-- Tabela funcionario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS funcionario (
  idFuncionario		INT				NOT NULL		AUTO_INCREMENT,
  cpf 				BIGINT 			NOT NULL,
  nome 				VARCHAR(45) 	NOT NULL,
  endereco 			VARCHAR(45) 	NOT NULL,
  turno 			VARCHAR(45) 	NOT NULL,
  telefone 			VARCHAR(45) 	NOT NULL,
  email 			VARCHAR(45) 	NOT NULL,
  dataNascimento	DATE			NOT NULL,	
  cargo_idcargo 	INT 			NOT NULL,
  PRIMARY KEY (idFuncionario),
  FOREIGN KEY (cargo_idcargo) REFERENCES cargo (idCargo));


-- -----------------------------------------------------
-- Tabela tipoPessoa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipoPessoa (
  idTipoPessoa 		INT 			NOT NULL		AUTO_INCREMENT,
  categoria 		VARCHAR(45) 	NOT NULL,
  PRIMARY KEY (idtipoPessoa));


-- -----------------------------------------------------
-- Tabela cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  idCliente 				INT 			NOT NULL		AUTO_INCREMENT,
  documento					BIGINT			NOT NULL,
  nome 						VARCHAR(45) 	NOT NULL,
  endereco 					VARCHAR(45) 	NOT NULL,
  telefone 					VARCHAR(45) 	NOT NULL,
  email 					VARCHAR(45) 	NOT NULL,
  nivel 					INT 			NOT NULL,
  tipoPessoa_idTipoPessoa 	INT 			NOT NULL,
  PRIMARY KEY (idCliente),
  FOREIGN KEY (tipoPessoa_idTipoPessoa) REFERENCES tipoPessoa (idTipoPessoa));


-- -----------------------------------------------------
-- Tabela fornecedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fornecedor (
  idFornecedor		INT				NOT NULL		AUTO_INCREMENT,
  cnpj 				BIGINT 			NOT NULL,
  razaoSocial 		VARCHAR(45) 	NOT NULL,
  PRIMARY KEY (idFornecedor));


-- -----------------------------------------------------
-- Tabela produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS produto (
  codBarras 		BIGINT 			NOT NULL	UNIQUE,
  nome 				VARCHAR(45) 	NOT NULL,
  PRIMARY KEY (codBarras));


-- -----------------------------------------------------
-- Tabela estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS estoque (
  idEstoque 			INT 		NOT NULL		AUTO_INCREMENT,
  qtdProdutoEntrada 	INT 		NOT NULL,
  qtdProdutoSaida 		INT 		NOT NULL,
  qtdProdutoTotal		INT			NOT NULL,
  produto_codBarras 	BIGINT 		NOT NULL,
  PRIMARY KEY (idEstoque),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras));


-- -----------------------------------------------------
-- Tabela saida
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS saida (
  idSaida 						INT 			NOT NULL		AUTO_INCREMENT,
  qtdProduto 					INT 			NOT NULL,
  `data` 						DATE 			NOT NULL,
  motivo 						VARCHAR(45) 	NOT NULL,
  produto_codBarras 			BIGINT 			NOT NULL,
  funcionario_idFuncionario		INT				NOT NULL,
  cliente_idCliente 			INT,
  PRIMARY KEY (idsaida),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras),
  FOREIGN KEY (funcionario_idFuncionario) REFERENCES funcionario (idFuncionario),
  FOREIGN KEY (cliente_idcliente) REFERENCES cliente (idcliente));


-- -----------------------------------------------------
-- Tabela entrada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS entrada (
  idEntrada 					INT 			NOT NULL		AUTO_INCREMENT,
  lote 							INT 			NOT NULL,
  qtdProduto 					INT 			NOT NULL,
  `data` 						DATE 			NOT NULL,	
  validade 						DATE			NOT NULL,
  fornecedor_idFornecedor 		INT 			NOT NULL,
  produto_codBarras 			BIGINT 			NOT NULL,
  PRIMARY KEY (idEntrada),
  FOREIGN KEY (fornecedor_idFornecedor) REFERENCES fornecedor (idFornecedor),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras));
  
  
