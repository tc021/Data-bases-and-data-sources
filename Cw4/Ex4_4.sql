declare 
   countries_info countries%rowtype;
    
begin 
   select * 
   into countries_info 
   from countries
   where country_id = 'CA';
   dbms_output.put_line('Country name: ' || countries_info.country_name);
   dbms_output.put_line('Country Region ID: ' || countries_info.region_id);
end;
    
        
    