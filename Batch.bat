@echo off
rem simple way to make the backup : 
rem preparing for each device the commands and execute the backup ("pscp.exe")
rem
rem But there is still a problem with the datetime format!!

set "IP=10.1.1.1"
SET LOG=%IP%_running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
echo %LOG%.cfg
pscp.exe -pw PASSWORD -scp backup@10.30.17.1:sys_config E:\Firewall_backup\%LOG%.cfg


set "IP=10.3.140.29"
SET LOG=%IP%_running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
echo %LOG%.cfg
pscp.exe -pw PASSWORD -scp backup@10.30.17.1:sys_config E:\Firewall_backup\%LOG%.cfg



set "IP=10.22.100.1"
SET LOG=%IP%_running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
echo %LOG%.cfg
pscp.exe -pw PASSWORD -scp backup@10.30.17.1:sys_config E:\Firewall_backup\%LOG%.cfg




set "IP=10.30.17.1"
SET LOG=%IP%_running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%
echo %LOG%.cfg
pscp.exe -pw PASSWORD -scp backup@10.30.17.1:sys_config E:\Firewall_backup\%LOG%.cfg


