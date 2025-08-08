-- Connect to the PDB
sqlplus sys/oracle@orcl as sysdba
-- Create a role Sales
create role sales;
-- Grant create session to the role
grant create session to sales;
-- Grant select to User2 to Sales role
grant select on user2.my_data to sales;
-- Create a second user
create user sales_user1 identified by secret;
-- Grant Role to a user
grant sales to sales_user1;
