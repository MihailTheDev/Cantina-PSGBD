declare
      v_id_list number_type := NUMBER_TYPE(1,2,3,5,6);
      v_cantity_list number_type := NUMBER_TYPE(10,15,30,5,7);
    ingredientsList NUMBER_TYPE;
    v_number number;

begin
--     INSERTINGREDIENTSCANTITY(v_id_list, v_cantity_list );
--     GENERATE_MENU();
--         ingredientsList := GETINGREDIENTSLIST(3);
        v_number := Get_Number_Of_Products(2);

            dbms_output.put_line(' ingredients are:');
            dbms_output.put_line(v_number);
end;


 select *
            from table (select GETINGREDIENTSLIST(3) from dual );

select * from INGREDIENTE;

select * from produse p
join INGREDIENTELEPRODUSELOR ig on p.ID_PRODUS = ig.ID_PRODUS
join INGREDIENTE I on ig.ID_INGREDIENT = I.ID_INGREDIENT
where p.ID_PRODUS =2
order by p.PRET desc ;

select * from produse order by  PRET;

select * from INGREDIENTELEPRODUSELOR;

