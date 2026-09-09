cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1236 -verify 2 -cert C:\s\newcerts\client_cert.pem -CAfile C:\s\newcerts\ca_cert.pem -key C:\s\client.key -sess_out C:\s\client03.txt 