@echo off
start telnet
set 
set /p userid=User id : 
set /p password=Password : 

echo userid=[%userid%],password=[%password%]
send admin
send 