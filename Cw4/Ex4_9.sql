create or replace procedure 
procedure_a(Job_id varchar2, Job_title varchar2)
is
begin
insert into jobs(job_id, job_title) values(Job_id, Job_title);
exception
when others then
dbms_output.put_line('Error');
end;


--begin
--procedure_a('test_id_2','test_title_2');
--end;