/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000
dm_mid.database_id AS DatabaseID,
dm_migs.avg_user_impact*(dm_migs.user_seeks+dm_migs.user_scans) Avg_Estimated_Impact,
dm_migs.last_user_seek AS Last_User_Seek,
OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id) AS [TableName],
'CREATE INDEX [IX_' + OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id) + '_'
+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.equality_columns,''),', ','_'),'[',''),']','') 
+ CASE
WHEN dm_mid.equality_columns IS NOT NULL
AND dm_mid.inequality_columns IS NOT NULL THEN '_'
ELSE ''
END
+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.inequality_columns,''),', ','_'),'[',''),']','')
+ ']'
+ ' ON ' + dm_mid.statement
+ ' (' + ISNULL (dm_mid.equality_columns,'')
+ CASE WHEN dm_mid.equality_columns IS NOT NULL AND dm_mid.inequality_columns 
IS NOT NULL THEN ',' ELSE
'' END
+ ISNULL (dm_mid.inequality_columns, '')
+ ')'
+ ISNULL (' INCLUDE (' + dm_mid.included_columns + ')', '') AS Create_Statement
FROM sys.dm_db_missing_index_groups dm_mig
INNER JOIN sys.dm_db_missing_index_group_stats dm_migs
ON dm_migs.group_handle = dm_mig.index_group_handle
INNER JOIN sys.dm_db_missing_index_details dm_mid
ON dm_mig.index_handle = dm_mid.index_handle
WHERE dm_mid.database_ID = DB_ID()
--and dm_migs.avg_user_impact*(dm_migs.user_seeks+dm_migs.user_scans) >1000
--and OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id)='DEP_TRX_RECORDING'
order by
--4,
--3 desc,
Avg_Estimated_Impact DESC

/*
SELECT DISTINCT TOP 20
est.TEXT AS QUERY ,
Db_name(dbid),
eqs.execution_count AS EXEC_CNT,
eqs.max_elapsed_time AS MAX_ELAPSED_TIME,
ISNULL(eqs.total_elapsed_time / NULLIF(eqs.execution_count,0), 0) AS AVG_ELAPSED_TIME,
eqs.creation_time AS CREATION_TIME,
ISNULL(eqs.execution_count / NULLIF(DATEDIFF(s, eqs.creation_time, GETDATE()),0), 0) AS EXEC_PER_SECOND,
total_physical_reads AS AGG_PHYSICAL_READS
FROM sys.dm_exec_query_stats eqs
CROSS APPLY sys.dm_exec_sql_text( eqs.sql_handle ) est
ORDER BY
--eqs.max_elapsed_time DESC
creation_time desc



			

					
select db_name(t1.database_id) as database_name, 
t1.inequality_columns,t1.included_columns,t1.statement as table_name,(select max(rowcnt) from sysindexes 
where id=t1.object_id and status in (0, 2066) ) as [rowcount] , t2.user_seeks,t2.last_user_seek,t2.last_user_scan,t2.avg_total_user_cost,t2.avg_user_impact, 
'CREATE INDEX idx_DBO_'+REPLACE(REPLACE(REPLACE(statement,'[',''),']',''),'.','_')+CONVERT(VARCHAR,t1.index_handle)+'E ON '+statement+'('+equality_columns+') '+
CASE WHEN included_columns IS NOT NULL THEN 'INCLUDE( '+ISNULL(included_columns,'')+') ' ELSE '' END as [Equality] , 
'CREATE INDEX idx_DBO_'+REPLACE(REPLACE(REPLACE(statement,'[',''),']',''),'.','_')+CONVERT(VARCHAR,t1.index_handle)+'I ON '+statement+'('+inequality_columns+') '+
CASE WHEN included_columns IS NOT NULL THEN 'INCLUDE( '+ISNULL(included_columns,'')+') ' ELSE '' END as [InEquality] from sys.dm_db_missing_index_details t1 
WITH (NOLOCK) inner join sys.dm_db_missing_index_groups t0 WITH (NOLOCK) on t1.index_handle=t0.index_handle INNER JOIN sys.dm_db_missing_index_group_stats t2 
WITH (NOLOCK) ON t0.index_group_handle=t2.group_handle where database_id = Db_id() and
user_seeks > 10 order by avg_user_impact desc, user_seeks desc, user_scans desc, last_user_seek desc

*/

