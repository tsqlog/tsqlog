use tlog_test
go

exec tSQLt.NewTestClass 'smoke_function_scalar_tlog_conf'
go
create procedure [smoke_function_scalar_tlog_conf].[test_log_level_is_exists]
as 
begin
	declare @result bit

	select @result = tlog_conf.log_level_is_exists(default)
end
go

exec tSQLt.Run 'smoke_function_scalar_tlog_conf'
go