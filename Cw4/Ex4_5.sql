declare
    type temp_table is table of departments.department_name%type index by pls_integer;
    departments__list temp_table;
    id_numbers number:=10;
begin
    for i in 1..10
        loop
        select department_name into departments__list(i) from departments 
        where department_id = id_numbers;
        id_numbers := id_numbers + 10;
        dbms_output.put_line(departments__list(i));
        end loop;
end;

