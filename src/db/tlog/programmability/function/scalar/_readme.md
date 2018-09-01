set nocount on
if objectproperty(object_id(N'[schema_name].[function_name]'),'IsScalarFunction') IS NULL
begin
	exec (N'create function [schema_name].[function_name]() returns int as begin return null end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating procedure [schema_name].[function_name]'
go
alter function [schema_name].[function_name]
(
	@param1 int ...
)
returns int
as
begin
	return 0
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created procedure [schema_name].[function_name]'
go