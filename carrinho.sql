/**
Carrinho de comprar
@author Cássio Rodrigues Braga
*/

show databases;
create database dbcarrinho;
use dbcarrinho;
show tables;

-- decimal (Tipo de dados numérico não inteiro)
create table carrinho(
	codigo int primary key auto_increment,
    protudo varchar(250) not null,
    quantidade int not null,
    valor decimal(10,2) not null
);

alter table carrinho drop column pedido;

describe carrinho;

alter table carrinho add column codigo int primary key auto_increment;

drop table carrinho;

insert into carrinho (produto,quantidade,valor)
values ('pipoca',5,8.22);

alter table carrinho change protudo produto varchar(250) not null;

insert into carrinho(produto,quantidade,valor)
values ('pipoca',2,5.22);
insert into carrinho(produto,quantidade,valor)
values ('nescau',1,8.95);
insert into carrinho(produto,quantidade,valor)
values ('fandangos',2,9.66);
insert into carrinho(produto,quantidade,valor)
values ('leite integral',2,5.10);

select *from carrinho;

-- Operações matemáticas no banco de dados
select sum(valor * quantidade) as total from carrinho;

use dbcarrinho;
insert into carrinho(produto,quantidade,valor)
value ('farinha de trigo',3,4.55);

select * from carrinho;

-- selecionar colunas especificas da tabela
select produto,quantidade from carrinho;

-- selecionar colunas em ordem crescente e decrescente
select * from carrinho order by produto;
select codigo,produto from carrinho order by codigo desc;
select codigo,produto from carrinho order by produto asc;

-- uso de filtros
select * from carrinho where codigo = 1;
select * from carrinho where produto ='nescau';
select * from carrinho where produto like 'f%';

-- GRUD update
-- ATENÇÃO! Não esqueça de selecionar o where e id no update
update carrinho set quantidade ='5' where codigo = 2;

insert into carrinho(produto,quantidade,valor)
value ('Groselia',1,8.99);

update carrinho set produto='Suco de Uva',quantidade=1,valor=10.85 where codigo = 6;

-- GRUD Delete
-- ATENÇÃO! Não esqueça de selecionar o where e id no update
delete from carrinho where codigo = 3;

select * from carrinho;