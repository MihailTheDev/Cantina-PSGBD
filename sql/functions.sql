create or replace function GetIngredientsList(v_id number) -- list with all ingredients necessary to create one product
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


drop procedure Get_Number_Of_Products;
create or replace function Get_Number_Of_Products(v_id number)
return number
as
    v_ingredientsList NUMBER_TYPE;
    v_min number := 0;
    v_quantity number;
    v_result_list NUMBER_TYPE := NUMBER_TYPE();
    v_index number := 1;
    v_i number;
--     declarari
begin
    v_ingredientsList := GETINGREDIENTSLIST(v_id);
         dbms_output.put_line(v_ingredientsList.COUNT);
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
        v_quantity := Get_Ingredient_Cantity(v_ingredientsList(i));
        v_quantity:= v_quantity - v_min;
--         dbms_output.put_line(i) ;
        UPDATE_INGREDIENT_CANTITY(v_ingredientsList(i), v_quantity);
--         dbms_output.put_line(v_ingredientsList(i)) ;
    end loop;
--         dbms_output.put_line(v_min) ;
    return v_min;
end;