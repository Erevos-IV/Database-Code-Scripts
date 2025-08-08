-- using ANY to grant create permissions to all schemas to user
CREATE USER username IDENTIFIED BY pass;
GRANT CREATE SESSION TO username;
GRANT CREATE ANY TABLE TO username;

