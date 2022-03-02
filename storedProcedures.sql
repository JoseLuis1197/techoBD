drop procedure if exists spValidateUserCredentials;

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

drop procedure if exists spCreateUser;

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
    declare videoId int;
    declare userId int;
    
    if  NOT EXISTS (SELECT 1 FROM tbl_user WHERE sUserEmail = userEmail or sDNI = userDNI) THEN
        insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName,bisDataTreatment,sDNI) 
        values (userEmail,isEnterpriseUser,userPassword,userFullName,userIsDataTreatment,userDNI);     
        commit;

        -- Se obtiene el id del usuario creado    
        select	iId 
        into 	userId
        from	tbl_user
        where	sUserEmail = userEmail;
        
        if isEnterpriseUser = true then
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
        select "OK" as RESULTADO;
    elseif EXISTS (SELECT 1 FROM tbl_user WHERE sDNI = userDNI) THEN
        select "ERROR DNI" as RESULTADO;
    else
        select "ERROR EMAIL" as RESULTADO;
    End if ;    

    
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

    declare iVideosWatched int default 0;
    declare  sVideosWatched char(1);
    declare dVideoFinished date;
    declare booleanIsEnterprise boolean;

    select  count(*)
    into    iVideosWatched
    from    tbl_user_video
    where   sIsWatched = true and iIdUser = userId;

    select  bIsEnterprise
    into    booleanIsEnterprise
    from    tbl_user
    where   iId = userId;

    if iVideosWatched = 0 then
        set sVideosWatched = 'I';
    elseif (iVideosWatched = 5 AND booleanIsEnterprise = false)  OR (iVideosWatched = 8 and booleanIsEnterprise = true) then
        
        set sVideosWatched = 'T';

        select      date_format(dDate, '%Y-%m-%d')
        into        dVideoFinished
        from        tbl_user_video
        where       iIdUser = userId
        order by    iId desc
        limit       1;
    else
        set sVideosWatched = 'P';
    end if; 

	select	
			iId,
			sUserEmail,
            bIsEnterprise,
            sFullname,
            sDNI,
            bIsDataTreatment,
            iVideosWatched,
            sVideosWatched,
            dVideoFinished
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
            v.sVideoType as videoType,
            v.sDescription as videoDescription,
            v.sConditions as videoConditions,
            v.sSpeaker as videoSpeaker,
            v.sTiming as videoTiming            
    from 	tbl_user_video uv inner join tbl_video v on uv.iIdVideo = v.iId
    where 	uv.iIdUser = userId;
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
    set 	sIsWatched = true,
            dDate = curDate()
    where 	iIdUser = userId and iIdVideo = videoId;
    commit;
end //

delimiter ;

drop procedure if exists spGetUserNextVideo;
delimiter //
create procedure spGetUserNextVideo
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
            v.sVideoType as videoType,
            v.sDescription as videoDescription,
            v.sConditions as videoConditions,
            v.sSpeaker as videoSpeaker,
            v.sTiming as videoTiming
    from    tbl_user_video uv
    inner join tbl_video v on uv.iIdVideo = v.iId
    where   uv.sIsWatched = false and uv.iIdUser = userId
    limit   1;

end //
delimiter ;

drop procedure if exists `spValidateUser`;
delimiter //
CREATE PROCEDURE `spValidateUser`(
    IN `email` VARCHAR(100), 
    IN `token` VARCHAR(100)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
begin    

    if exists (select 1 from tbl_user where sUserEmail = email) then

        update  tbl_user
        set     sToken = token
        where   sUserEmail = email;
        commit;

        select "OK" as RESULTADO;
    else
        select "Error" as RESULTADO;
    end if;

end//
delimiter ;

drop procedure if exists spUpdatePassword;
delimiter //
create procedure spUpdatePassword
(
	in token char(8),
    in newPassword varchar(100)
)
begin    

    if exists (select 1 from tbl_user where sToken = token) then

        update  tbl_user
        set     sPassword = newPassword
        where   sToken = token;
        commit;

        select "OK" as RESULTADO;

    else
        select "Error" as RESULTADO;

    end if;

end //
delimiter ;