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
describe carrinho;

-- Criando outra tabale
-- timestamp default current_timestamp (data e hora automático)
-- date (tipo de dados relacionado a data formato padrão YYYYMMDD)
create table estoque (
	codigo int primary key	auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);

describe estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('nescau','nestle',20220220,100,10,'UN',8.95,'setor A p15');

select * from estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('suco de uva','magary',20211231,200,15,'UN',10.85,'setor S p03');

select * from estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('pipoca','yoki',20220330,150,20,'PC',8.22,'setor D p05');

describe estoque;

select * from estoque;

use dbcarrinho;

describe estoque;

select * from estoque;
select * from carrinho;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('leite integral','piracanjuba',20220830,50,10,'CX',5.10,'setor E p6');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('farinha de trigo','renata',20210830,200,15,'PC',5.99,'setor F p3');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('arroz integral','camil',20210730,500,20,'PC',4.39,'setor H p4');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
value ('feijao carioca','camil',20220131,10,30,'PC',7.39,'setor H p8');

select *from estoque;

-- Inventário do estoque (total)
select sum(valor * quantidade) as total from estoque;
select sum(quantidade) as total from estoque;

-- Relatório de reposição do estoque 1
select * from estoque where quantidade < estoquemin;
select * from estoque where quantidade > estoquemin;

-- Relatório de reposição do estoque 2
-- date_format (irá formatar a exibição da data)
-- %d (dia) %m(mês) %y (dois dígitos) %Y (quatro dígitos)
select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade,
quantidade,estoquemin as estoque_mínimo from estoque where quantidade < estoquemin;

-- Relatório de produtos vencidos 1 (validade dos produtos)
select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade
from estoque;

-- Relatório de validade produtos 2
-- datediff() retorna a diferença em dias de duas datas
-- curdate() data autal
select codigo as código,produto,date_format(dataval, '%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes from estoque;

select * from estoque;

-- Fazer UPDATE
update estoque set estoquemin =15 where codigo = 3;
update estoque set produto = 'nescau2.0', fabricante ='nestle*',dataval=20220330,quantidade=250, estoquemin=20, valor=5.99 where codigo = 1;
 
 select * from estoque;
 
 -- DELETE UM INTEM
delete from estoque where codigo = 6;

select * from estoque;

