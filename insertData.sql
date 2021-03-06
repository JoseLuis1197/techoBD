-- Insertar datos a la tabla de usuarios (test)
delete from tbl_user_video;
delete from tbl_user;
delete from tbl_speaker;

-- Insert datos de videos
-- V: voluntario
-- O: Organización

delete from tbl_video;

INSERT INTO `tbl_video` (`iId`, `sName`, `sDescription`, `sConditions`, `sSpeaker`, `sTiming`, `sAddress`, `sVideoType`) VALUES
(1, 'Módulo 1', 'Definiciones básicas y Políticas Migratorias.', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Derechos Humanos Universales.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Análisis de contexto migratorio y refugiados.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>¿Por qué ocurre un proceso migratorio?</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Bases legales y trámites documentarios para migrantes y refugiados en Perú.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Servicios que ofrece el Estado peruano.</li></ul class=\"list-group\">', 'Nancy Arellano', '1 h 30 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+1.mp4', 'V'),
(2, 'Módulo 2 - Parte I', 'TEMA 1: Herramientas Técnicas de Diagnóstico', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Recojo, sistematización y análisis de información</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Elaboración de protocolos de logística y de distribución de ayuda humanitaria en contextos de emergencia</li></ul class=\"list-group\">', 'Ysabel Pastor Zapata', '32 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+1.mp4', 'V'),
(3, 'Módulo 2 - Parte II', 'TEMA 2: Dinámicas Comunitaria', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Consejo de residentes por distrito</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Centros de atención tecnológicos - “venecentros”</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Organizaciones de base venezolanas</li></ul class=\"list-group\">', 'Cristabel Cartaya Ovalles', '43 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+2+-+Parte+2.mp4', 'V'),
(4, 'Módulo 3 - Parte I', 'TEMA 1: Atención Primaria', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Taller de Primeros Auxilios</li></ul class=\"list-group\">', 'Diego Lizarzaburu', '35 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+1.mp4', 'V'),
(5, 'Módulo 3 - Parte II', 'TEMA 2: Contención Emocional', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Taller de Contención Emocional (Casos de vulnerabilidad)</li></ul class=\"list-group\">', 'Nurys Joselyn Morin', '45 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+M%C3%93DULO+3+-+Parte+2.mp4', 'V'),
(6, 'Presentación 1', 'El voluntariado en el Perú.', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>¿Dónde estamos y quiénes somos? Soy voluntario porque …</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>¿Qué representa el voluntariado?</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>El voluntariado en el Perú.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Desafíos para el voluntariado.</li></ul class=\"list-group\">', 'Ivonne Harvey', '50 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+1.mp4', 'O'),
(7, 'Presentación 2', 'Ley de Voluntariado y su sistema.', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Importancia del voluntariado.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>El marco normativo.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Definición de voluntariado: derechos, deberes y beneficios.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Organizaciones de voluntariado: Obligaciones.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Sistema Nacional de voluntariado.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Registro de voluntariado.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Plataforma del Sistema Nacional de Voluntariado.</li></ul class=\"list-group\">', 'Teri de Sario Acasuzo', '50 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+2.mp4', 'O'),
(8, 'Presentación 3', 'Modelo de Gestión de Voluntariado - TECHO.', '<ul class=\"list-group\"><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Historia: 15 años en el Perú.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Definición: voluntario y voluntaria.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Planificación.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Diseñar. Ciclo de voluntariado.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Modelo de gestión de voluntariado.</li><li class=\"list-group-item\"><i class=\"fas fa-check px-2\"></i>Aprendizajes.</li></ul class=\"list-group\">', 'Carolina Martinez', '33 min', 'https://bucket-techo-dev.s3.us-east-2.amazonaws.com/Video+PRESNTAC+3.mp4', 'O');

commit;

--LinkedIn links for speakers

--Nancy Arellano - https://www.linkedin.com/in/nancyarellanos/?originalSubdomain=pe
--Ysabel Pastor - https://www.linkedin.com/in/ysabel-pastor-zapata-b2b642171/
--Cristabel Cartaya - https://www.linkedin.com/in/cristabelcartaya/
--Diego Lizarzaburu - https://www.linkedin.com/in/diego-lizarzaburu-castagnino-80860a76/
--Nurys Morin - https://www.linkedin.com/in/nurys-morin-ab8a80162/
--Ivonne Harvey - https://www.linkedin.com/in/ivonneharvey/
--Teri de Sario Acasuzo - https://www.linkedin.com/in/teri-de-sario-a-7352ba44/
--Carolina Martínez - https://www.linkedin.com/in/carolinamartinezaguirre/
--Vanessa Delgado - https://www.linkedin.com/in/vanedelgado/