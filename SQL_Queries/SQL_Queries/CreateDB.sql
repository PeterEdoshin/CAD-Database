CREATE DATABASE CAADSoftware
ON 
(
    NAME = CAADSoftware,
    FILENAME = '/var/opt/mssql/data/CAADSoftware.mdf',
    SIZE = 10MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = CAADSoftwareLogs,
    FILENAME = '/var/opt/mssql/data/CAADSoftware.ldf',
    SIZE = 5MB,
    MAXSIZE = 512MB,
    FILEGROWTH = 1MB
)
COLLATE Cyrillic_General_100_CS_AS;


