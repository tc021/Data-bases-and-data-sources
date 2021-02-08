CREATE OR REPLACE PROCEDURE procedure_c(job_to_delete IN VARCHAR2) IS
e_id_not_found EXCEPTION;
BEGIN
DELETE
FROM
    jobs
WHERE 
    job_id = job_to_delete;
    
IF SQL%NOTFOUND THEN
    RAISE e_id_not_found;
ELSE
    DBMS_OUTPUT.PUT_LINE('Record deleted');
END IF;
EXCEPTION 
WHEN e_id_not_found THEN
    DBMS_OUTPUT.PUT_LINE('No such id');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error');
END;