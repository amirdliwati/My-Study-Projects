set verify off
PROMPT specify a password for sys as parameter 1;
DEFINE sysPassword = &1
PROMPT specify a password for system as parameter 2;
DEFINE systemPassword = &2
PROMPT specify a password for sysman as parameter 3;
DEFINE sysmanPassword = &3
PROMPT specify a password for dbsnmp as parameter 4;
DEFINE dbsnmpPassword = &4
host D:\oracle\app\product\11.1.0\db_1\bin\orapwd.exe file=D:\oracle\app\product\11.1.0\db_1\database\PWDG01.ora password=&&sysPassword force=y
@D:\oracle\app\admin\G01\scripts\CloneRmanRestore.sql
@D:\oracle\app\admin\G01\scripts\cloneDBCreation.sql
@D:\oracle\app\admin\G01\scripts\postScripts.sql
@D:\oracle\app\admin\G01\scripts\ultraSearchCfg.sql
@D:\oracle\app\admin\G01\scripts\lockAccount.sql
@D:\oracle\app\admin\G01\scripts\postDBCreation.sql
