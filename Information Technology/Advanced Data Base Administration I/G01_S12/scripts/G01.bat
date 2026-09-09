mkdir D:\oracle\app\admin\G01\adump
mkdir D:\oracle\app\admin\G01\dpdump
mkdir D:\oracle\app\admin\G01\pfile
mkdir D:\oracle\app\cfgtoollogs\dbca\G01
mkdir D:\oracle\app\flash_recovery_area
mkdir D:\oracle\app\oradata\G01
mkdir D:\oracle\app\product\11.1.0\db_1\database
set ORACLE_SID=G01
set PATH=%ORACLE_HOME%\bin;%PATH%
D:\oracle\app\product\11.1.0\db_1\bin\oradim.exe -new -sid G01 -startmode manual -spfile 
D:\oracle\app\product\11.1.0\db_1\bin\oradim.exe -edit -sid G01 -startmode auto -srvcstart system 
D:\oracle\app\product\11.1.0\db_1\bin\sqlplus /nolog @D:\oracle\app\admin\G01\scripts\G01.sql
