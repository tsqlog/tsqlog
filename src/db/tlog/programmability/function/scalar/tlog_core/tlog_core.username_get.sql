set nocount on
if objectproperty(object_id(N'[tlog_core].[username_get]'),'IsScalarFunction') IS NULL
begin
	exec (N'create function [tlog_core].[username_get]() returns int as begin return null end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating function [tlog_core].[username_get]'
go
alter function [tlog_core].[username_get]
(
	@user_name nvarchar(128) = null
)
returns nvarchar(128)
as
begin
	return 
	(	select isnull(@user_name, suser_sname())
	)
					
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created function [tlog_core].[username_get]'
go