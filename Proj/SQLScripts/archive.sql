create table archive_2021_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2020_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2019_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2018_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2017_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2016_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create table archive_2015_data(
    "DAY" DATE,
    "OPEN" NUMBER,
    "HIGH" NUMBER,
    "LOW" NUMBER,
    "CLOSE" NUMBER,
    "VOLUME" NUMBER,
    "ARCHIVE_DATA" DATE);
    
create or replace TRIGGER archive_2021_data 
AFTER DELETE ON stocks_2021
FOR EACH ROW
BEGIN
    insert into archive_2021_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2020_data 
AFTER DELETE ON stocks_2020_2021
FOR EACH ROW
BEGIN
    insert into archive_2020_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2019_data 
AFTER DELETE ON stocks_2019_2020
FOR EACH ROW

BEGIN
    insert into archive_2019_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2018_data 
AFTER DELETE ON stocks_2018_2019

BEGIN
    insert into archive_2018_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2017_data 
AFTER DELETE ON stocks_2017_2018
FOR EACH ROW

BEGIN
    insert into archive_2017_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2016_data 
AFTER DELETE ON stocks_2016_2017
FOR EACH ROW

BEGIN
    insert into archive_2016_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;

create or replace TRIGGER archive_2015_data 
AFTER DELETE ON stocks_2015_2016
FOR EACH ROW

BEGIN
    insert into archive_2015_data values(:old.day, :old.open, :old.high, :old.low, :old.close, :old.volume, SYSDATE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record deleted');
end;