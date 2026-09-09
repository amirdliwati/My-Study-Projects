cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1235 -verify 2 -CAfile C:\newcerts\client_cert.pem