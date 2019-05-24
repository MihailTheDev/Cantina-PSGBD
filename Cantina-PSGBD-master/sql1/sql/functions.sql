create or replace function GetIngredientsList(v_id number) -- list with all ingredients necessary to create one product
return number_list
as
-- declarari
    v_ingredientsList number_list := number_list();
    cursor c_ingredients is
        select * from PRODUSE p
        join INGREDIENTELEPRODUSELOR ig on p.ID_PRODUS = ig.ID_PRODUS
        where p.ID_PRODUS = v_id;
    v_index number := 1;
begin
--     v_ingredientsList.extend(1000);
    for v_line in c_ingredients loop
        v_ingredientsList.extend(1);
        v_ingredientsList(v_index) := v_line.ID_INGREDIENT;
        v_index:= v_index +1;
--         dbms_output.put_line(v_line.ID_INGREDIENT);
        end loop;
        return v_ingredientsList;
end;


--works
create or replace function Get_Ingredient_Quantity(v_id number) -- cantity for one particular ingredient
return number
as
--     declaration
    v_cantity number;
begin
        select CANTITATE_INGREDIENT into v_cantity from INGREDIENTE
            where ID_INGREDIENT = v_id;
        return v_cantity;
end;


drop function  Get_Number_Of_Products;
create or replace function Get_Number_Of_Products(v_id number)
return number
as
   v_ingredientsList number_list;
   v_min number := 0;
   v_quantity number;
   v_result_list number_list := number_list();
   v_index number := 1;
   v_i number;
--     declarari
begin
   v_ingredientsList := GETINGREDIENTSLIST(v_id);
--         dbms_output.put_line(v_ingredientsList.COUNT);
       v_index:=1;
       if(v_ingredientsList.COUNT = 0) then
           return 0;
           end if;
           for i in 1..v_ingredientsList.COUNT loop
               v_quantity := Get_Ingredient_Quantity(v_ingredientsList(i));
               v_result_list.extend(1);
               v_result_list(v_index) := v_quantity;
               v_index := v_index +1;
           end loop;
   v_min := v_result_list(1);
   for v_i in 1..v_index-1 loop
       if(v_min > v_result_list(v_i)) then
           v_min := v_result_list(v_i);
       end if;
   end loop;
   if(v_min = 0) then
       return v_min;
   end if;
--         dbms_output.put_line(v_ingredientsList.COUNT) ;
     for i in 1..v_ingredientsList.COUNT loop
        v_quantity := Get_Ingredient_Quantity(v_ingredientsList(i));
        v_quantity:= v_quantity - v_min;
--         dbms_output.put_line(i) ;
--         UPDATE_INGREDIENT_CANTITY(v_ingredientsList(i), v_quantity);
--         dbms_output.put_line(v_ingredientsList(i)) ;
    end loop;
--         dbms_output.put_line(v_min) ;
    return v_min;
end;
/
create or replace function generate
return number
as
      cursor lista_produse is select distinct *
                            from produse p
                            order by (select count(nume)
                                      from produse p
                                               join INGREDIENTELEPRODUSELOR I2 on p.ID_PRODUS = I2.ID_PRODUS) /
                                     p.PRET asc ;

      v_number number;
    v_index  number := 1;
    v_start  number := 1;
    v_end    number := 10;
begin
    for produs in lista_produse
        loop
            v_number := GET_NUMBER_OF_PRODUCTS(produs.ID_PRODUS);
--             dbms_output.put_line(v_number);
            if (v_number > 0) then
                insert into meniu(ID, ID_PRODUS, CANTITATE) VALUES (v_index, produs.ID_PRODUS, v_number);
                v_index := v_index+1;
            end if;
        end loop;
    return 1;
end;
/
create or replace function checkUser(v_nume varchar2, v_parola varchar2)
return number
as
    v_count number;
begin
    select count(*) into v_count from UTILIZATORI
        where v_nume like NUME and v_parola like PAROLA;
    return v_count;
end;
/

create or replace function getUsersCount
return number
as
    v_count number;
begin
    select count(*) into v_count from UTILIZATORI;
    return  v_count;
end;
/
create or replace  function createUser(v_nume varchar2, v_tip varchar2, v_parola varchar2)
return number
as
    v_count number;
begin
    v_count := getUsersCount() + 1 ;
    if(v_count = 1) then
        return 0;
        end if ;
    insert into UTILIZATORI(ID_UTILIZATOR, NUME, PAROLA, TIP) values(v_count, v_nume,v_parola, v_tip);
    return 1;
end;
/

create or replace function deleteUser(v_nume varchar2, v_parola varchar2)
return number
as
begin
    delete from UTILIZATORI where v_nume like NUME and v_parola like PAROLA;
    return 1;
end;
/

-- comanda

-- delete from PRODUSECOMANDATE;
/
create or replace function CheckProductInMenu(id_produs number)
return number
as
v_quantity number;
v_count number;
    cursor c_quantity is select  * from meniu where ID_PRODUS = id_produs;
begin
        dbms_output.put_line(id_produs);
    select count(*) into v_count from MENIU where id_produs = ID_PRODUS;
    if(v_count = 0) then
        return 0;
    end if;
--     v_quantity := c_quantity(1).CANTITATE;
    for quantity in c_quantity loop
        if(quantity.ID_PRODUS = id_produs) then
        v_quantity := quantity.CANTITATE;
        dbms_output.put_line(v_quantity);
        end if;
    end loop;
    return v_quantity;
end;

/
create or replace function CheckoutOrder(id_utilizator number, products NUMBER_LIST)
return number
as
    v_idProdus number;
    v_count number;
    v_idComanda number;
begin
    select count(*) +1 into v_count from COMANDA;
    v_idComanda := v_count;
    InsertOrder(id_utilizator, v_idComanda);
    for i in 1..products.COUNT loop
        v_idProdus := products(i);
        if(CheckProductInMenu(v_idProdus) != 0) then
            AddProductIntoOrder(v_idProdus, v_idComanda);
            updateMenu(v_idProdus);
        end if;
    end loop;
    return 1;
end;
/
-- teste

delete from COMANDA;
delete from PRODUSECOMANDATE;

 BEGIN DBMS_OUTPUT.PUT_LINE('9 squared is ' || CheckProductInMenu(10) ) ;END;

select * from PRODUSECOMANDATE;
select * from COMANDA;
declare
    v_num number;
    v_productsList number_list := number_list(1,2,3,5,6);
   begin
--     AddProductIntoOrder(5, 60 );
        v_num :=CheckoutOrder(5, v_productsList);
--     InsertOrder(5);
--     v_num := CheckoutOrder()
end;

select  CANTITATE from meniu where ID_PRODUS = 10;

/
create or replace function AddRating(idProdus number, valoareRating number)
return number
as
    v_count number;
    v_valoareRating number;
    begin
            select count(*) +1 into v_count from RATING;
            insert into RATING(ID_RATING, ID_PRODUS, VALOARE_RATING) values (v_count, idProdus, valoareRating);
            return 1;
    end AddRating;
/
-- rating tests;
    declare
        v_number number;
    begin
        v_number := AddRating(5, 10);
    end;

    select * from rating;

/

create or replace function getRating(idProdus number)
return number
as
    v_avg number;
--     cursor c_rating is select * from RATING where idProdus = ID_PRODUS;
begin
    select avg(r.VALOARE_RATING) into v_avg from rating r where idProdus = ID_PRODUS;
    return  v_avg;
end;

declare
    v_num number;
    begin
    v_num := getRating(5);
    DBMS_OUTPUT.PUT_LINE(v_num);
end;