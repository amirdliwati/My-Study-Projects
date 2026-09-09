connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool D:\oracle\app\admin\G01\scripts\ultraSearchCfg.log
alter user WKSYS account unlock identified by change_on_install;
@D:\oracle\app\product\11.1.0\db_1\ultrasearch\admin\wk0config.sql change_on_install (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=Mohannad-PC)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=G01))) false " ";
spool off
