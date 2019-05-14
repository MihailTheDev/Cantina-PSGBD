-- drop procedure INSERTINGREDIENTSCANTITY;
CREATE OR REPLACE PROCEDURE Update_Ingredients_Cantity
    (ID_INGREDIENT IN number_type, CANTITY IN number_type)
AS
    v_size number;
    v_i number;
    v_cantitate number;
BEGIN
    v_size := ID_INGREDIENT.COUNT;
--     dbms_output.put_line(v_size);
    for v_i in 1..v_size loop
        update INGREDIENTE set CANTITATE_INGREDIENT = CANTITY(v_i)  where ID_INGREDIENT = v_i;
    dbms_output.put_line(v_size);
    end loop;
END Update_Ingredients_Cantity;
/
CREATE OR REPLACE PROCEDURE Update_Ingredient_Cantity
    (ID IN number, CANTITY IN number)
AS

BEGIN
        update INGREDIENTE
        set CANTITATE_INGREDIENT = CANTITY
        where ID_INGREDIENT = ID;
END Update_Ingredient_Cantity;
/
CREATE OR REPLACE PROCEDURE GENERATE_MENU
AS
    cursor lista_produse is  select distinct * from produse
        join INGREDIENTELEPRODUSELOR ig on produse.ID_PRODUS = ig.ID_PRODUS
        order by produse.PRET desc ;
BEGIN

    for v_line in lista_produse loop
        dbms_output.put_line(v_line.NUME);
    end loop;
--     dbms_output.put_line(3);
END GENERATE_MENU;
/
create or replace procedure update_Ing

