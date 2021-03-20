# Introduction

In-Sight 4001是一款多功能的感應器，主要用於影像辨識、產品檢驗、識別條碼...等等的諸多用途，藉由區域網路連線並使用In-Sight Explorer或Telnet與設備連線並得到檢驗、識別的結果。

## How to install to the device

1. 將In-Sight 4001接上電源及網路。
2. 從目錄"Z:\共用區\Andy\InSightSoftware342" 安裝應用程式"ISSetup.exe"中的Button1~3三項安裝至電腦上即可(英文或簡中版本皆可)。
3. 請參考"Z:\共用區\Jayyeh\In-Sight_4001\In-Sight_software_安裝及設定"的圖檔"000_..."安裝並進行相容性設定。

## How to connect to the device

1. 開啟應用程式 "In-Sight Connection Manager"。
2. 選擇 "Setup one or more In-Sight vision sensors to work on my network"後click"Next"按鈕。
3. 在In-Sight Sensor MAC Address欄位中輸入"00d024007ffa"後click "Add"再click "Next"按鈕。
4. 選擇"Use The Following Network Set"tings For All Sensors"並輸入Default gateway:"192.168.2.254"及DNS:"192.168.1.9"再Click "Next"按鈕。
5. 在New Name欄位內輸入"IS-SQA"並在New IP欄位內輸入"192.168.2.105"再click "Next"按鈕。
6. 最後click "Configure"按鈕，再手動重新插拔電源，出現訊息視窗"In-Sight Configuration Completed."表示完成設定。

### How to control the device by "In-Sight Explorer"

1. 請參考"Z:\共用區\Jayyeh\In-Sight_software_安裝及設定"的圖檔"001_..."到"012.jpg"進行設定並確認影像及辨識結果皆正確無誤。

### How to control the device by Telnet and Command

1. 開啟cmd.exe
2. Telnet to In-Sight 4001

   ```cmd
   telnet 192.168.2.105
   username:admin
   password:
   ```

3. 使用COGNEX的語法

   ```cmd
   LFSQA00.job
   Put Live 1
   Put Live 0
   gvb008
   ```

## How to code for In-Sight 4001

從telnet開始在win10系統中使用任何指令皆需要轉碼，規則如下：

* 輸入的command為tn.write()，而要輸入的字元admin會變成 b'admin\r\n'，如下方語法：

   ```python
   tn.write(b'admin\r\n')
   ```

* 關於read_until參數使用方式為等待"特定字串"，或設定timeout值回傳任何可用的內容；僅等待特定字串User:的程式碼範例如下:

   ```python
   print(tn.read_until(b"User:"))
   ```

* 不等待特定字串且設定timeout
等待回傳值，參考程式碼如下：

   ```python
   print(tn.read_until(b'In\r\n', timeout=1).decode('ascii'))
   ```
