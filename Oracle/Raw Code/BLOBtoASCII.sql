-- THIS IS HOW TO GET THE FIRST 4000 LETTERS IN A BLOB TO ASCII TEXT IN A SINGLE COLUMN.
-- IF YOU NEED MORE THAN THAT, THEN ADD ONE MORE COLUMN LIKE BELOW.

SELECT (utl_raw.cast_to_VARCHAR2(dbms_lob.substr(Column_Name), 2000, 1)) ||    -- Column NAME, NUMBER, position
	utl_raw.cast_to_VARCHAR2(dbms_lob.substr(Column_Name), 2000, 2001)))        
from (TABLE_NAME)
