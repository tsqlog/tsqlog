set nocount on
if objectproperty(object_id(N'[tlog_conf].[log_level]'),'IsTable') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating table [tlog_conf].[log_level]'
	---
	create table [tlog_conf].[log_level]
	(
		log_level_code char(50) not null
	,	int_level int not null
	,	is_active bit not null
	,	create_date datetime not null
	,	create_user nvarchar(128) not null
	,	modify_date datetime null
	,	modify_user nvarchar(128) null
	,	row_ver timestamp not null
	)
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created table [tlog_conf].[log_level]'
end
else
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists table [tlog_conf].[log_level]'
end
set nocount off
go

set nocount on
if objectproperty(object_id(N'[tlog_conf].[pk_log_level]'),'IsPrimaryKey') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating primary key [tlog_conf].[pk_log_level]'
	---
	alter table [tlog_conf].[log_level]
		add constraint [pk_log_level]
		primary key ([log_level_code])
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created primary key [tlog_conf].[pk_log_level]'
end
else 
begin
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists primary key [tlog_conf].[pk_log_level]'
end
set nocount off
go

set nocount on
if objectproperty(object_id(N'[tlog_conf].[df_tlog_log_level_create_date]'),'IsDefaultCnst') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating default constraint [tlog_conf].[df_log_level_create_date]'
	---
	alter table [tlog_conf].[log_level]
		add constraint df_tlog_log_level_create_date
		default (getdate())
		for [create_date]
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created default constraint [tlog_conf].[df_log_level_create_date]'
end
else
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists default constraint [tlog_conf].[df_log_level_create_date]'
set nocount off
go

set nocount on
if objectproperty(object_id(N'[tlog_conf].[df_tlog_log_level_create_user]'),'IsDefaultCnst') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating default constraint [tlog_conf].[df_log_level_create_user]'
	---
	alter table [tlog_conf].[log_level]
		add constraint df_tlog_log_level_create_user
		default (suser_sname())
		for [create_user]
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created default constraint [tlog_conf].[df_log_level_create_user]'
end
else
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists default constraint [tlog_conf].[df_log_level_create_user]'
set nocount off
go