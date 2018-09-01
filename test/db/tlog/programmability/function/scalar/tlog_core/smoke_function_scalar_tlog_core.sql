use tlog_test
go

exec tSQLt.NewTestClass 'smoke_function_scalar_tlog_core'
go
create procedure [smoke_function_scalar_tlog_core].[test_core.username_get]
as 
begin
	declare @result nvarchar(128)

	select @result = tlog_core.username_get(default)
end
go

exec tSQLt.Run 'smoke_function_scalar_tlog_core'
go