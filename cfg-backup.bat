@echo off
rem Configuration backup of Fortinet Fortigate Firewalls
SetLocal EnableDelayedExpansion
rem   
rem CSV File Format for each device:
rem IP Address,Hostname, Model
rem   a       ,  b     , c   
rem All lines form the CSV Files, beginning with "#" will be ignored   
set "CSV_FILE=C:\myscripts\dos-batch\Firewall_Backup\devices.txt"
set "BACKUP_LOG=C:\myscripts\dos-batch\Firewall_Backup\backup-log.txt"
set PWD=PASSWORD
set USER=backup
rem set "BACKUP_DIR=C:\BACKUPS\"
rem set BACKUP_DIR="E:\Program Files\iMC\server\data\cfgbak\"
set "BACKUP_DIR=C:\myscripts\dos-batch\Firewall_Backup\"
rem set pscp="E:\Program Files\iMC\server\bin\"pscp.exe
set "pscp=C:\Windows\pscp.exe"
rem
rem echo IP Address > %BACKUP_LOG%
echo Running configuration of the Fortinet FortiGate Firewalls > %BACKUP_LOG%
echo.>> %BACKUP_LOG%
rem
for /f "eol=#  tokens=1,2,3 delims=," %%a in (%CSV_FILE%) do ( 
set IPaddr=%%a
set HOSTNAME=%%b
set MODEL=%%c
set DATESTAMP=%DATE:~-4%%DATE:~-10,-8%%DATE:~-7,-5%%TIME:~0,2%%TIME:~3,2%
set DATESTAMP=%DATESTAMP: =0%
echo Datestamp : !DATESTAMP!
rem set "SUFFIX=running_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%%TIME:~0,2%%TIME:~3,2%.cfg"
rem set "SUFFIX=running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%.cfg"
set "SUFFIX=running_%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%.cfg"
set BACKUP_FILE=!BACKUP_DIR!!IPaddr!_!SUFFIX!
rem set BACKUP_FILE=!HOSTNAME!_!SUFFIX!
echo !IPaddr! !HOSTNAME! !MODEL! :: !BACKUP_FILE!
echo !IPaddr! !HOSTNAME! !MODEL! :: !BACKUP_FILE!>> %BACKUP_LOG%
%pscp% -pw %PWD% -scp %USER%@!IPaddr!:sys_config !BACKUP_FILE! 
echo.>> %BACKUP_LOG%
)

