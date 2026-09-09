cd "C:\OpenSSL-Win32\bin"
openssl.exe s_client -connect localhost:1235 -verify 2 -CAfile C:\s\newcerts\client_cert.pem -sess_out C:\s\client02.txt