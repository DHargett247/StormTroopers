/*
Stormtrooper Java Database
Created by Gene Locklear
March 8, 2018
*/

SELECT 'This is the starting script for our master database' AS 'Professors Locklear Message';

SELECT SLEEP(2) AS 'LOADING....';

DROP DATABASE IF EXISTS stormtrooper_java;
CREATE DATABASE IF NOT EXISTS stormtrooper_java;
USE stormtrooper_java;

CREATE TABLE imperial_battlegroup(
BGID CHAR(5) NOT NULL,
Designation VARCHAR(25) NOT NULL,
HQ_LocationX INT NOT NULL,
HQ_LocationY INT NOT NULL,
CONSTRAINT pk_ibg PRIMARY KEY(BGID)
);

SELECT 'Imperial Battle Groups Created' AS MSG;


CREATE TABLE stormtrooper_unit(
STUID CHAR(10) NOT NULL,
UnitCmd CHAR(5) NOT NULL,
UnitType ENUM('Infantry','Aslt Infantry','Reconnaissance') NOT NULL DEFAULT 'Infantry',
AssignedStrength INT NOT NULL DEFAULT 100,
Location_X INT NOT NULL,
Location_Y INT NOT NULL,
CONSTRAINT pk_stu PRIMARY KEY(STUID),
CONSTRAINT fk_stu FOREIGN KEY(UnitCmd) REFERENCES imperial_battlegroup(BGID)
);

SELECT 'Stormtrooper Units Created' AS MSG;


CREATE TABLE stormtroopers_officer(
STID CHAR(6) NOT NULL,
Rank ENUM('LT','CAPT','CMDR') NOT NULL,
Gender ENUM('Male','Female') NOT NULL DEFAULT  'Male',
ServiceYears INT NOT NULL DEFAULT 3,
Height INT NOT NULL DEFAULT 76,
Weight INT NOT NULL DEFAULT 215,
DutyCategory ENUM('Active','Reserve') NOT NULL DEFAULT 'Active',
DutyStatus ENUM('Full Duty','Wounded','Killed') NOT NULL DEFAULT 'Full Duty',
CONSTRAINT pk_stoff PRIMARY KEY(STID)
);

SELECT 'Stormtrooper Officers Created' AS MSG;

CREATE TABLE st_officer_assign(
STID CHAR(6) NOT NULL,
STUID CHAR(10) NOT NULL,
Role ENUM('Trooper','Communications','Medical','Demolitions','Scout','Assault') NOT NULL DEFAULT 'Trooper',
CONSTRAINT pk_sto_assign PRIMARY KEY(STID),
CONSTRAINT fk_sto_assign1 FOREIGN KEY(STID) REFERENCES stormtroopers_officer(STID),
CONSTRAINT fk_sto_assign2 FOREIGN KEY(STUID) REFERENCES stormtrooper_unit(STUID)
);

SELECT 'Stormtrooper Officer Assignments Created' AS MSG;

CREATE TABLE stormtroopers_nco(
STID CHAR(6) NOT NULL,
Rank ENUM('CPL','SGT','MSGT') NOT NULL,
Gender ENUM('Male','Female') NOT NULL DEFAULT  'Male',
ServiceYears INT NOT NULL DEFAULT 3,nu
Height INT NOT NULL DEFAULT 76,
Weight INT NOT NULL DEFAULT 215,
DutyCategory ENUM('Active','Reserve') NOT NULL DEFAULT 'Active',
DutyStatus ENUM('Full Duty','Wounded','Killed') NOT NULL DEFAULT 'Full Duty',
CONSTRAINT pk_stnco PRIMARY KEY(STID)
);

SELECT 'Stormtrooper NCOs Created' AS MSG;

CREATE TABLE st_nco_assign(
STID CHAR(6) NOT NULL,
STUID CHAR(10) NOT NULL,
Role ENUM('Trooper','Communications','Medical','Demolitions','Scout','Assault') NOT NULL DEFAULT 'Trooper',
CONSTRAINT pk_stnco_assign PRIMARY KEY(STID),
CONSTRAINT fk_stnco_assign1 FOREIGN KEY(STID) REFERENCES stormtroopers_nco(STID),
CONSTRAINT fk_stnco_assign2 FOREIGN KEY(STUID) REFERENCES stormtrooper_unit(STUID)
);

SELECT 'Stormtrooper NCO Assignments Created' AS MSG;

CREATE TABLE stormtroopers_troop(
STID CHAR(6) NOT NULL,
Rank ENUM('TRPR','SP') NOT NULL,
Gender ENUM('Male','Female') NOT NULL DEFAULT 'Male',
ServiceYears INT NOT NULL DEFAULT 1,
Height INT NOT NULL DEFAULT 76,
Weight INT NOT NULL DEFAULT 215,
DutyCategory ENUM('Active','Reserve') NOT NULL DEFAULT 'Active',
DutyStatus ENUM('Full Duty','Wounded','Killed') NOT NULL DEFAULT 'Full Duty',
CONSTRAINT pk_sttrp PRIMARY KEY(STID)
);

SELECT 'Stormtrooper Troops Created' AS MSG;

CREATE TABLE st_troop_assign(
STID CHAR(6) NOT NULL,
STUID CHAR(10) NOT NULL,
Role ENUM('Trooper','Communications','Medical','Demolitions','Scout','Assault') NOT NULL DEFAULT 'Trooper',
CONSTRAINT pk_sttroop_assign PRIMARY KEY(STID),
CONSTRAINT fk_sttroop_assign1 FOREIGN KEY(STID) REFERENCES stormtroopers_troop(STID),
CONSTRAINT fk_sttroop_assign2 FOREIGN KEY(STUID) REFERENCES stormtrooper_unit(STUID)
);

SELECT 'Stormtrooper Troop Assignments Created' AS MSG;

CREATE TABLE imperial_walker_type(
WTypeID CHAR(2) NOT NULL,
WType CHAR(5) NOT NULL,
Height INT NOT NULL,
Length INT NOT NULL,
Width INT NOT NULL,
Weight INT NOT NULL,
Crew INT NOT NULL,
TroopCapacity INT NOT NULL,
MaximumSpeed INT NOT NULL,
OpRange INT NOT NULL,
CONSTRAINT pk_iwt PRIMARY KEY(WTypeID),
CONSTRAINT uk_iwt UNIQUE KEY(WType)
);

CREATE TABLE walker_units(
WUID CHAR(6) NOT NULL,
BattleGroup CHAR(5) NOT NULL,
Location_X INT NOT NULL,
Location_Y INT NOT NULL,
CONSTRAINT pk_wu PRIMARY KEY(WUID),
CONSTRAINT fk_wu1 FOREIGN KEY(BattleGroup) REFERENCES imperial_battlegroup(BGID)
);

CREATE TABLE imperial_walkers_assign(
WID CHAR(6) NOT NULL,
WUID CHAR(6) NOT NULL,
WalkerType CHAR(5) NOT NULL,
Status ENUM('Operational','Damaged','Destroyed') NOT NULL,
CONSTRAINT pk_iw PRIMARY KEY(WID),
CONSTRAINT fk_iw1 FOREIGN KEY(WUID) REFERENCES walker_units(WUID),
CONSTRAINT fk_iw2 FOREIGN KEY(WalkerType) REFERENCES imperial_walker_type(WType)
);

SELECT 'Transferring to Troop Data Script' AS MSG;

source C:\\Users\\Epinesis_\\Downloads\\trooperData.sql;

