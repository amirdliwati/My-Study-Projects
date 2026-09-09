connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool D:\oracle\app\admin\G01\scripts\postDBCreation.log
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='D:\oracle\app\product\11.1.0\db_1\database\spfileG01.ora' FROM pfile='D:\oracle\app\admin\G01\scripts\init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
alter user SYSMAN identified by "&&sysmanPassword" account unlock;
alter user DBSNMP identified by "&&dbsnmpPassword" account unlock;
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute dbms_swrf_internal.cleanup_database(cleanup_local => FALSE);
commit;
host D:\oracle\app\product\11.1.0\db_1\bin\emca.bat -config dbcontrol db -silent -DB_UNIQUE_NAME G01 -PORT 1521 -EM_HOME D:\oracle\app\product\11.1.0\db_1 -LISTENER LISTENER -SERVICE_NAME G01 -SYS_PWD &&sysPassword -SID G01 -ORACLE_HOME D:\oracle\app\product\11.1.0\db_1 -DBSNMP_PWD &&dbsnmpPassword -HOST Mohannad-PC -LISTENER_OH D:\oracle\app\product\11.1.0\db_1 -LOG_FILE D:\oracle\app\admin\G01\scripts\emConfig.log -SYSMAN_PWD &&sysmanPassword;
connect "SYS"/"&&sysPassword" as SYSDBA
spool D:\oracle\app\admin\G01\scripts\postDBCreation.log
