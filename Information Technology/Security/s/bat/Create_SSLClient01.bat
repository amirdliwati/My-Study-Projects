cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1234 -verify 2 -cert C:\s\newcerts\client_cert.pem -key C:\s\client.key