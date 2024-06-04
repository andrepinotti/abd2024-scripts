--Exercícios 1.4.4
--1 Monte uma consulta SQL para trazer os código e nomes dos clientes (tabela cliente) e vendedores (vende
-- -dor). Utilize o operador UNION.
--2  Desenvolva uma consulta SQL que traga a descrição dos produtos que estão inseridos tanto na tabela produto
-- quanto na tabela item_pedido. Utilize o operador INTERSECT.

-- 1-)

Select codigo_cliente, nome_cliente from cliente 
UNION 
Select codigo_vendedor, nome_vendedor from vendedor


--2-) Duas resoluções 

--seleciona a descrição do produto onde o código dele esteja na intersecção entre produto e item pedido 

select descricao from produto
	where codigo_produto in (select codigo_produto from produto
								INTERSECT
								SELECT codigo_produto from item_pedido);

--seleciona a descrição do produto e iguala duas tabelas que contenham a mesma chave assim selecionando 

select descricao from produto p 
	inner join item_pedido ip
	on p.codigo_produto = ip.codigo_produto;