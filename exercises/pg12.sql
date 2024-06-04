--Exercícios 1.2.1
--1. Crie o modelo físico das relações correntista = {cpf, nome, data_nasc, cidade, uf} e conta_corrente {num_conta,
--cpf_correntista (fk), saldo}. Garanta as seguintes regras de negócio:
--(a) Uma conta corrente só pode ser aberta com saldo mínimo inicial de R$ 500,00.
--(b) Os correntistas devem ser maiores que 18 anos. Para isso, você deve comparar a data de nascimento com a data atual. No Postgres, para saber a idade atual, use a função ((CURRENT_DATE -
--data_nasc)/365>=18) ou use a função (AGE(CURRENT_DATE, data_nasc) >= ’18 Y’)).

create table relacoes_correntistas(
	cpf varchar(15),
	nome varchar(40),
	data_nasc date,
	cidade varchar(40),
	uf varchar(40),

	constraint pk_cpf primary key(cpf),
	constraint ck_data_nasc check((AGE(CURRENT_DATE, data_nasc) >= '18 Y'))
);

--Teste para dar erro com a restrição
INSERT INTO relacoes_correntistas values('505.032.459-74', 'Jorge', '02/02/2013', 'Cardoso', 'SP');
Select * from relacoes_correntistas;

create table conta_corrente(
	num_conta integer,
	cpf varchar(15),
	saldo numeric(7,2),

	constraint pk_num_conta primary key(num_conta),
	constraint fk_cpf foreign key (cpf) references relacoes_correntistas,
	constraint ck_saldo check(saldo >= 500)
);

--Teste para dar erro com a restrição 
INSERT INTO conta_corrente values(2, '333.678.948-78', 499);
Select * from conta_corrente;