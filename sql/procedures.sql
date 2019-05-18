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
--     dbms_output.put_line(v_size);
    end loop;
END Update_Ingredients_Cantity;
/
CREATE OR REPLACE PROCEDURE Update_Ingredient_Cantity
    (ID IN number, CANTITY IN number)
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
--     order by (select count(nume) from produse p join INGREDIENTELEPRODUSELOR I2 on p.ID_PRODUS = I2.ID_PRODUS)/p.PRET asc ;
    v_number number;
    v_id number;
    v_start number := 1;
    v_end number := 10;
    cursor lista_produse is  select distinct * from produse p;
BEGIN
    for produs in lista_produse loop
--         dbms_output.put_line('id produs:');
--         dbms_output.put_line(v_line.ID_PRODUS);
--         v_id := (v_line.ID_PRODUS);
v_number :=  GET_NUMBER_OF_PRODUCTS(produs.ID_PRODUS);
    end loop;
END GENERATE_MENU;
/
-- create or replace procedure update_Ing

