declare 
    cursor ex4_8_cursor (lsofsection number, rsosetion number, lofName in varchar2) is select first_name, last_name, salary from employees where (salary >= lsofsection and salary<=rsosetion);
    employee_data ex4_8_cursor%rowtype;
    
begin
    open ex4_8_cursor(1000,5000,'A'); 
    
    loop
    fetch ex4_8_cursor into employee_data;
    exit when ex4_8_cursor%notfound;
    dbms_output.put_line('Mr./Ms. ' || employee_data.first_name || ' ' || employee_data.last_name || ' Salary:' || employee_data.salary);
    end loop;
--    dbms_output.put_line(employee.first_name);
    close ex4_8_cursor;
    
    open ex4_8_cursor(5000,20000,'U'); 
    
    loop
    fetch ex4_8_cursor into employee_data;
    exit when ex4_8_cursor%notfound;
    dbms_output.put_line('Mr./Ms. ' || employee_data.first_name || ' ' || employee_data.last_name || ' Salary:' || employee_data.salary);
    end loop;
--    dbms_output.put_line(employee.first_name);
    close ex4_8_cursor;
end;