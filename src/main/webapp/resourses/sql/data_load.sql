call createRole('ROLE_ADMIN', @role_admin);
call createRole('ROLE_USER', @role_user);

call createUserEntry('admin', @admin);
call createUserHasRole(@admin, @role_admin);

call createUserEntry('user@lol.com', @user);
call createUserHasRole(@user, @role_user);

call createUserEntry('user1@lol.com', @user1);
call createUserHasRole(@user1, @role_user);

call createTransaction(@user, @admin, 40.00);
call createTransaction(@user, @admin, 10.00);
call createTransaction(@user, @admin, 90.00);
call createTransaction(@user, @admin, 10.00);
call createTransaction(@user, @admin, 70.00);
call createTransaction(@user, @admin, 10.00);

call createTransaction(@user1, @admin, 10.00);
call createTransaction(@user1, @admin, 30.00);
call createTransaction(@user1, @admin, 10.00);
call createTransaction(@user1, @admin, 60.00);
call createTransaction(@user1, @admin, 10.00);
call createTransaction(@user1, @admin, 10.00);
call createTransaction(@user1, @admin, 20.00);
