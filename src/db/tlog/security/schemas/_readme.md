Direcory  ../tables is used to store sql script for:  
- create schema
- drop schema

Templates:
**create schema**  
to change (ctrl-h)  
schema_name
```
set nocount on
if not exists (select 1 from sys.schemas where name = '[schema_name]'
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: creating schema [schema_name]'
	---
	exec('create schema [schema_name]')
	---
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: created schema [schema_name]'
end
else 
begin
	print 'utc_time:' + convert(varchar(23), getutcdate(), 121) + ';time:' + convert(varchar(23),getdate(),121) + ';db:' + db_name() + ';user:' + suser_sname() + ';msg: exists schema [schema_name]'
end
set nocount off
```
