set nocount on
if objectproperty(object_id(N'[tlog_conf].[log_level_is_exists]'),'IsScalarFunction') IS NULL
begin
	exec (N'create function [tlog_conf].[log_level_is_exists] returns int as begin return null end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating function [tlog_conf].[log_level_is_exists]'
go
alter function [tlog_conf].[log_level_is_exists]
(
	@log_level_code char(50)
)
returns bit
as
begin
	return 
	(	select case 
			when exists (select 1 from tlog_conf.log_level where log_level_code = @log_level_code) then 1 
			else 0  
			end
	)
					
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created function [tlog_conf].[log_level_is_exists]'
go