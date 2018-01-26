openssl rand -base64 741 > ./mongodb-keyfile  
chmod 300 mongodb-keyfile
cp mongodb-keyfile ./conf