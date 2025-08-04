RMAN commands for full database backup.

-- Connect to a pluggable db: rman target=sys/oracle@dbname;
-- Connect to the instance:  rman target=/

-- Run full Oracle backup: backup database plus archivelog;
-- Backup the root container only: backup database root;
-- Backup pluggable database: backup pluggable database nameofdatabase;

-- Give name to backup files: backup database tag 'NameOfBackup' plus archivelog'


RMAN commands for incremental backup.

-- backup incremental level 0 database tag 'inc_level0; plus archivelog;
-- backup incremental level 1 database tag 'inc_level1; plus archivelog;
-- backup incremental level 1 cumulative database tag 'inc_level0; plus archivelog;

















