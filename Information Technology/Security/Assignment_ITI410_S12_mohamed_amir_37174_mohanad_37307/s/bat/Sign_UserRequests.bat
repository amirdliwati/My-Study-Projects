cd "C:\OpenSSL-Win32\bin"
openssl.exe x509 -req -CA c:\s\ca_cert.pem -in C:\s\server.crs -CAserial C:\s\serial.txt -CAkey C:\s\ca.key -out C:\s\newcerts\server_cert.pem
cd "C:\OpenSSL-Win32\bin"
openssl.exe x509 -req -CA c:\s\ca_cert.pem -in C:\s\client.crs -CAserial C:\s\serial.txt -CAkey C:\s\ca.key -out C:\s\newcerts\client_cert.pem  

