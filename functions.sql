create or replace function GetIngredientsList(v_id number)
return number_type
as
-- declarari
    v_ingredientsList NUMBER_TYPE := NUMBER_TYPE();
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
create or replace function Get_Ingredient_Cantity(v_id number)
return integer
as
--     declaration
    v_cantity integer;
begin
        select CANTITATE_INGREDIENT into v_cantity from INGREDIENTE
            where ID_INGREDIENT = v_id;
        return v_cantity;
end;



create or replace function Get_Number_Of_Products(v_id number)
return number
as
    v_ingredientsList NUMBER_TYPE;
    v_min number := 0;
    v_cantity number;
    v_result_list NUMBER_TYPE := NUMBER_TYPE();
    v_index number := 1;
    v_i number;
--     declarari
begin
--     v_result_list.extend(1000);
    v_ingredientsList := GETINGREDIENTSLIST(v_id);
    for i in v_ingredientsList.First..v_ingredientsList.LAST loop
        v_cantity := Get_Ingredient_Cantity(v_ingredientsList(i));
--         dbms_output.put_line(v_cantity);
--             v_cantity := 5;
        v_result_list.extend(1);
        v_result_list(v_index) := v_cantity;
    end loop;
    v_min := v_result_list(1);
    for v_i in 1..v_index loop
        if(v_min > v_result_list(v_i)) then
            v_min := v_result_list(v_i);
        end if;
    end loop;
    if(v_min = 0) then
        return v_min;
    end if;
--         dbms_output.put_line(v_min) ;
--      for i in v_ingredientsList.First..v_ingredientsList.Last loop
-- --         v_cantity := Get_Ingredient_Cantity(v_ingredientsList(i));
-- -- --         dbms_output.put_line(v_cantity ) ;
-- --         v_cantity:= v_cantity - v_min;
-- -- --         UPDATE_INGREDIENT_CANTITY(v_ingredientsList(i), v_cantity);
-- --         dbms_output.put_line(v_ingredientsList(i)) ;
-- --     end loop;
    return v_min;
end;