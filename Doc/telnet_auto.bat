:: Auto.bat
:: Step 1 Open CMD
:: Step 2 Enable Telnet client function of win10 service
:: Step 3 Telnet to In-Sight 4001
:: Step 4 Login to In-Sight 4001
:: Step 5 Get the value of the column by In-Sight syntax
:: Author : SQA/Jay 2020/6/9

::# 1. 開啟cmd 以系統管理員身分執行
::# 2. 在cmd中 輸入"Windows <啟用telnet client> 指令" dism /online /Enable-Feature /FeatureName:TelnetClient
::# 3. 在cmd中 輸入"windows telnet 指令":"telnet 192.168.2.105 23" 進入In-Sight 4001裝置 [<指令格式>：telnet ip-address port-number]
::# 4. 變換到In-Sight登入畫面 輸入admin
::# 5. 無密碼，直接click "Enter"
::# 6. 輸入"In-Sight語法"取得欄位內容值

::@ECHO OFF
:: 1. start "C:\Program Files (x86)\Cognex\In-Sight\In-Sight Explorer 3.4.2\In-Sight Explorer.exe"
:: 2. dism /online /Enable-Feature /FeatureName:TelnetClient
:: 3. telnet 192.168.2.105 23
:: 4. admin
:: 5. 
:: 6. gvb008

@echo off  (關閉echo)

@echo set sh=WScript.CreateObject("WScript.Shell") > telnet_tmp.vbs  (建立shell對像)

start telnet 192.168.2.105 23 (連線到IS)

echo sh.SendKeys "admin{ENTER}" >> telnet_tmp.vbs  (帳號)

echo WScript.Sleep 1000 >>telnet_tmp.vbs (等待1秒)

echo sh.SendKeys "{ENTER}" >> telnet_tmp.vbs(密碼)

::echo sh.SendKeys "Version{ENTER}" >> telnet_tmp.vbs (這裡查看d-link版本)

echo sh.SendKeys "gvb008"  >> telnet_tmp.vbs  (取得IS偵測內容)

echo WScript.Sleep 1000 >>telnet_tmp.vbs 

cscript //nolgo telnet_tmp.vbs

