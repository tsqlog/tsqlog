set nocount on

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'OFF', 0 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'OFF')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added OFF to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'FATAL', 100 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'FATAL')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added FATAL to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'ERROR', 200 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'ERROR')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added ERROR to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'WARN', 300 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'WARN')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added WARN to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'INFO', 400 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'INFO')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added INFO to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'DEBUG', 500 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'DEBUG')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added DEBUG to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'TRACE', 600 , 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'TRACE')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added TRACE to [tlog_conf].[log_level]'
go

insert into [tlog_conf].[log_level]([log_level_code],[int_level],[is_active],[create_date],[create_user],[modify_date],[modify_user])
select 'ALL', 2147483647, 1, GETDATE(), SUSER_SNAME(), GETDATE(), SUSER_SNAME() 
where not exists (select 1 from [tlog_conf].[log_level] where [log_level_code] = 'ALL')
if @@rowcount != 0 
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: Added ALL to [tlog_conf].[log_level]'
go