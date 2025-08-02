-- User accounts on SQL Server
CREATE LOGIN Bradley WITH PASSWORD = 'Brad1234'
CREATE USER Bradley FOR LOGIN Bradley;

-- Give Bradley schema level permissions using SQL Server administrator account
GRANT SELECT ON SCHEMA :: sales TO Bradley;


-- Remove permissions and delete Bradley's user account
REVOKE SELECT ON SCHEMA :: sales FROM Bradley;
DROP USER Bradley;
DROP LOGIN Bradley;

-- If needed, you can kill user sessions to drop a login
SELECT session_id
FROM sys.dm_exec_sessions
WHERE login_name = 'Bradley';
DROP LOGIN Bradley;
