-- Insertar datos a la tabla de usuarios (test)
delete from tbl_user_video;
delete from tbl_user;

insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('jose@gmail',false,'123','jose');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('aleja@gmail',false,'123','alejand');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('mart@gmail',false,'123','Martin');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('alessia_proa@gmail',false,'123','Alessia');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('sara@hotmail',false,'123','Sara Potter');
insert into tbl_user (sUserEmail,bIsEnterprise,sPassword,sFullName) values ('maraiaychus@gmail',false,'123','Maria y Chus');

commit;

-- Insertar datos a la tabla de speakers
delete from tbl_speaker;

insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Jorge Apaza','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Crispin','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Vales','','');
insert into tbl_speaker (sFullName,sLinkedInUrl,sImageUrl) values ('Cano','','');

commit;

-- Insert datos de videos
-- V: voluntario
-- O: Organización

delete from tbl_video;

insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 01','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+1.mp4','V','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Módulo 02 - Parte I','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+1.mp4','V','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Módulo 02 - Parte II','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+2.mp4','V','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Módulo 03 - Parte I','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+1.mp4','V','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Módulo 03 - Parte II','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+2.mp4','V','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Programa de organizaciones 1','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+1.mp4','O','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Programa de organizaciones 2','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+2.mp4','O','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType) values ('Programa de organizaciones 3','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+3.mp4','O','123','Juana','1 hora y 20 minutos','<ul><li>ejemplo1</li><li>Ejemplo2</li></ul>');

commit;