set nocount on
if objectproperty(object_id(N'[tlog_conf].[log_level_set]'),'IsProcedure') IS NULL
begin
	exec (N'create procedure [tlog_conf].[log_level_set] as begin print ''initial version of [tlog_conf].[log_level_set]'' end')
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating procedure [tlog_conf].[log_level_set]'
go
alter procedure [tlog_conf].[log_level_set]
(
	@param1 int 
)
as
begin
	set nocount on

	return 0
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created procedure [tlog_conf].[log_level_set]'
go