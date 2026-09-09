cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1236 -verify 2 -cert C:\s\newcerts\ca_cert.pem -cafile C:\s\newcerts\client_cert.pem -key C:\s\client.key -www 