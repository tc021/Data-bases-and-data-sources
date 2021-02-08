declare 
    cursor ex4_7_cursor is select first_name,last_name, salary from employees where department_id = 50;
    
begin

for cursor_row in ex4_7_cursor
    loop
        if cursor_row.salary > 3100 then
            dbms_output.put_line('Mr./Ms. '|| cursor_row.first_name || ' ' || cursor_row.last_name || ' has ' || cursor_row.salary  || ' salary, so do not receive extra');
        else
            dbms_output.put_line('Mr./Ms. '|| cursor_row.first_name || ' ' || cursor_row.last_name || ' has ' || cursor_row.salary  || ' salary, so receive extra');
        end if;
    end loop;
close ex4_7_cursor;
end;




