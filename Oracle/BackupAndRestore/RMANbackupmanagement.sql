OBSOLETE Backups (No longer needed for recovery based on configuration)

-- show all

-- report obsolete; 

-- delete obsolete; 


EXPIRED Backups (Not found in the directory where RMAN is looking for it)

Validate all backups are there:
-- crosscheck backup;

List expired backups
-- list expired backup;



Manually Delete Backup Sets
-- list backup of database NameOfDB;
-- delete noprompt backupset 122;    (NOPROMPT= no confirmation)













