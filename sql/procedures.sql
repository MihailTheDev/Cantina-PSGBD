-- drop procedure INSERTINGREDIENTSCANTITY;
CREATE OR REPLACE PROCEDURE Update_Ingredients_Cantity(ID_INGREDIENT IN number_type, CANTITY IN number_type)
AS
    v_size      number;
    v_i         number;
    v_cantitate number;
BEGIN
    v_size := ID_INGREDIENT.COUNT;
--     dbms_output.put_line(v_size);
    for v_i in 1..v_size
        loop
            update INGREDIENTE set CANTITATE_INGREDIENT = CANTITY(v_i) where ID_INGREDIENT = v_i;
--     dbms_output.put_line(v_size);
        end loop;
END Update_Ingredients_Cantity;
/
CREATE OR REPLACE PROCEDURE Update_Ingredient_Cantity(ID IN number, CANTITY IN number)
AS

BEGIN
    --      dbms_output.put_line(id) ;
--      dbms_output.put_line(CANTITY) ;
--      dbms_output.put_line('') ;

    update INGREDIENTE
    set CANTITATE_INGREDIENT = CANTITY
    where ID_INGREDIENT = ID;
END Update_Ingredient_Cantity;
/
CREATE OR REPLACE PROCEDURE GENERATE_MENU
AS
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
BEGIN
    for produs in lista_produse
        loop
            v_number := GET_NUMBER_OF_PRODUCTS(produs.ID_PRODUS);
            dbms_output.put_line(v_number);
            if (v_number > 0) then
                insert into meniu(ID, ID_PRODUS, CANTITATE) VALUES (v_index, produs.ID_PRODUS, v_number);
                v_index := v_index+1;
            end if;
        end loop;
END GENERATE_MENU;
/
-- create or replace procedure update_Ing

