-- Comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo esclhe o banco de dados

use dbinfox;
-- O bloco de instruções abaixo cria uma tabela
create table tb_usuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comanda abaixo descreve a tabela
describe tb_usuarios;

-- a linha abaixo insere dados na tabela (CRUD)

-- create -> insert
insert into tb_usuarios(iduser, usuario, fone, login, senha)
values(1, 'William Oliveira', '9999-9999', 'willoli', '123456'); 

insert into tb_usuarios(iduser, usuario, fone, login, senha)
values(2, 'administrador', '9999-9999', 'admin', 'admin	'); 
insert into tb_usuarios(iduser, usuario, fone, login, senha)
values(3, 'Wemerson Oliveira', '9999-9999', 'piqueno', '123456'); 

-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tb_usuarios;


-- a linha abaixo modifica dados da tabela (CRUD)
-- update -> update
update tb_usuarios set fone='8888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)
delete from tb_usuarios where iduser=3;

select * from tb_usuarios;

create table tb_clientes (
idcli int primary key key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50),
emailcli varchar(50)
);

describe tb_clientes;

insert into tb_clientes(nomecli, endcli, fonecli, emailcli)
values('WillOli', 'Rua Quatro', '9999-9999', 'will@dev.com');

select * from tb_clientes;



create table tb_os(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10, 2),
idcli int not null,
foreign key(idcli) references tb_clientes(idcli)
);

describe tb_os;

insert into tb_os(equipamento, defeito, servico, tecnico, valor, idcli)
values ('NoteBook', 'Não liga', 'Troca de fonte', 'Zé', 80.70, 1);

select * from tb_os;

-- O código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomeCli,fonecli
from tb_os as O
inner join tb_clientes as C
on (O.idcli = C.idcli);

