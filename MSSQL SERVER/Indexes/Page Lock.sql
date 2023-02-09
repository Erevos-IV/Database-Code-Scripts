SELECT
    objects.name AS Table_name,
    indexes.name AS Index_name,
    --dm_db_index_usage_stats.user_seeks,
    --dm_db_index_usage_stats.user_scans,
    --dm_db_index_usage_stats.user_updates,
    indexes.type_desc,
    indexes.type ,
    indexes.is_disabled,
    indexes.allow_page_locks,
	--*
    'ALTER INDEX [' + indexes.name +'] ON [dbo].[' + objects.name + '] SET ( ALLOW_PAGE_LOCKS = OFF )' as SCRIPT
FROM
    sys.dm_db_index_usage_stats
    INNER JOIN sys.objects ON dm_db_index_usage_stats.OBJECT_ID = objects.OBJECT_ID
    INNER JOIN sys.indexes ON indexes.index_id = dm_db_index_usage_stats.index_id AND dm_db_index_usage_stats.OBJECT_ID = indexes.OBJECT_ID
WHERE indexes.allow_page_locks = 1 and indexes.type <> 0
ORDER BY objects.name 
--dm_db_index_usage_stats.user_updates DESC

GO


