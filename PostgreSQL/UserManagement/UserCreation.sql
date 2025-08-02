-- User accounts on PostgreSQL
CREATE ROLE samantha WITH LOGIN PASSWORD 'sam123';
GRANT USAGE ON SCHEMA inventory TO samantha;

GRANT SELECT, INSERT, UPDATE, DELETE -- or use ALL PRIVILEGES
ON ALL TABLES IN SCHEMA inventory 
TO samantha;

-- Remove permissions and delete Samantha's user account
REVOKE ALL PRIVILEGES ON SCHEMA inventory FROM samantha;
REVOKE USAGE ON SCHEMA inventory FROM samantha;
DROP OWNED BY samantha;
DROP ROLE samantha;
