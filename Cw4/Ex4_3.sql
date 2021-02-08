DROP TABLE new_table CASCADE CONSTRAINTS;
CREATE TABLE new_table (Column1 varchar(10))
/
declare 
    i number := 0;
    
begin
    loop
        i := i+1;
        if i = 4 or i = 6 then
            continue;
        else 
            insert into new_table(
                                    Column1)
            values(
                    i);
        end if;
        exit when i = 10;
    end loop;
end;

select * from new_table;
