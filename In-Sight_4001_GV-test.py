import telnetlib

# telnet to device
print('====== telnet to In-Sight 4001 ======') 
host = "192.168.2.105"
tn = telnetlib.Telnet(host)
#tn.set_debuglevel(1) 

# read_until參數設定 b'User:\r\n' 可改為 b'\r\n'(有設定特定字串未必能成功執行，因此不設定也可以)，主要是藉由timeout設定等待回傳值。
print(tn.read_until(b'User:\r\n', timeout=5).decode('ascii'))

tn.write(b'admin\r\n')

# read_until參數設定 b'User:\r\n' 可改為 b'\r\n'(有設定特定字串未必能成功執行，因此不設定也可以)，主要是藉由timeout設定等待回傳值。
print(tn.read_until(b'Password:\r\n', timeout=5).decode('ascii'))

tn.write(b'\r\n')

# read_until參數設定 b'User:\r\n' 可改為 b'\r\n'(有設定特定字串未必能成功執行，因此不設定也可以)，主要是藉由timeout設定等待回傳值。
print(tn.read_until(b'In\r\n', timeout=5).decode('ascii'))

# Run command 步驟1-4為一次循環，可取得b008的欄位值(也就是待測物螢幕顯示的內容)
print('====== Run Command ======')

steps = ['s1', 's2', 's3', 's4']

print('1. Load the job file')
print(tn.write(b'LFA10P.job\r\n')) #"LF" = cognex native command "load file"
print(tn.read_until(b'1\r\n', timeout=5).decode('ascii'))

print('2. Run Live On')
print(tn.write(b'Put Live 1\r\n')) #"SO"=cognex "set online" therefore "SO1" = camera online
print(tn.read_until(b'1\r\n', timeout=5).decode('ascii'))

print('3. Run Live Off')
print(tn.write(b'Put Live 0\r\n')) #"SO"=cognex "set online" therefore "SO1" = camera online
print(tn.read_until(b'1\r\n', timeout=5).decode('ascii'))

print('4. Get value form c005 field')
print(tn.write(b'gvc005\r\n')) #"SO"=cognex "set online" therefore "SO1" = camera online
print(tn.read_until(b'.\r\n', timeout=5).decode('ascii'))


tn.close()
# END
