Direcory  ../tables is used to store sql script for:  
- create table definition  
- drop table  
- create primary key definition  
- drop primary key  
- create foreign key definition  
- drop foreign key  
- default constraint definition  
- drop constraint  
- add/remove columns  

Templates:   
*ceate table definition* 
to change (ctrl-h)
schema_name
table_name
```
set nocount on
if objectproperty(object_id(N'[schema_name].[table_name]'),'IsTable') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating table [schema_name].[table_name]'
	---
	create table [schema_name].[table_name]
	(
		col1 int ...
	)
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created table [schema_name].[table_name]'
end
else
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists table [schema_name].[table_name]'
end
set nocount off
go
```
*drop table* 
to change (ctrl-h) 
[schema_name].[table_name] 
```
set nocount on
if objectproperty(object_id(N'[schema_name].[table_name]'),'IsTable') = 1
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: deleting table [schema_name].[table_name]'
	---
	drop table [schema_name].[table_name]
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: deleted table [schema_name].[table_name]'
end
else
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: not exists table [schema_name].[table_name]'
end
set nocount off
go
```
*create primary key definition*
to change (ctrl-h)
schema_name
table_name
column_name
```
set nocount on
if objectproperty(object_id(N'[schema_name].[pk_table_name]'),'IsPrimaryKey') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating primary key [schema_name].[pk_table_name]'
	---
	alter table [schema_name].[table_name]
		add constraint [pk_table_name]]
		primary key ([column_name])
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created primary key [schema_name].[pk_table_name]'
end
else 
begin
print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists primary key [schema_name].[pk_table_name]'
end
set nocount off
go
```

*create default constraint definition*
to change (ctrl-h)
schema_name
table_name
column_name
```
set nocount on
if objectproperty(object_id(N'[schema_name].[df_table_name_column_name]'),'IsDefaultCnst') IS NULL
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating default constraint [schema_name].[df_table_name_column_name]'
	---
	alter table [schema_name].[table_name]
		add constraint [df_tlog_table_name_column_name]
		default (...)
		for [column_name]
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created default constraint [schema_name].[df_table_name_column_name]'
end
else
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists default constraint [schema_name].[df_table_name_column_name]'
set nocount off
go
```