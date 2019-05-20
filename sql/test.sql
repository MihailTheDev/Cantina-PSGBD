declare
      v_id_list number_list := number_list(1,2,3,5,6);
      v_cantity_list number_list := number_list(10,15,30,5,7);
    ingredientsList number_list;
    v_number number;

begin
--     INSERTINGREDIENTSCANTITY(v_id_list, v_cantity_list );
--     GENERATE_MENU();
--         v_number := Get_Number_Of_Products(5);
--         dbms_output.put_line(v_number) ;
        v_number;
end;

declare num number; begin num :=generate; end;

 BEGIN DBMS_OUTPUT.PUT_LINE('9 squared is ' || generate() );END;

select generate from dual;

delete from meniu;

select * from UTILIZATORI;

select * from users;

select * from INGREDIENTE;

select * from MENIU;

select i.NUME_INGREDIENT, i.CANTITATE_INGREDIENT, p.PRET from produse p
join INGREDIENTELEPRODUSELOR ig on p.ID_PRODUS = ig.ID_PRODUS
join INGREDIENTE I on ig.ID_INGREDIENT = I.ID_INGREDIENT
where p.ID_PRODUS =1
order by p.PRET desc ;

select * from produse order by  PRET;

select * from INGREDIENTELEPRODUSELOR;


-- test check user
select * from UTILIZATORI;
begin
    dbms_output.put_line('utliziatorul este..'||checkUser('gigi', 'becali'));
    end;
/
-- test for insert
declare
    v_res number;
    begin
        v_res := createUser('gigi', 'admin', 'becali');
        dbms_output.put_line('utliziatorul este..'||checkUser('gigi', 'becali'));
    end;
/
--  test delete
begin
    dbms_output.put_line('statusul stergerii este: '||deleteUser('gigi', 'becali'));
end;
/

