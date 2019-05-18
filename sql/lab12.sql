DECLARE v_fisier UTL_FILE.FILE_TYPE;
cursor c_profi is select id, nume, prenume, grad_didactic, created_at, updated_at from PROFESORI;
v_id INT;
v_nume VARCHAR2(15);
v_prenume VARCHAR2(30);
v_grad_didactic VARCHAR2(20);
v_created_at DATE;
v_updated_at DATE;
BEGIN v_fisier:=UTL_FILE.FOPEN('MYDIR','profesori.csv','W');
open c_profi;
loop fetch c_profi into v_id, v_nume, v_prenume, v_grad_didactic, v_created_at, v_updated_at;
exit when c_profi%NOTFOUND;
UTL_FILE.PUT_LINE(v_fisier,v_id || ',' || v_nume || ',' || v_prenume || ',' || v_grad_didactic || ',' || v_created_at || ',' || v_updated_at);
end loop;
close c_profi;
UTL_FILE.FCLOSE(v_fisier);
END;
/
drop table profi2;
CREATE TABLE PROFI2(
vid INT,
vnume VARCHAR2(15),
vprenume VARCHAR2(30),
vgrad_didactic VARCHAR2(20),
vcreated_at DATE,
vupdated_at DATE
);
/
DECLARE
v_fisier UTL_FILE.FILE_TYPE;
v_id INT;
v_nume VARCHAR2(15);
v_prenume VARCHAR2(30);
v_grad_didactic VARCHAR2(20);
v_created_at DATE;
v_updated_at DATE;
v_line VARCHAR2(200);
v_index INT := 0;
BEGIN v_fisier:=UTL_FILE.FOPEN('MYDIR','profesori.csv','R');
loop BEGIN UTL_FILE.GET_LINE(v_fisier, v_line);
EXCEPTION WHEN NO_DATA_FOUND THEN EXIT;
END;
select to_number(substr(v_line, 0, instr(v_line, ',')), 99) into v_id from dual;
select substr(v_line, instr(v_line, ',') + 1, length(v_line)-instr(v_line, ','))  into v_line from dual;
select substr(v_line, 0, instr(v_line, ',')-1) into v_nume from dual;
select substr(v_line, instr(v_line, ',') + 1, length(v_line)-instr(v_line, ','))  into v_line from dual;
select substr(v_line, 0, instr(v_line, ',')-1) into v_prenume from dual;
select substr(v_line, instr(v_line, ',') + 1, length(v_line)-instr(v_line, ','))  into v_line from dual;
select substr(v_line, 0, instr(v_line, ',')-1) into v_grad_didactic from dual;
select substr(v_line, instr(v_line, ',') + 1, length(v_line)-instr(v_line, ','))  into v_line from dual;
select substr(v_line, 0, instr(v_line, ',')-1) into v_created_at from dual;
select substr(v_line, instr(v_line, ',') + 1, length(v_line)-instr(v_line, ','))  into v_line from dual;
v_updated_at := v_line;
DBMS_OUTPUT.PUT_LINE(v_id || ' '||v_nume ||' '|| v_prenume || ' ' ||v_grad_didactic||' '||v_created_at||' '||v_updated_at);
insert into profi2(vid,vnume, vprenume, vgrad_didactic, vcreated_at, vupdated_at)
values (v_id, v_nume, v_prenume, v_grad_didactic, v_created_at, v_updated_at);
end loop;
UTL_FILE.FCLOSE(v_fisier);
END;
/

select instr('1,Cojocariu,Nicusor Constantin,Asistent,20-JUL-16,20-JUL-16',',')
from dual;
/
select * from profi2;






