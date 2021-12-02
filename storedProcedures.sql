drop procedure spValidateUserCredentials;
delimiter //
create procedure spValidateUserCredentials
(
	in userEmail nvarchar(50), 
	in userPassword nvarchar(50)
)
begin    
	select	count(*) as result
    from 	tbl_user
    where	sPassword = userPassword and sUserEmail = userEmail;
end //
delimiter ;

drop procedure spCreateUser;

delimiter //

create procedure spCreateUser
(
	in userEmail nvarchar(100), 
    in userFullName nvarchar(100), 
    in userPassword nvarchar(30),
    in isEnterpriseUser boolean
)
begin
    declare iCreateUser int default 0;
    
    -- Se valida si el usuario ya existe o no
    select	count(*) into iCreateUser
    from 	tbl_user
    where	sUserEmail = userEmail;
    
    select iCreateUser;
    
    /*
    
    set result = false;
    
    if iCreateUser = 1 then
		insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) 
		values (userEmail,isEnterpriseUser,userPassword,userFullName);
		commit;
        set result = true;
    end if;
    
    */

end //
delimiter ;



set @userName = 'jose@gmail';
set @pass = '123';
set @isEnterp = false;
set @fullName = 'Pepe lucho';
set @re = false;
-- call spValidateUserCredentials(@userName,@pass);
call spCreateUser(@userName,@fullName,@pass,@isEnterp);

