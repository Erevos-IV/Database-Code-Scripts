
-- Create local user for a PDB
sqlplus sys/oracle@DBNAME as sysdba

-- User created without login and permissions.
CREATE USER Username IDENTIFIED BY PASSWORD;

-- Grant login action to the user and permissions
GRANT CREATE SESSION TO Username;
GRANT CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE TO Username;



-- Create common user and give permissions
CREATE USER c##Username IDENTIFIED BY PASSWORD;
GRANT CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE TO c##Username;



