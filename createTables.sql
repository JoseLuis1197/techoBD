-- create database techobddev;
use techobddev;

DROP TABLE IF EXISTS tbl_user,tbl_video,tbl_user_video,tbl_speaker;

CREATE TABLE tbl_user (
    iId INT NOT NULL AUTO_INCREMENT,
    sUserEmail nvarchar(100) unique,
    sDNI nvarchar(10) unique,
    bIsEnterprise BOOLEAN NOT NULL,
    bIsDataTreatment BOOLEAN NOT NULL,
    sPassword NVARCHAR(30),
    sFullName NVARCHAR(100),
    PRIMARY KEY (iId)
);


ALTER TABLE tbl_user ADD sToken varchar(8) after sFullName;

create table tbl_video(
	iId int not null auto_increment,
    sName nvarchar(50) not null,
    sDescription nvarchar(100),
    sConditions nvarchar(2000),
    sSpeaker nvarchar(100),
    sTiming nvarchar(20),
    sAddress nvarchar(100) not null,
    sVideoType nvarchar(1) not null,
    primary key (iId)
);

create table tbl_user_video(
	iId int not null auto_increment,
    iIdUser int,
    iIdVideo int,
    sIsWatched boolean default false,
    dDate datetime,
    foreign key (iIdUser) references tbl_user(iId),
    foreign key (iIdVideo) references tbl_video(iId),
    primary key (iId)
);

CREATE Table tbl_speaker(
    iId int not null AUTO_INCREMENT,
    sFullName nvarchar(50) not null,
    sLinkedInUrl varchar(100),
    sImageUrl varchar(100),
    PRIMARY KEY (iId)
);