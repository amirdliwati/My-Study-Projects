cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1236 -verify 2 -cert C:\newcerts\ca_cert.pem -cafile C:\newcerts\client_cert.pem -key C:\newcerts\client.key 