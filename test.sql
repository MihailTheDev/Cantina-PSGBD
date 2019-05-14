set serveroutput on;
declare
      v_id_list number_type := NUMBER_TYPE(1,2,3,5,6);
      v_cantity_list number_type := NUMBER_TYPE(10,15,30,5,7);

begin
dbms_output.put_line('3');
--     INSERTINGREDIENTSCANTITY(v_id_list, v_cantity_list );
    GENERATE_MENU();
end;

select * from INGREDIENTE;

select * from produse
join INGREDIENTELEPRODUSELOR ig on produse.ID_PRODUS = ig.ID_PRODUS
join INGREDIENTE I on ig.ID_INGREDIENT = I.ID_INGREDIENT
order by produse.PRET desc ;

select * from INGREDIENTELEPRODUSELOR;