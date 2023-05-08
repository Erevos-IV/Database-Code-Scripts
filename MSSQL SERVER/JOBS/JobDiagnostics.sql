select j.name
    ,js.step_name
    ,jh.sql_severity
    ,jh.message
    ,jh.run_date
    ,jh.run_time
FROM msdb.dbo.sysjobs AS j
INNER JOIN msdb.dbo.sysjobsteps AS js
   ON js.job_id = j.job_id
INNER JOIN msdb.dbo.sysjobhistory AS jh
   ON jh.job_id = j.job_id AND jh.step_id = js.step_id
WHERE jh.run_status = 0
AND run_date > '20230502'
