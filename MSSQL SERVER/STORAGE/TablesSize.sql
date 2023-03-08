-- list all tables by RowCount and SIZE

SELECT 
    t.NAME AS TableName,
    p.rows AS RowCounts,
    CAST(SUM(a.total_pages) / 1024.00 / 1024.00 AS NUMERIC(18, 2)) AS TableSizeInGB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.NAME NOT LIKE 'sys%' AND 
    t.is_ms_shipped = 0 AND 
    i.OBJECT_ID > 255
GROUP BY 
    t.Name, p.Rows
ORDER BY 
    TableSizeInGB DESC, RowCounts DESC
