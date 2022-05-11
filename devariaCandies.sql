create database devariaCandies;

use devariaCandies;

create table cliente(
	id int primary key auto_increment,
    nome varchar(50) not null,
	cpf varchar(15) not null,
    celular varchar(15) not null,
    telefoneResidencial varchar(10) not null,
    email varchar(100) not null unique
    
);

create table endereco(
	logradouro varchar(100) not null,
    cep varchar(8) not null,
    cidade varchar(20) not null,
    estado varchar(2) not null,
    idCliente int not null,
    constraint FK_enderecoCliente foreign key(idCliente) references cliente(id) on delete cascade
);

create table fidelidade(
	codigo int primary key auto_increment,
	dataAdesao datetime,
    pontos int null,
    idCliente int not null,
    constraint FK_fidelidadeCliente foreign key(idCliente) references cliente(id) on delete cascade

);

-- exemplos para alterar tabelas, adcionar e remover colunas.
-- alter table fidelidade modify column pontos decimal(5,1);
-- alter table fidelidade add dataNascimento datetime;
-- alter table fidelidade drop column dataNascimento;

-- para visualizar tabelas.
-- select * from cliente;

create table marcaProduto(
	id int primary key auto_increment,
    nomeMarca varchar(50) not null
);

create table produto(
	codigo int primary key auto_increment,
    nomeProduto varchar(200) not null,
    descricao varchar(200) not null,
    idMarca int not null,
    constraint FK_marcaDoProduto foreign key(idMarca) references marcaProduto(id) on delete cascade

);

create table pedido(
	codigo int primary key auto_increment,
    idCliente int not null,
    constraint FK_clienteID foreign key(idCliente) references cliente(id) on delete cascade
); 

create table itensPedido(
	codigoProduto int not null,
    codigoPedido int not null,
    quantdadeItens int not null,
    valorUnitario decimal(12,2),
    valorBruto decimal(12, 2),
    valorTotal decimal(12, 2),
    
    constraint FK_produtoCodigo foreign key(codigoProduto) references produto(codigo) on delete cascade,
    constraint FK_pedidoCodigo foreign key(codigoPedido) references pedido(codigo) on delete cascade,
    constraint UK_pedidoCliente unique(codigoProduto, codigoPedido)
    
);
