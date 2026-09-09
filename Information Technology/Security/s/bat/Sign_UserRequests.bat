cd "C:\OpenSSL-Win32\bin"
openssl.exe ca -config c:\s\openssl.txt -cert c:\s\newcerts\ca_cert.pem -in c:\s\client.crs -keyfile c:\s\newcerts\ca.key -out c:\s\newcerts\client_cert.pem 
cd "C:\OpenSSL-Win32\bin"
openssl.exe ca -config c:\s\openssl.txt -cert c:\s\newcerts\ca_cert.pem -in c:\s\server.crs -keyfile c:\s\newcerts\ca.key -out c:\s\newcerts\server_cert.pem   

