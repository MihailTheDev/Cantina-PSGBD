create index users
on UTILIZATORI(ID_UTILIZATOR, NUME, TIP)
compute statistics ;


select ID_UTILIZATOR, nume, tip from UTILIZATORI;