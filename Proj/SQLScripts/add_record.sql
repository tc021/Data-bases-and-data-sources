CREATE OR REPLACE PROCEDURE add_record_2021(day in DATE, open in NUMBEr, high in NUMBER, low in NUMBER, close in number, volume in number)
IS

BEGIN
    INSERT INTO stocks_2021 VALUES(day, open, high, low, close, volume);
    
end;
    
