connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool D:\oracle\app\admin\G01\scripts\CloneRmanRestore.log
startup nomount pfile="D:\oracle\app\admin\G01\scripts\init.ora";
@D:\oracle\app\admin\G01\scripts\rmanRestoreDatafiles.sql;
