drop table meniu;
drop table Curieri;
drop table Reteta;
drop table Ingrediente;
drop table Detalii_Comanda;
drop table Produse;
drop table Comenzi;
DROP TABLE Utilizatori;


create table Utilizatori
(
    id_utilizator INT NOT NULL PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    prenume varchar(255) not null,
	adresa varchar(255) not null,
    e_mail varchar(255) not null,
	parola varchar(255) not null,
    tip VARCHAR(255) NOT NULL
)
/
create table Ingrediente
(
    id_ingredient int not null PRIMARY key,
    nume_ingredient VARCHAR(20) not null
)
/
create table Produse
(
    id_produs INT NOT NULL PRIMARY KEY,
    nume VARCHAR(20) NOT NULL,
    pret int not null
)
/
create table Comenzi
(
    id_comanda INT NOT NULL PRIMARY KEY,
    id_utilizator INT NOT NULL,
    FOREIGN KEY(id_utilizator) REFERENCES Utilizatori(id_utilizator)
)
/
create table Detalii_Comanda
(
    id_detaliu INT NOT NULL PRIMARY KEY,
    id_comanda INT NOT NULL,
	status varchar(255) not null,
	adresa_livrare varchar(255) not null,
    id_produs INT NOT NULL,
    cantitate int not null,
    FOREIGN KEY(id_comanda) REFERENCES Comenzi(id_comanda),
    foreign key(id_produs) references Produse(id_produs)
)
/
create table Meniu
(
    id_row int not null primary key,
    id_produs int not null,
    cantitate int not null,
    FOREIGN key(id_produs) REFERENCES Produse(id_produs)
)
/
create table Reteta
(
    id_lista int not null primary KEY,
    id_produs int not null,
    id_ingredient int not null,
    cantitate_necesara int not null,
    FOREIGN key(id_produs) REFERENCES Produse(id_produs),
    FOREIGN KEY(id_ingredient) REFERENCES Ingrediente(id_ingredient)
)
/

create table Curieri
(
    id_Curier int not null primary key,
    id_zona_livrare int not null,
    nume varchar(255) not null,
    disponibil_Curieri int not null
)
/
DECLARE
    type strarray IS VARRAY(1000) of varchar2(255);
    lista_nume strarray := strarray('Ababei','Acasandrei','Adascalitei','Afanasie','Agafitei','Agape','Aioanei','Alexandrescu','Alexandru','Alexe','Alexii','Amarghioalei','Ambroci','Andonesei','Andrei','Andrian','Andrici','Andronic','Andros','Anghelina','Anita','Antochi','Antonie','Apetrei','Apostol','Arhip','Arhire','Arteni','Arvinte','Asaftei','Asofiei','Aungurenci','Avadanei','Avram','Babei','Baciu','Baetu','Balan','Balica','Banu','Barbieru','Barzu','Bazgan','Bejan','Bejenaru','Belcescu','Belciuganu','Benchea','Bilan','Birsanu','Bivol','Bizu','Boca','Bodnar','Boistean','Borcan','Bordeianu','Botezatu','Bradea','Braescu','Budaca','Bulai','Bulbuc-aioanei','Burlacu','Burloiu','Bursuc','Butacu','Bute','Buza','Calancea','Calinescu','Capusneanu','Caraiman','Carbune','Carp','Catana','Catiru','Catonoiu','Cazacu','Cazamir','Cebere','Cehan','Cernescu','Chelaru','Chelmu','Chelmus','Chibici','Chicos','Chilaboc','Chile','Chiriac','Chirila','Chistol','Chitic','Chmilevski','Cimpoesu','Ciobanu','Ciobotaru','Ciocoiu','Ciofu','Ciornei','Citea','Ciucanu','Clatinici','Clim','Cobuz','Coca','Cojocariu','Cojocaru','Condurache','Corciu','Corduneanu','Corfu','Corneanu','Corodescu','Coseru','Cosnita','Costan','Covatariu','Cozma','Cozmiuc','Craciunas','Crainiceanu','Creanga','Cretu','Cristea','Crucerescu','Cumpata','Curca','Cusmuliuc','Damian','Damoc','Daneliuc','Daniel','Danila','Darie','Dascalescu','Dascalu','Diaconu','Dima','Dimache','Dinu','Dobos','Dochitei','Dochitoiu','Dodan','Dogaru','Domnaru','Dorneanu','Dragan','Dragoman','Dragomir','Dragomirescu','Duceac','Dudau','Durnea','Edu','Eduard','Eusebiu','Fedeles','Ferestraoaru','Filibiu','Filimon','Filip','Florescu','Folvaiter','Frumosu','Frunza','Galatanu','Gavrilita','Gavriliuc','Gavrilovici','Gherase','Gherca','Ghergu','Gherman','Ghibirdic','Giosanu','Gitlan','Giurgila','Glodeanu','Goldan','Gorgan','Grama','Grigore','Grigoriu','Grosu','Grozavu','Gurau','Haba','Harabula','Hardon','Harpa','Herdes','Herscovici','Hociung','Hodoreanu','Hostiuc','Huma','Hutanu','Huzum','Iacob','Iacobuta','Iancu','Ichim','Iftimesei','Ilie','Insuratelu','Ionesei','Ionesi','Ionita','Iordache','Iordache-tiroiu','Iordan','Iosub','Iovu','Irimia','Ivascu','Jecu','Jitariuc','Jitca','Joldescu','Juravle','Larion','Lates','Latu','Lazar','Leleu','Leon','Leonte','Leuciuc','Leustean','Luca','Lucaci','Lucasi','Luncasu','Lungeanu','Lungu','Lupascu','Lupu','Macariu','Macoveschi','Maftei','Maganu','Mangalagiu','Manolache','Manole','Marcu','Marinov','Martinas','Marton','Mataca','Matcovici','Matei','Maties','Matrana','Maxim','Mazareanu','Mazilu','Mazur','Melniciuc-puica','Micu','Mihaela','Mihai','Mihaila','Mihailescu','Mihalachi','Mihalcea','Mihociu','Milut','Minea','Minghel','Minuti','Miron','Mitan','Moisa','Moniry-abyaneh','Morarescu','Morosanu','Moscu','Motrescu','Motroi','Munteanu','Murarasu','Musca','Mutescu','Nastaca','Nechita','Neghina','Negrus','Negruser','Negrutu','Nemtoc','Netedu','Nica','Nicu','Oana','Olanuta','Olarasu','Olariu','Olaru','Onu','Opariuc','Oprea','Ostafe','Otrocol','Palihovici','Pantiru','Pantiruc','Paparuz','Pascaru','Patachi','Patras','Patriche','Perciun','Perju','Petcu','Pila','Pintilie','Piriu','Platon','Plugariu','Podaru','Poenariu','Pojar','Popa','Popescu','Popovici','Poputoaia','Postolache','Predoaia','Prisecaru','Procop','Prodan','Puiu','Purice','Rachieru','Razvan','Reut','Riscanu','Riza','Robu','Roman','Romanescu','Romaniuc','Rosca','Rusu','Samson','Sandu','Sandulache','Sava','Savescu','Schifirnet','Scortanu','Scurtu','Sfarghiu','Silitra','Simiganoschi','Simion','Simionescu','Simionesei','Simon','Sitaru','Sleghel','Sofian','Soficu','Sparhat','Spiridon','Stan','Stavarache','Stefan','Stefanita','Stingaciu','Stiufliuc','Stoian','Stoica','Stoleru','Stolniceanu','Stolnicu','Strainu','Strimtu','Suhani','Tabusca','Talif','Tanasa','Teclici','Teodorescu','Tesu','Tifrea','Timofte','Tincu','Tirpescu','Toader','Tofan','Toma','Toncu','Trifan','Tudosa','Tudose','Tuduri','Tuiu','Turcu','Ulinici','Unghianu','Ungureanu','Ursache','Ursachi','Urse','Ursu','Varlan','Varteniuc','Varvaroi','Vasilache','Vasiliu','Ventaniuc','Vicol','Vidru','Vinatoru','Vlad','Voaides','Vrabie','Vulpescu','Zamosteanu','Zazuleac');
    lista_tip strarray := strarray('Admin', 'Client');
    lista_ingrediente strarray := strarray('cartofi', 'masline', 'faina de grau', 'faina de porumn', 'sare', 'zahar', 'unt', 'boia', 'marar', 'carne de pui', 'carne de vaca', 'carne de porc', 'varza', 'rosii', 'ceapa', 'usturoi', 'marar', 'cimbru', 'bors', 'patrunjel', 'lapte');
    lista_produse strarray := strarray('bors de cartofi', 'bors de vacuta', 'bors cu perisoare', 'ciorba', 'ciorba de burta', 'crema de legume', 'cartofi prajiti', 'cartofi taranesti', 'cartofi pai', 'cartofi cu rozmarin', 'cartofi cu sunca', 'cartofi cu ceapa', 'salata de cartofi', 'salata de varza', 'muraturi asortate', 'orez', 'fasole batuta', 'iahnie de fasole');
    lista_numere strarray := strarray('0', '1','2','3','4','5','6','7','8','9');
    lista_prenume strarray := strarray('Adrian','Alex','Alexandru','Alin','Andreas','Andrei','Aurelian','Beniamin','Bogdan','Camil','Catalin','Cezar','Ciprian','Claudiu','Codrin','Constantin','Corneliu','Cosmin','Costel','Cristian','Damian','Dan','Daniel','Danut','Darius','Denise','Dimitrie','Dorian','Dorin','Dragos','Dumitru','Eduard','Elvis','Emil','Ervin','Eugen','Eusebiu','Fabian','Filip','Florian','Florin','Gabriel','George','Gheorghe','Giani','Giulio','Iaroslav','Ilie','Ioan','Ion','Ionel','Ionut','Iosif','Irinel','Iulian','Iustin','Laurentiu','Liviu','Lucian','Marian','Marius','Matei','Mihai','Mihail','Nicolae','Nicu','Nicusor','Octavian','Ovidiu','Paul','Petru','Petrut','Radu','Rares','Razvan','Richard','Robert','Roland','Rolland','Romanescu','Sabin','Samuel','Sebastian','Sergiu','Silviu','Stefan','Teodor','Teofil','Theodor','Tudor','Vadim','Valentin','Valeriu','Vasile','Victor','Vlad','Vladimir','Vladut', 'Adina','Alexandra','Alina','Ana','Anca','Anda','Andra','Andreea','Andreia','Antonia','Bianca','Camelia','Claudia','Codrina','Cristina','Daniela','Daria','Delia','Denisa','Diana','Ecaterina','Elena','Eleonora','Elisa','Ema','Emanuela','Emma','Gabriela','Georgiana','Ileana','Ilona','Ioana','Iolanda','Irina','Iulia','Iuliana','Larisa','Laura','Loredana','Madalina','Malina','Manuela','Maria','Mihaela','Mirela','Monica','Oana','Paula','Petruta','Raluca','Sabina','Sanziana','Simina','Simona','Stefana','Stefania','Tamara','Teodora','Theodora','Vasilica','Xena');
    v_nume varchar2(255);
    v_prenume varchar2(255);
    v_tip varchar2(255);
    v_fk int;
    v_zona_livrare varchar2(255);
    v_fk2 int;
    v_cantitate int;
    v_pret int;
    v_valoare int;
    v_email varchar(255);
	v_adresa varchar(255);
	v_parola varchar(255);
	v_status int;
    v_i int;
    v_j int;
BEGIN
-- utilizatori
    for v_i in 1..1000000 loop
        v_parola:= '';
        for v_j in 1..8 loop
            v_parola := v_parola || lista_numere(trunc(dbms_random.value(0, lista_numere.count))+1);
        end loop;    
        v_prenume := lista_prenume(trunc(dbms_random.value(0, lista_prenume.count))+1);
        v_nume := lista_nume(trunc(dbms_random.value(0, lista_nume.count))+1);
        v_tip := lista_tip(trunc(dbms_random.value(0,lista_tip.count))+1);
		v_email := v_prenume || '_' || v_nume || '@gmail.com';
		v_adresa := 'str' || ' ' || v_i;
        insert into utilizatori values(v_i, v_nume, v_prenume,v_adresa,v_email,v_parola, v_tip);
    end loop;
-- comanda
    for v_i in 1..1000 loop
        v_fk := trunc(dbms_random.value(0, 1000)+1);
        insert into comenzi values(v_i, v_fk);
    end loop;
    -- produse
    for v_i in 1..1000 loop
        v_nume := lista_produse(trunc(dbms_random.value(0, lista_produse.count))+1);
        v_pret := trunc(dbms_random.value(0, 15)+1);
        insert into produse values(v_i, v_nume, v_pret);
    end loop;
-- meniu
    for v_i in 1..1000 loop
        v_fk := trunc(dbms_random.value(0, 1000)+1);
        v_cantitate := (dbms_random.value(0, 100)+1);
        insert into meniu values(v_i, v_fk, v_cantitate);
    end loop;

-- Detalii_Comanda
    for v_i in 1..1000 loop
		v_adresa := 'str' || ' ' || v_i;
        v_fk := trunc(dbms_random.value(0,1000)+1);
        v_fk2 := trunc(dbms_random.value(0, 1000)+1);
        v_cantitate := trunc(dbms_random.value(0, 10) +1);
		v_status := trunc(dbms_random.value(0,1));
		v_adresa := 'str' || ' ' || v_i;
        insert into detalii_comanda values (v_i, v_fk, v_status, v_adresa , v_fk2, v_cantitate);
    end loop;
-- ingrediente
   for v_i in 1..1000 loop
       v_nume := lista_ingrediente(trunc(dbms_random.value(0, lista_ingrediente.count))+1);
       insert into ingrediente values(v_i, v_nume);
   end loop;
-- Reteta
    for v_i in 1..1000 loop
        v_fk := trunc(dbms_random.value(0,1000)+1);
        v_fk2 := trunc(dbms_random.value(0, 1000)+1);
        v_cantitate := trunc(dbms_random.value(0, 50) +1);
        insert into Reteta values (v_i, v_fk, v_fk2, v_cantitate);
    end loop;
-- Cutrieri   
    for v_i in 1..1000 loop
        v_zona_livrare  := trunc(dbms_random.value(0, 1000)+1);
        v_nume := lista_nume(trunc(dbms_random.value(0, lista_nume.count))+1);
        v_valoare := trunc(dbms_random.value(0, 1));
        insert into Curieri values (v_i, v_zona_livrare, v_nume, v_valoare);
    end loop;
END;


