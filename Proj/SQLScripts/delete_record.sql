CREATE OR REPLACE PROCEDURE delete_record_2021(d_day in DATE, d_open in NUMBEr, d_high in NUMBER, d_low in NUMBER, d_close in number, d_volume in number)
IS
    e_exception EXCEPTION;
BEGIN
    delete from stocks_2021 where stocks_2021.day = d_day or stocks_2021.open = d_open or stocks_2021.high = d_high or stocks_2021.close = d_close or stocks_2021.volume = d_volume;
    
    if SQL%ROWCOUNT > 1 THEN
        RAISE e_exception;
    else 
        DBMS_OUTPUT.PUT_LINE('Row deleted');
    END IF;

EXCEPTION
WHEN e_exception THEN
    DBMS_OUTPUT.PUT_LINE('You are trying to delete more than 1 row');
    
end;
    
