CREATE SCHEMA IF NOT EXISTS stockControl;
USE stockControl;

-- -----------------------------------------------------
-- Tabela cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo (
  idCargo			INT				NOT NULL		AUTO_INCREMENT,
  descricao			VARCHAR(45)		NULL,
  PRIMARY KEY (idcargo));

-- -----------------------------------------------------
-- Tabela funcionario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS funcionario (
  cpf 				INT 			NOT NULL,
  nome 				VARCHAR(45) 	NOT NULL,
  endereco 			VARCHAR(45) 	NOT NULL,
  turno 			VARCHAR(45) 	NOT NULL,
  telefone 			VARCHAR(45) 	NOT NULL,
  email 			VARCHAR(45) 	NOT NULL,
  cargo_idcargo 	INT 			NOT NULL,
  PRIMARY KEY (cpf),
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
  idCliente 				INT 			NOT NULL,
  nome 						VARCHAR(45) 	NOT NULL,
  endereco 					VARCHAR(45) 	NOT NULL,
  telefone 					VARCHAR(45) 	NOT NULL,
  email 					VARCHAR(45) 	NOT NULL,
  nivel 					VARCHAR(45) 	NOT NULL,
  tipoPessoa_idTipoPessoa 	INT 			NOT NULL,
  PRIMARY KEY (idcliente),
  FOREIGN KEY (tipoPessoa_idTipoPessoa) REFERENCES tipoPessoa (idTipoPessoa));


-- -----------------------------------------------------
-- Tabela fornecedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS fornecedor (
  cnpj 				INT 			NOT NULL,
  razaoSocial 		VARCHAR(45) 	NOT NULL,
  PRIMARY KEY (cnpj));


-- -----------------------------------------------------
-- Tabela produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS produto (
  codBarras 		INT 			NOT NULL,
  nome 				VARCHAR(45) 	NOT NULL,
  PRIMARY KEY (`codBarras`));


-- -----------------------------------------------------
-- Tabela estoque
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS estoque (
  idEstoque 			INT 		NOT NULL		AUTO_INCREMENT,
  qtdProdutoEntrada 	INT 		NOT NULL,
  qtdProdutoSaida 		INT 		NOT NULL,
  produto_codBarras 	INT 		NOT NULL,
  PRIMARY KEY (idEstoque),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras));


-- -----------------------------------------------------
-- Tabela saida
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS saida (
  idsaida 				INT 			NOT NULL		AUTO_INCREMENT,
  qtdProduto 			INT 			NOT NULL,
  `data` 				DATETIME 		NOT NULL,
  motivo 				VARCHAR(45) 	NOT NULL,
  produto_codBarras 	INT 			NOT NULL,
  cliente_idCliente 	INT 			NULL,
  funcionario_cpf 		INT 			NOT NULL,
  PRIMARY KEY (idsaida),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras),
  FOREIGN KEY (cliente_idcliente) REFERENCES cliente (idcliente),
  FOREIGN KEY (funcionario_cpf) REFERENCES funcionario (cpf));


-- -----------------------------------------------------
-- Tabela entrada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS entrada (
  idEntrada 			INT 			NOT NULL		AUTO_INCREMENT,
  lote 					INT 			NOT NULL,
  qtdProduto 			INT 			NOT NULL,
  `data` 				DATETIME 		NOT NULL,
  validade 				DATETIME 		NOT NULL,
  fornecedor_cnpj 		INT 			NOT NULL,
  produto_codBarras 	INT 			NOT NULL,
  PRIMARY KEY (idEntrada),
  FOREIGN KEY (fornecedor_cnpj) REFERENCES fornecedor (cnpj),
  FOREIGN KEY (produto_codBarras) REFERENCES produto (codBarras));
  
