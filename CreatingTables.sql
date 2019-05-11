drop table Rating;
drop table IngredienteleProduselor;
drop table Ingrediente;
drop table ProduseComandate;
drop table Produse;
drop table Comanda; --done
DROP TABLE Utilizator;--done
drop table Meniu;


drop table Utilizator cascade constraints;
create table Utilizator
(
    id_utilizator INT NOT NULL PRIMARY KEY,
    nume VARCHAR(15) NOT NULL,
    tip VARCHAR(15) NOT NULL
);
/
drop table Comanda cascade constraints;
create table Comanda
(
    id_comanda INT NOT NULL PRIMARY KEY,
    id_utilizator INT NOT NULL,
    FOREIGN KEY(id_utilizator) REFERENCES Utilizator(id_utilizator)
)
/
drop table ProduseComandate cascade constraints;
create table ProduseComandate
(
    id_produse_comandate INT NOT NULL PRIMARY KEY,
    id_comanda INT NOT NULL,
    id_produs INT NOT NULL,
    FOREIGN KEY(id_comanda) REFERENCES Comanda(id_comanda)
)
/
drop table Produse cascade constraints;
create table Produse
(
    id_produs INT NOT NULL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    pret int not null
)
/
drop table Meniu cascade constraints;
create table Meniu
(
    id_row int not null PRIMARY key,
    id_produs int not null,
    pret int not null,
    FOREIGN KEY(id_produs) REFERENCES Produse(id_produs)
)
/
drop table Ingrediente cascade constraints;
create table Ingrediente
(
    id_ingredient int not null PRIMARY key,
    nume_ingredient VARCHAR(20) not null,
    cantitate_ingredient int,
    pret int not null
)
/
drop table IngredienteleProduselor CASCADE CONSTRAINTS;
create table IngredienteleProduselor
(
    id_ingrediente_produse int not null primary KEY,
    id_produs int not null,
    id_ingredient int not null,
    FOREIGN key(id_produs) REFERENCES Produse(id_produs),
    FOREIGN KEY(id_ingredient) REFERENCES Ingrediente(id_ingredient)
)
/
drop table Rating CASCADE CONSTRAINTS;
create table Rating
(
    id_rating int not null primary key,
    id_produs int not null,
    valoare_rating int not null,
    FOREIGN KEY(id_produs) REFERENCES Produse(id_produs)
)
/
