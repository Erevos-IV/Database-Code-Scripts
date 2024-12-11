-- Test Whether You Set Up Your Table in the Right Place with the Right Name
select count(*) as OBJECTS_FOUND
from <database name>.INFORMATION_SCHEMA.TABLES 
where table_schema=<schema name> 
and table_name= <table name>;

-- Test That You Loaded the Expected Number of Rows
select row_count
from <database name>.INFORMATION_SCHEMA.TABLES 
where table_schema=<schema name> 
and table_name= <table name>;
