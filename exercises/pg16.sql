--Exercício de sequências 1.3.4 
--Considere o seguinte modelo relacional baseado no DER da figura 1.1:
--obra={id_obra, codigo (unique), descricao}
--maquina = {id_maquina, codigo(unique), marca}
--usa = {id_usa, id_obra,id_maquina, data_do_uso}
--1. Crie sequências obra, maquina e usa.
--2. Insira duas obras e duas máquinas usando as sequência criadas.
--3. Atribua para cada obra as duas máquinas.

--1) Crie as sequeências 

create sequence sid_maquina;
create sequence sid_obra;
create sequence sid_usa;

--2) Insira duas obras e duas máquinas usando as sequências 

INSERT INTO obra values(nextval('sid_obra'), '12345', 'Obra de casa');
INSERT INTO obra values(nextval('sid_obra'), '54321', 'Obra de prédio');

INSERT INTO maquina values(nextval('sid_maquina'), '77777', 'Homatsu');
INSERT INTO maquina values(nextval('sid_maquina'), '99999', 'Random');

--3) Atribua para cada obra as duas máquinas.

INSERT INTO usa values(nextval('sid_usa'), (select id_obra from obra where codigo = '12345'), 
	(select id_maquina from maquina where codigo = '77777'),
	'20/06/2024'
);

INSERT INTO usa values(nextval('sid_usa'), (select id_obra from obra where codigo = '12345'),
	(select id_maquina from maquina where codigo = '99999'),
	'20/06/2024'
);

INSERT INTO usa values(nextval('sid_usa'), (select id_obra from obra where codigo = '54321'),
	(select id_maquina from maquina where codigo = '77777'),
	'15/06/2024'
);


INSERT INTO usa values(nextval('sid_usa'), (select id_obra from obra where codigo = '54321'),
	(select id_maquina from maquina where codigo = '99999'),
	'15/06/2024'
);

select * from obra;
select * from maquina;
select * from usa;