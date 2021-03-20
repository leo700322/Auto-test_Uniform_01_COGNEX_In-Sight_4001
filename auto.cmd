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

:: Launch the In-Sight Explorer.exe
:: start "C:\Program Files (x86)\Cognex\In-Sight\In-Sight Explorer 3.4.2\In-Sight Explorer.exe"


:: Enable the Telnet client service
:: dism /online /Enable-Feature /FeatureName:TelnetClient

::
@ECHO OFF

telnet 192.168.2.105 23

::pause
::echo.|admin
::ECHO．
::pause

gvb008