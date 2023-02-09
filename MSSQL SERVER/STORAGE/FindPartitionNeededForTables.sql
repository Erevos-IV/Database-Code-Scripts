SELECT TABLE_NAME x, i.COLUMN_NAME, DATA_TYPE, DATETIME_PRECISION, *
FROM INFORMATION_SCHEMA.COLUMNS i inner join

( SELECT
       sOBJ.name AS [TableName]
      , SUM(sdmvPTNS.row_count) AS [RowCount]
FROM
      sys.objects AS sOBJ
      INNER JOIN sys.dm_db_partition_stats AS sdmvPTNS
            ON sOBJ.object_id = sdmvPTNS.object_id
WHERE 
      sOBJ.type = 'U'
      AND sOBJ.is_ms_shipped = 0x0
      AND sdmvPTNS.index_id < 2
	  AND QUOTENAME(sOBJ.name)  not like 'MG%'
GROUP BY
      sOBJ.schema_id
      , sOBJ.name
HAVING  SUM(sdmvPTNS.row_count)>0) X
ON i.TABLE_NAME = X.TableName
WHERE 
     TABLE_SCHEMA = 'dbo' 
	 and DATA_TYPE = 'datetime2'
	 and DATETIME_PRECISION = 6


	 order by TABLE_NAME

 SELECT
       sOBJ.name AS [TableName]
      , SUM(sdmvPTNS.row_count) AS [RowCount], MAX(p.partition_number)
FROM
      sys.objects AS sOBJ
      INNER JOIN sys.dm_db_partition_stats AS sdmvPTNS
            ON sOBJ.object_id = sdmvPTNS.object_id
	  INNER JOIN [sys].[partitions] AS [p] on sOBJ.object_id= p.object_id
WHERE 
      sOBJ.type = 'U'
      AND sOBJ.is_ms_shipped = 0x0
      AND sdmvPTNS.index_id < 2
	  AND QUOTENAME(sOBJ.name)  not like 'MG%'
	  
GROUP BY
      sOBJ.schema_id
      , sOBJ.name
HAVING  SUM(sdmvPTNS.row_count)>0 and MAX(p.partition_number)=1
ORDER BY [TableName]
GO
