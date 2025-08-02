-- View a list of roles with login permission
Select *
FROM pg_user;

-- View permissions for a specific role
SELECT * 
FROM information_schema.role_table_grants
WHERE grantee = 'username';

-- View Permissions Grouped
Select grantee,
       table_catalog,
       table_schema, 
       table_name
       string_agg(privilege_type, ', ', ORDER BY privilege_type) AS privileges
FROM information_schema.role_table_grants
WHERE grantee = 'username'
GROUP BY grantee, table_catalog, table_schema, table_name;
