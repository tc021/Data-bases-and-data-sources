declare
    type temp_table is table of departments%rowtype index by pls_integer;
    departments_list temp_table;
    id_numbers number:=10;
begin
    for i in 1..10
        loop
        select * into departments_list(i) from departments 
        where department_id = id_numbers;
        id_numbers := id_numbers + 10;
        dbms_output.put_line('Dearptment name ' || departments_list(i).department_name||' Department id' || departments_list(i).department_id);
        end loop;
end;

