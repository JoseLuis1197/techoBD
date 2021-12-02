--Insertar datos a la tabla de usuarios (test)

delete from tbl_user;

insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('jose@gmail',false,'123','jose');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('aleja@gmail',false,'123','alejand');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('mart@gmail',false,'123','Martin');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('alessia_proa@gmail',false,'123','Alessia');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('sara@hotmail',false,'123','Sara Potter');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('maraiaychus@gmail',false,'123','Maria y Chus');

commit;

--Insertar datos a la tabla de speakers
delete from tbl_speaker;

insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Jorge Apaza','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Crispin','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Vales','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Cano','','');

--Insert datos de videos
-- V: voluntario
-- O: Organización

delete from tbl_video;

insert into tbl_video (sName,sAddress,sVideoType) values ('modulo01','','V');
insert into tbl_video (sName,sAddress,sVideoType) values ('modulo01','','O');

insert into tbl_video (sName,sAddress,sVideoType) values ('modulo01','','O');

insert into tbl_video (sName,sAddress,sVideoType) values ('modulo01','','O');
