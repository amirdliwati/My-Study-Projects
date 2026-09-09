cd "C:\OpenSSL-Win32\bin"
openssl.exe s_server -dhparam C:\s\dhparam.pem -accept 1236 -cert C:\s\newcerts\server_cert.pem -key C:\s\server.key -WWW -verify 2 -CAfile C:\s\newcerts\ca_cert.pem




 