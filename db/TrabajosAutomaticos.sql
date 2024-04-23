--------Respaldo de la base de datos

USE [msdb]
GO

/****** Object:  Job [RespaldoAutoTiendaOnline]    Script Date: 21/4/2024 17:07:09 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 21/4/2024 17:07:09 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'RespaldoAutoTiendaOnline', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PanDulce68\arias', @job_id = @jobId OUTPUT ----cambiar nombre por tu servidor
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [First]    Script Date: 21/4/2024 17:07:10 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'First', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BACKUP DATABASE Tienda_Online TO DISK = ''C:\trabajosauto\tiendaonliine.bak''; ', -------cambiar a donde lo queres guardar, HACER UNA CARPETA EN C PARA GUARDAR SI NO NO SIRVE!
		@database_name=N'Tienda_Online', 
		@output_file_name=N'C:\trabajosauto\TiendaOnline', ----CAMBIAR NOMBRE
		@flags=2
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'SCHE1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=9, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20240421, 
		@active_end_date=99991231, 
		@active_start_time=800, 
		@active_end_time=235959, 
		@schedule_uid=N'64aa37d7-df8e-42a0-b710-f76bf564c754'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO
------------------
USE msdb;  
GO  
EXEC dbo.sp_start_job N'RespaldoAutoTiendaOnline';  
GO
---------------------------------------------------------
-----------------------------------


USE [msdb]
GO

/****** Object:  Job [SPDINVENTORYMAX]    Script Date: 22/4/2024 15:35:18 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 22/4/2024 15:35:18 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'SPDINVENTORYMAX', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PanDulce68\arias', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execution of stored procedure]    Script Date: 22/4/2024 15:35:19 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execution of stored procedure', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC SP_AddInventoryToMax;
', 
		@database_name=N'Tienda_Online', 
		@output_file_name=N'C:\trabajosauto\ExecSPD', ------cambiar
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'SCHE1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=9, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20240421, 
		@active_end_date=99991231, 
		@active_start_time=800, 
		@active_end_time=235959, 
		@schedule_uid=N'64aa37d7-df8e-42a0-b710-f76bf564c754'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


USE msdb;  
GO  
EXEC dbo.sp_start_job N'SPDINVENTORYMAX';  
GO
-------------------------------------------------
-------------------------------------------------
USE [msdb]
GO

/****** Object:  Job [JOBINTEGIRYSTATS]    Script Date: 22/4/2024 21:34:18 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 22/4/2024 21:34:18 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'JOBINTEGIRYSTATS', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Tarea automática para actualizar estadísticas e ingridad de la base de datos.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PanDulce68\arias', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [CheckingIntegrity]    Script Date: 22/4/2024 21:34:18 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'CheckingIntegrity', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DBCC CHECKDB;', 
		@database_name=N'Tienda_Online', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [StatsUpdate]    Script Date: 22/4/2024 21:34:18 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'StatsUpdate', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC sp_updatestats;', 
		@database_name=N'Tienda_Online', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'UPDATESCHE', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=65, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20240422, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'a646e390-ed31-4df0-b7be-20cb77a99da4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

USE msdb;  
GO  
EXEC dbo.sp_start_job N'JOBINTEGIRYSTATS';  
GO


USE [msdb]
GO

/****** Object:  Job [DROPANDCREATEVIEWS]    Script Date: 22/4/2024 21:34:56 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 22/4/2024 21:34:56 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DROPANDCREATEVIEWS', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PanDulce68\arias', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Drop]    Script Date: 22/4/2024 21:34:56 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Drop', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=30, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'if exists(select 1 from sys.views where name=''VWPurchaseSummaryByYearMonth'' and type=''v'')
drop view VWPurchaseSummaryByYearMonth;
go

if exists(select 1 from sys.views where name=''VWProductSalesBySector'' and type=''v'')
drop view VWProductSalesBySector;
go

if exists(select 1 from sys.views where name=''VWCOSTUMERACTIVITY'' and type=''v'')
drop view VWCOSTUMERACTIVITY;
go
', 
		@database_name=N'Tienda_Online', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [CreateVWS]    Script Date: 22/4/2024 21:34:56 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'CreateVWS', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'CREATE VIEW VWPurchaseSummaryByYearMonth AS
SELECT YEAR(p.PurchaseDate) AS Year,
       MONTH(p.PurchaseDate) AS Month,
       pr.ProductName,
       SUM(pe.Quantity) AS TotalQuantity,
       SUM(pe.Quantity * pr.Price) AS TotalAmount
FROM Purchases p
JOIN ProductsXFactura pxf ON p.PurchaseID = pxf.ProductId
JOIN Products pr ON pxf.ProductID = pr.ProductID
JOIN ProductEntries pe ON pr.ProductID = pe.ProductID
GROUP BY YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), pr.ProductName;
GO


CREATE VIEW VWProductSalesBySector AS
SELECT 
    YEAR(p.PurchaseDate) AS Year,
    MONTH(p.PurchaseDate) AS Month,
    c.CategoryId,
    cu.Canton,
    cu.District,
    SUM(p.TotalPurchase) AS TotalSales
FROM 
    Purchases p
JOIN 
    Costumers cu ON p.UserId = cu.ID
JOIN 
    Ids i ON cu.ID = i.Identification
JOIN 
    Categories c ON p.PurchaseID = c.CategoryID
GROUP BY 
    YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), c.CategoryId, cu.Canton, cu.District;
GO

Create view VWCOSTUMERACTIVITY AS
SELECT
P.UserId,
COUNT(*) AS TotalCompras,
AVG(P.Totalpurchase) AS PromedioCompra,
SUM(P.Totalpurchase) AS GastoTotal,
MIN(P.Purchasedate) AS PrimeraCompra,
MAX(P.Purchasedate) AS UltimaCompra
FROM
    Purchases P
GROUP BY
    P.UserId;
GO', 
		@database_name=N'Tienda_Online', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'UPDATESCHE', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=65, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20240422, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'a646e390-ed31-4df0-b7be-20cb77a99da4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


USE msdb;  
GO  
EXEC dbo.sp_start_job N'DROPANDCREATEVIEWS';  
GO