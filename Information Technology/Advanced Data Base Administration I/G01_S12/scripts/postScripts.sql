connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool D:\oracle\app\admin\G01\scripts\postScripts.log
@D:\oracle\app\product\11.1.0\db_1\rdbms\admin\dbmssml.sql;
execute dbms_datapump_utl.replace_default_dir;
commit;
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set current_schema=ORDSYS;
@D:\oracle\app\product\11.1.0\db_1\ord\im\admin\ordlib.sql;
alter session set current_schema=SYS;
connect "SYS"/"&&sysPassword" as SYSDBA
connect "SYS"/"&&sysPassword" as SYSDBA
alter user CTXSYS account unlock identified by change_on_install;
connect "CTXSYS"/"change_on_install"
@D:\oracle\app\product\11.1.0\db_1\ctx\admin\defaults\dr0defdp.sql;
@D:\oracle\app\product\11.1.0\db_1\ctx\admin\defaults\dr0defin.sql "ARABIC";
connect "SYS"/"&&sysPassword" as SYSDBA
execute ORACLE_OCM.MGMT_CONFIG_UTL.create_replace_dir_obj;
spool off
