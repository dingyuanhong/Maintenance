/usr/local/nginx/sbin/nginx -h
/usr/local/nginx/sbin/nginx -p /usr/local/nginx -c /data/conf/nginx/nginx.conf
/usr/local/nginx/sbin/nginx -p /usr/local/nginx -c /data/conf/nginx/nginx.conf -s reload

cp -fu /usr/local/nginx/conf/fastcgi_params /data/conf/nginx/fastcgi_params
cp -fu /usr/local/nginx/conf/mime.types /data/conf/nginx/mime.types