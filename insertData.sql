-- Insertar datos a la tabla de usuarios (test)
delete from tbl_user_video;
delete from tbl_user;
delete from tbl_speaker;

-- Insert datos de videos
-- V: voluntario
-- O: Organización

delete from tbl_video;

insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 1','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+1.mp4','V','Definiciones básicas y Políticas Migratorias.','Nancy Arellano','1 h 30 min','<ul><li>Derechos Humanos Universales.</li><li>Análisis de contexto migratorio y refugiados.</li><li>¿Por qué ocurre un proceso migratorio?</li><li>Bases legales y trámites documentarios para migrantes y refugiados en Perú.</li><li>Servicios que ofrece el Estado peruano.</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 2','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+1.mp4','V','TEMA 1: Herramientas Técnicas de Diagnóstico','Ysabel Pastor Zapata','32 min','<ul><li>Recojo, sistematización y análisis de información</li><li>Elaboración de protocolos de logística y de distribución de ayuda humanitaria en contextos de emergencia</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 2','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+2.mp4','V','TEMA 2: Dinámicas Comunitaria','Cristabel Cartaya Ovalles','43 min','<ul><li>Consejo de residentes por distrito</li><li>Centros de atención tecnológicos - “venecentros”</li><li>Organizaciones de base venezolanas</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 3','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+1.mp4','V','TEMA 1: Atención Primaria','Diego Lizarzaburu','35 min','<ul><li>Taller de Primeros Auxilios</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Módulo 03 - Parte II','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+2.mp4','V','TEMA 2: Contención Emocional','Nurys Joselyn Morin','45 min','<ul><li>Taller de Contención Emocional (Casos de vulnerabilidad)</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Presentación 1','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+1.mp4','O','El voluntariado en el Perú.','Ivonne Harvey','50 min','<ul><li>¿Dónde estamos y quiénes somos? Soy voluntario porque …</li><li>¿Qué representa el voluntariado?</li><li>El voluntariado en el Perú.</li><li>Desafíos para el voluntariado.</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Presentación 2','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+2.mp4','O','Ley de Voluntariado y su sistema.','Teri de Sario Acasuzo','50 min','<ul><li>Importancia del voluntariado.</li><li>El marco normativo.</li><li>Definición de voluntariado: derechos, deberes y beneficios.</li><li>Organizaciones de voluntariado: Obligaciones.</li><li>Sistema Nacional de voluntariado.</li><li>Registro de voluntariado.</li><li>Plataforma del Sistema Nacional de Voluntariado.</li></ul>');
insert into tbl_video (sName,sAddress,sVideoType,sDescription,sSpeaker,sTiming,sConditions) values ('Presentación 3','https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+3.mp4','O','Modelo de Gestión de Voluntariado - TECHO.','Carolina Martinez','33 min','<ul><li>Historia: 15 años en el Perú.</li><li>Definición: voluntario y voluntaria.</li><li>Planificación.</li><li>Diseñar. Ciclo de voluntariado.</li><li>Modelo de gestión de voluntariado.</li><li>Aprendizajes.</li></ul>');

commit;