CREATE TABLE AUDIT_DDL (
  d date,
  OSUSER varchar2(255),
  CURRENT_USER varchar2(255),
  HOST varchar2(255),
  TERMINAL varchar2(255),
  owner varchar2(30),
  type varchar2(30),
  name varchar2(30),
  sysevent varchar2(30));

CREATE TABLE table_2021_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));
  
CREATE TABLE table_2020_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));
  
CREATE TABLE table_2019_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));
  
CREATE TABLE table_2018_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));
  
CREATE TABLE table_2017_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));
  
CREATE TABLE table_2016_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));

CREATE TABLE table_2015_audit (
  d date,
  user_name varchar2(255),
  sysevent varchar2(30));


CREATE OR REPLACE TRIGGER logs_2021
AFTER UPDATE OR INSERT OR DELETE ON stocks_2021
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2021_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2021_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2021_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2020
AFTER UPDATE OR INSERT OR DELETE ON stocks_2020_2021
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2020_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2020_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2020_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2019
AFTER UPDATE OR INSERT OR DELETE ON stocks_2019_2020
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2019_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2019_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2019_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2018
AFTER UPDATE OR INSERT OR DELETE ON stocks_2018_2019
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2018_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2018_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2018_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2017
AFTER UPDATE OR INSERT OR DELETE ON stocks_2017_2018
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2017_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2017_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2017_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2016
AFTER UPDATE OR INSERT OR DELETE ON stocks_2016_2017
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2016_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2016_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2016_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;

CREATE OR REPLACE TRIGGER logs_2015
AFTER UPDATE OR INSERT OR DELETE ON stocks_2015_2016
ENABLE
BEGIN
IF INSERTING THEN
    INSERT INTO table_2015_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user,'INSERTING');
ELSIF UPDATING THEN
    INSERT INTO table_2015_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'UPDATING');
ELSIF DELETING THEN
    INSERT INTO table_2015_audit(d, user_name, sysevent)
    VALUES (sysdate, ora_login_user, 'DELETING');
END IF;
END;



  
create or replace trigger audit_ddl_trg after ddl on schema
begin
  if (ora_sysevent='TRUNCATE')
  then
    null; -- I do not care about truncate
  else
    insert into audit_ddl(d, osuser,current_user,host,terminal,owner,type,name,sysevent)
    values(
      sysdate,
      sys_context('USERENV','OS_USER') ,
      sys_context('USERENV','CURRENT_USER') ,
      sys_context('USERENV','HOST') ,
      sys_context('USERENV','TERMINAL') ,
      ora_dict_obj_owner,
      ora_dict_obj_type,
      ora_dict_obj_name,
      ora_sysevent
    );
  end if;
end;
/