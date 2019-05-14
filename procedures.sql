CREATE OR REPLACE PROCEDURE INSERTINGREDIENTSCANTITY
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
END INSERTINGREDIENTSCANTITY;
/


CREATE OR REPLACE PROCEDURE GENERATE_MENU
AS
    cursor lista_produse is
        select * from produse
        join INGREDIENTELEPRODUSELOR ig on produse.ID_PRODUS = ig.ID_PRODUS
        join INGREDIENTE I on ig.ID_INGREDIENT = I.ID_INGREDIENT
        order by produse.PRET desc ;
BEGIN

    for v_line in lista_produse loop
        dbms_output.put_line(v_line.NUME);
    end loop;
    dbms_output.put_line(3);
END GENERATE_MENU;
/

