create or replace PROCEDURE procedure_d(emp_id IN NUMBER, emp_salary OUT NUMBER, emp_last_name OUT VARCHAR2) IS 
e_id_not_found EXCEPTION;
BEGIN
    SELECT last_name, salary INTO emp_last_name, emp_salary  FROM employees WHERE employee_id = emp_id;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No such id');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERR!');
END;



Declare 
    Empsalary Employees.Salary%Type;
    Empname Employees.Last_Name%Type;
    Emp_Id Employees.Employee_Id%Type := 100;
    
Begin
    Procedure_D(Emp_Id,Empsalary, Empname);
    Dbms_Output.Put_Line('Employee Surname: ' || Empname|| '. Slaray: ' || Empsalary);
End;

