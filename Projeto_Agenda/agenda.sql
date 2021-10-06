/**
Agenda de contatos
@author Cássio Rodrigues Braga
*/
-- Exibir banco de dados do servidor
show databases;
-- Criar um novo banco de dados
create database dbagenda;
-- Excluir banco de dados
drop database dbteste;
-- Selecionar o banco de dados
use dbagenda;

-- Verifica tabelas existentes
show tables;

-- Criando uma tabela
-- Toda tabela precisa ter uma chave primária (PK)
-- int (Tipos de dados) -> números inteiros
-- primary key -> transforma este campo em chave primária
-- auto_increment -> numeração automática
-- varchar (Tipo de dados equivalente a string) (50) número máximo de caracteres
-- not null -> preenchimento obrigatório
-- unique -> não permite valores duplicados na tabela
create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela
describe contatos;

-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo(coluna) a tabela
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) em um local específico da tabela
alter table contatos add column fone2 varchar(50) after fone;

-- modificar o tipo e dados da coluna e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

-- CRUD (Create Read Update Delete)
-- operações básicas do banco de dados

-- CRUD Create
insert into contatos(nome,fone,email)
values ('Cassio Braga','99999-4444','crb@mail.com');
-- CRUD Read
-- selecionar todos os registros (dados) da tabela
select * from contatos;
insert into contatos(nome,fone,email)
values ('Fox Mulder','88888-5555','fox@mail.com');
insert into contatos(nome,fone,email)
values ('Dana Scully','77777-6666','dana@mail.com');
insert into contatos(nome,fone,email)
values ('Walter Skinner','66666-7777','walter@mail.com');
insert into contatos(nome,fone)
values ('Monica Reyes','55555-8888');

select * from contatos;

use dbagenda;
insert into contatos(nome,fone,email)
values ('Cassimbas Rodrigues','44444-9999','cr@mail.com');

select * from contatos;

use dbagenda;

select * from contatos;

-- selecionar colunas especificas da tabela
select nome,fone from contatos;

-- selecionar colunas em ordem crescente e decrescente
select * from contatos order by nome;
select id, nome from contatos order by id desc;
select id, nome from contatos order by id asc;

-- uso de filtros
select * from contatos where id = 1;
select * from contatos where nome = 'Cassio Braga';
select * from contatos where nome like 'C%';

select * from contatos;

-- GRUD update
-- ATENÇÃO! Não esqueça de selecionar o where e id no update 
update contatos set email ='monica@mail.com' where id = 5;
update contatos set nome ='Jonh Dogget',fone='11111-0000',email='jonh@mail.com' where id = 5;

-- GRUD Delete
-- ATENÇÃO! Não esqueça de selecionar o where e id no update
delete from contatos where id = 6;