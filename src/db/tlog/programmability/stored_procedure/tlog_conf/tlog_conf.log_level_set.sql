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
	@log_level_code char(50)
,	@int_level int
,	@is_active bit 
,	@user_name nvarchar(128) = null
)
as
begin
	set nocount on

	select	@user_name = tlog_core.username_get(@user_name)

	update	l
	set		l.int_level = @int_level
		,	l.is_active = @is_active
		,	l.modify_user = @user_name
		,	l.modify_date = getdate()
	from	tlog_conf.log_level l
	where	l.log_level_code = @log_level_code
	and		(l.int_level != @int_level or l.is_active != @is_active)	
	
	insert 
	into	tlog_conf.log_level(log_level_code,int_level,is_active,create_date,create_user,modify_date,modify_user)
	select	@log_level_code, @int_level, @is_active, getdate(), @user_name, getdate(), @user_name
	where	not exists ( select 1 from tlog_conf.log_level where log_level_code = @log_level_code )
	
end
go
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created procedure [tlog_conf].[log_level_set]'
go

