/**
E-Comerce 
@author Cássio Rodrigues Braga
*/

drop database dbcarrinho;
show databases;
create database dbloja;
use dbloja;
show tables;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) unique not null,
    senha varchar(250)not null
);

insert into clientes (nome,email,senha)
values ('Cassimbas','cssb@gmail.com',md5('123456'));

select * from clientes;
describe clientes;

-- Criando outra tabale
-- timestamp default current_timestamp (data e hora automático)
-- date (tipo de dados relacionado a data formato padrão YYYYMMDD)
create table produtos (
	codigo int primary key	auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);

describe produtos;

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('nescau','nestle',20220220,100,10,'UN',8.95,'setor A p15');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('suco de uva','magary',20211231,200,15,'UN',10.85,'setor S p03');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('pipoca','yoki',20220330,150,20,'PC',8.22,'setor D p05');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('leite integral','piracanjuba',20220830,50,10,'CX',5.10,'setor E p6');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('farinha de trigo','renata',20210830,200,15,'PC',5.99,'setor F p3');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('arroz integral','camil',20210730,500,20,'PC',4.39,'setor H p4');

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
value ('feijao carioca','camil',20220131,10,30,'PC',7.39,'setor H p8');

select * from produtos;

-- Inventário do estoque (total)
select sum(valor * estoque) as total from produtos;
select sum(estoque) as total from produtos;

-- Relatório de reposição do estoque 1
select * from produtos where estoque < estoquemin;
select * from produtos where estoque > estoquemin;

-- Relatório de reposição do estoque 2
-- date_format (irá formatar a exibição da data)
-- %d (dia) %m(mês) %y (dois dígitos) %Y (quatro dígitos)
select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade,
estoque,estoquemin as estoque_mínimo from produtos where estoque < estoquemin;

-- Relatório de produtos vencidos 1 (validade dos produtos)
select codigo as código,produto,date_format(dataval,'%d/%m/%Y') as data_validade
from produtos;

-- Relatório de validade produtos 2
-- datediff() retorna a diferença em dias de duas datas
-- curdate() data autal
select codigo as código,produto,date_format(dataval, '%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes from produtos;

select * from produtos;

-- Fazer UPDATE
update produtos set estoquemin =15 where codigo = 3;
update produtos set produto = 'nescau2.0', fabricante ='nestle*',dataval=20220330,estoque=250, estoquemin=20, valor=5.99 where codigo = 1;
 
 select * from produtos;
 
 -- DELETE UM INTEM
delete from produtos where codigo = 6;

select * from produtos;
-- decimal (Tipo de dados numérico não inteiro)
