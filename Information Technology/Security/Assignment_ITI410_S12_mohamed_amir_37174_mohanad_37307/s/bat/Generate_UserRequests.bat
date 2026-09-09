cd "C:\OpenSSL-Win32\bin"
openssl.exe  req -config C:\s\openssl.txt -new -key C:\s\server.key -out C:\s\server.crs
cd "C:\OpenSSL-Win32\bin"
openssl.exe  req -config C:\s\openssl.txt -new -key C:\s\client.key -out C:\s\client.crs
       
       