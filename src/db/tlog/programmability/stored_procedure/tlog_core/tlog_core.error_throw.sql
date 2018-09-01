set nocount on
if objectproperty(object_id(N'[tlog_core].[error_throw]'),'IsProcedure') IS NULL
begin
	exec (N'create procedure [tlog_core].[error_throw] as begin print ''initial version of [tlog_core].[error_throw]'' end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating procedure [tlog_core].[error_throw]'
go
alter procedure [tlog_core].[error_throw]
(
	@error_message varchar(2048) = null
)
as
begin
	set nocount on

	declare @v_error_message varchar(2048) 
	declare @v_error_severity int
	declare @v_error_state int	

	select  @v_error_message = 'msg:' + error_message() + ';line:' + cast(error_line() as varchar) 
		,	@v_error_severity = error_severity()
		,	@v_error_state = error_state()	
	where	@error_message is null

	select  @v_error_message = 'msg:' + @error_message + ';line:' + cast(error_line() as varchar) 
		,	@v_error_severity = 16
		,	@v_error_state = error_state()	
	where	@error_message is not null

	raiserror(@v_error_message,@v_error_severity,@v_error_severity)

	return 0
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created procedure [tlog_core].[error_throw]'
go