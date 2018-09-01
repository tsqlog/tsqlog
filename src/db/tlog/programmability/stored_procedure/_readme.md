set nocount on
if objectproperty(object_id(N'[schema_name].[procedure_name]'),'IsProcedure') IS NULL
begin
	exec (N'create procedure [schema_name].[procedure_name] as begin print ''initial version of [schema_name].[procedure_name]'' end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating procedure [schema_name].[procedure_name]'
go
alter procedure [schema_name].[procedure_name]
(
	@param1 int ...
)
as
begin
	set nocount on

	return 0
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created procedure [schema_name].[procedure_name]'
go