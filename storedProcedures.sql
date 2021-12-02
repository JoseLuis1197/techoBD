drop procedure if exists spValidateUserCredentials;
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

drop procedure if exists spCreateUser;

delimiter //

create procedure spCreateUser
(
	in userEmail nvarchar(100), 
    in userFullName nvarchar(100), 
    in userPassword nvarchar(30),
    in isEnterpriseUser boolean
)
begin  
    if  NOT EXISTS (SELECT 1 FROM tbl_user WHERE sUserEmail = userEmail) THEN
        insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) 
        values (userEmail,isEnterpriseUser,userPassword,userFullName);        
    End if ;    

end //
delimiter ;

delimiter //

create procedure spUpdateUserInfo
(
    in userId int,
    in userFullName nvarchar(100), 
    in userPassword nvarchar(30),
    in isEnterpriseUser boolean
)
begin

    declare iUserFullName default '';
    declare iUserPassword default '';
    declare iIsEnterpriseUser default false;

    --Se obtienen los valores actuales
    SELECT  sFullName into iUserFullName,
            sPassword into iUserPassword,
            bIsEnterprise into iIsEnterpriseUser
    from    tbl_user
    where   iId = userId;

    --Se guardan las variables de manera temporal
    if not iUserFullName = userFullName then
        set iUserFullName = userFullName
    end if;

    if not iUserPassword = userPassword
        set iUserPassword = userPassword
    end if;

    if not iIsEnterpriseUser = isEnterpriseUser then
        set iIsEnterpriseUser = isEnterpriseUser
    end if;

    --Se actualizan los valores de la tabla
    update from tbl_user
    set
        sUserEmail = iUserFullName,
        sPassword = iUserPassword,
        bIsEnterprise = iIsEnterpriseUser
    where iId = userId;

end //

DELIMITER ;