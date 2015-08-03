delimiter //
DROP PROCEDURE IF EXISTS createRole;
DROP PROCEDURE IF EXISTS createUserEntry;
DROP PROCEDURE IF EXISTS createUserHasRole;
DROP PROCEDURE IF EXISTS createTransaction;
 
create procedure createRole($name varchar(50), out $id int)
begin
    insert into roles (rolename) values ($name);
    set $id := last_insert_id();
end //
 
create procedure createUserEntry($email varchar(50), out $id int)
begin
    insert into users (email, password, registration_date) values ($email, 'password', CURRENT_TIMESTAMP);
    set $id := last_insert_id();
end //
 
create procedure createUserHasRole($user_id int, $role_id smallint)
begin
    insert into user_roles (user_id, role_id) values ($user_id, $role_id);
end //


create procedure createTransaction($user_id int, $admin_id int, $amount decimal)
begin
    insert into transactions (user_id, admin_id, amount, transaction_date) values ($user_id, $admin_id, $amount, CURRENT_TIMESTAMP);
end //

CREATE TRIGGER UPDATE_AMOUNT AFTER INSERT ON TRANSACTIONS
FOR EACH ROW BEGIN
IF (SELECT EXISTS( SELECT 1 FROM USER_BALANCE UB WHERE UB.USER_ID=NEW.USER_ID))
THEN
    UPDATE USER_BALANCE UB SET UB.AMOUNT=(SELECT SUM(AMOUNT) 
        FROM TRANSACTIONS
        WHERE USER_ID = UB.USER_ID)
    WHERE UB.USER_ID = NEW.USER_ID;
ELSE
    INSERT INTO USER_BALANCE(USER_ID, AMOUNT) VALUES (NEW.USER_ID, (SELECT SUM(AMOUNT) 
        FROM TRANSACTIONS
        WHERE USER_ID = NEW.USER_ID));
END IF;
END;//

delimiter ;