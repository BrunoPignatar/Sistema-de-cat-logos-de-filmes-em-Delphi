create database filmes
use filmes

create table catalogo(
	idFilme int identity,
	titulo varchar(100),
	diretor varchar(100),
	genero varchar(50),
	sinopse varchar(500),
	anoLancamento varchar(10)
	constraint pk_filme primary key (titulo, diretor)
)
