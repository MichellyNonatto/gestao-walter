-- -------------------------------------------------------------------------------------
-- Selecionar todas as tabelas
-- -------------------------------------------------------------------------------------
SELECT * FROM cargo;
SELECT * FROM funcionario;
SELECT * FROM tipoPessoa;
SELECT * FROM cliente;
SELECT * FROM fornecedor;
SELECT * FROM produto;
SELECT * FROM estoque;
SELECT * FROM saida;
SELECT * FROM entrada;


-- -------------------------------------------------------------------------------------
-- 1. Exibir a entrada com os dados do fornecedor e do produto
-- -------------------------------------------------------------------------------------
select e.*, f.cnpj, f.razaoSocial, p.nome as nomeProduto
from entrada e inner join fornecedor f on e.fornecedor_idFornecedor = f.idFornecedor
inner join produto p on e.produto_codBarras = p.codBarras; 


-- -------------------------------------------------------------------------------------
-- 2. Exibir a saida com os dados do cliente e do funcionario que realizou a venda
-- -------------------------------------------------------------------------------------
select s.*, c.nome as nomeCliente, p.nome as nomeProduto
from saida s inner join cliente c on s.cliente_idCliente = c.idCliente
inner join produto p on s.produto_codBarras = p.codBarras; 


-- -------------------------------------------------------------------------------------
-- 3. Exibir os níveis dos clientes e a respectiva porcentagem de desconto de cada nivel
-- -------------------------------------------------------------------------------------
select nome, documento, nivel,
    case
        when nivel = 1 then '0%'
        when nivel = 2 then '5%'
        when nivel = 3 then '10%'
        else 'N/A'
    end as desconto
from cliente;


-- -------------------------------------------------------------------------------------
-- 4. Exibir cpf e nome do funcionário e seu respectivo cargo
-- -------------------------------------------------------------------------------------
select f.cpf, f.nome, c.descricao 
from funcionario f inner join cargo c on f.cargo_idCargo=c.idCargo;


-- -------------------------------------------------------------------------------------
-- 5. Exibir funcionários aniversariantes do mês
-- -------------------------------------------------------------------------------------
select cpf, nome, dataNascimento from funcionario where month(dataNascimento)=month(curdate());


-- -------------------------------------------------------------------------------------
-- 6. Listar os funcionários que possuem o cargo de gerente
-- -------------------------------------------------------------------------------------
select f.nome from funcionario f
inner join cargo c on f.cargo_idcargo = c.idCargo
where c.descricao = 'Gerente';


-- -------------------------------------------------------------------------------------
-- 7. Listar os funcionários que têm mais de 5 anos de empresa
-- 365 dias * 5 anos = 1825 dias
-- -------------------------------------------------------------------------------------
select nome, dataNascimento
from funcionario
where datediff(curdate(), dataNascimento) > 1825;


-- -------------------------------------------------------------------------------------
-- 8. Listar os produtos vendidos por um funcionario específico:
-- -------------------------------------------------------------------------------------
select f.cpf, f.nome, s.data, s.qtdProduto, s.motivo
from funcionario f inner join saida s on f.idFuncionario = s.funcionario_idFuncionario where f.idFuncionario = 1;


-- -------------------------------------------------------------------------------------
-- 9. Verificar o total de saídas realizadas em cada mês:
-- -------------------------------------------------------------------------------------
select monthname(`data`) as mes, COUNT(*) as totalSaidas
from saida group by mes;


-- -------------------------------------------------------------------------------------
-- 10. Listar os produtos que têm quantidade total no estoque menor que 10
-- -------------------------------------------------------------------------------------
select p.nome, e.qtdProdutoTotal from produto p
inner join estoque e on p.codBarras = e.produto_codBarras where e.qtdProdutoTotal < 10;


-- -------------------------------------------------------------------------------------
-- 11. Encontrar as saídas realizadas por um cliente específico, incluindo os detalhes do produto e do funcionário responsável
-- -------------------------------------------------------------------------------------
select c.nome, s.`data`, p.nome AS produto, f.nome AS funcionario
from saida s inner join produto p on s.produto_codBarras = p.codBarras
inner join funcionario f on s.funcionario_idFuncionario = f.idFuncionario
inner join cliente c on s.cliente_idCliente = c.idCliente
where c.idCliente = 2;


-- -------------------------------------------------------------------------------------
-- 12. Exibir os clientes e se são pessoa física ou jurídica
-- -------------------------------------------------------------------------------------
select c.idCliente, c.documento, c.nome, t.categoria as tipoPessoa
from cliente c inner join tipoPessoa t 
on c.tipoPessoa_idTipoPessoa = t.idTipoPessoa;


-- -------------------------------------------------------------------------------------
-- 13. Alterar o endereço de um funcionário especifico
-- -------------------------------------------------------------------------------------
update funcionario
set endereco = 'Rua dos Benjamins, 12'
where idFuncionario = 1;

-- -------------------------------------------------------------------------------------
-- 14. Alterar o cargo de um funcionário especifico
-- -------------------------------------------------------------------------------------
update funcionario
set cargo_idCargo = 1
where idFuncionario = 2;


-- -------------------------------------------------------------------------------------
-- 15. Listar a quantidade de produtos vendidos em que o cliente não é null por funcionário em ordem decrescente
-- -------------------------------------------------------------------------------------
select f.nome as funcionario, sum(s.qtdProduto) as totalProdutosVendidos
from funcionario f inner join saida s on f.idFuncionario = s.funcionario_idFuncionario
where s.cliente_idCliente is not null
group by f.nome
order by totalProdutosVendidos desc;

