RMAN Backup the redo logs 
-- rman target =/
-- backup archivelog all; 
-- list backup of archivelog all;

RMAN Delete backup archiveredo logs
-- delete noprompt backup of archivelog all;
