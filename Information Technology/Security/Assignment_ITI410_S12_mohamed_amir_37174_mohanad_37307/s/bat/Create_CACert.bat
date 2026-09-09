cd "C:\OpenSSL-Win32\bin"
openssl.exe req -config c:\s\openssl.txt -new -x509 -days 1001 -key c:\s\ca.key  -out c:\s\newcerts\ca_cert.pem -outform PEM

