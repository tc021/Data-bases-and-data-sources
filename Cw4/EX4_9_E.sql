CREATE SEQUENCE id_seq;

create or replace TRIGGER squence_id BEFORE INSERT ON employees 
FOR EACH ROW

BEGIN 
    SELECT id_seq.NEXTVAL 
    INTO :new.employee_id
    FROM dual;
end;

CREATE OR REPLACE PROCEDURE procedure_e(
--new_e_id IN NUMBER DEFAULT id_seq.nextval,
new_e_id IN NUMBER,
new_e_name IN VARCHAR2 DEFAULT 'Name',
new_e_surname IN VARCHAR2 DEFAULT 'Surname',
new_e_mail IN VARCHAR2 DEFAULT 'Mail',
new_e_phone IN VARCHAR2 DEFAULT NULL,
new_e_date_hire IN DATE DEFAULT trunc(SYSDATE),
new_e_job_id IN VARCHAR2 DEFAULT 'test-test',
new_e_salary IN NUMBER DEFAULT 2500,
new_e_com_pct IN NUMBER DEFAULT 0.1,
new_e_manager IN NUMBER DEFAULT 103,
new_e_department IN NUMBER DEFAULT 70
) IS 
new_row employees%ROWTYPE;
event_exception EXCEPTION;
BEGIN
    INSERT INTO employees VALUES(new_e_id, new_e_name, new_e_surname, new_e_mail,new_e_phone,new_e_date_hire,new_e_job_id,new_e_salary, new_e_com_pct,new_e_manager,new_e_department);
    IF new_e_salary > 20000 THEN
        RAISE event_exception;
    ELSE 
        dbms_output.put_line('Row added');
    END IF;
    
    EXCEPTION
    WHEN event_exception THEN 
        DBMS_OUTPUT.PUT_LINE('Salary too high.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERR!');
END;