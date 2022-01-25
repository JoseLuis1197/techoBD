drop procedure spValidateUserCredentials;
delimiter //
create procedure spValidateUserCredentials
(
	in userEmail nvarchar(50),
	in userPassword nvarchar(50)
)
begin    
	select	iId as userId,
            sUserEmail as userEmail,
            sDNI as userDNI,
            bIsEnterprise as userEnterprise,
            bIsDataTreatment as userIsDataTreatment,
            sFullName as userFullName
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
    in userIsDataTreatment boolean,
    in isEnterpriseUser boolean,
    in userDNI nvarchar(10)
)
begin
	declare contador int;
    declare rowCount int;
    declare videoId int;
    declare userId int;
    
    if  NOT EXISTS (SELECT 1 FROM tbl_user WHERE sUserEmail = userEmail) THEN
        insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName,bisDataTreatment,sDNI) 
        values (userEmail,isEnterpriseUser,userPassword,userFullName,userIsDataTreatment,userDNI);     
        commit;
    End if ;  
    
    -- Se obtiene el id del usuario creado    
    select	iId 
    into 	userId
    from	tbl_user
	where	sUserEmail = userEmail;
    
    if userIsDataTreatment = true then
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,1);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,2);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,3);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,4);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,5);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,6);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,7);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,8);
        commit;
    else
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,1);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,2);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,3);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,4);
        insert into tbl_user_video (iIdUser,iIdVideo) values (userId,5);
        commit;
    end if;
end //
delimiter ;

drop procedure if exists spUpdateUserInfo;

delimiter //

create procedure spUpdateUserInfo
(
    in userId int,
    in userFullName nvarchar(100), 
    in userPassword nvarchar(30),
    in isEnterpriseUser boolean
)
begin
    declare iUserFullName nvarchar(100) default '';
    declare iUserPassword nvarchar(50) default '';
    declare iIsEnterpriseUser boolean default false;

    -- Se obtienen los valores actuales
    select
			sFullName,
            sPassword,
            bIsEnterprise
	into  	iUserFullName,
			iUserPassword,
            iIsEnterpriseUser
    from    tbl_user
    where   iId = userId;

    -- Se guardan las variables de manera temporal
    if not iUserFullName <> userFullName then
        set iUserFullName = userFullName;
    end if;

    if not iUserPassword = userPassword then
        set iUserPassword = userPassword;
    end if;

    if not iIsEnterpriseUser = isEnterpriseUser then
        set iIsEnterpriseUser = isEnterpriseUser;
    end if;

    --  Se actualizan los valores de la tabla
    update tbl_user
    set
        sUserEmail = iUserFullName,
        sPassword = iUserPassword,
        bIsEnterprise = iIsEnterpriseUser
    where iId = userId;

end //
delimiter ;

drop procedure if exists spGetUserInfo;

delimiter //

create procedure spGetUserInfo
(
	in userId int
)
begin
	select	
			iId,
			sUserEmail,
            bIsEnterprise,
            sFullname,
            sDNI,
            bIsDataTreatment
    from 	tbl_user
    where	iId = userId;
end //

delimiter ;

drop procedure if exists spListUserVideos;

delimiter //

create procedure spListUserVideos 
(
	in userId int
)
begin
	select	uv.iId as id,
			uv.iIdUser as userId,
            uv.iIdVideo as videoId,
            uv.sIsWatched as videoWatched,
            v.sName as videoName,
            v.sAddress as videoAddress,
            v.sVideoType as videoType
    from 	tbl_user_video uv inner join tbl_video v on uv.iId = v.iId
    where 	uv.iId = userId;
end //

delimiter ;

drop procedure if exists spUpdateUserVideo;

delimiter //

create procedure spUpdateUserVideo
(
	in userId int,
    in videoId int
)
begin
	update 	tbl_user_video
    set 	sIsWatched = true
    where 	iIdUser = userId and iIdVideo = videoId;
    commit;
end //

delimiter ;