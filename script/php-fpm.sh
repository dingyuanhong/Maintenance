if [ ! -d  /tmp/nginx/ ];then
	mkdir /tmp/nginx/
fi

/usr/local/php/sbin/php-fpm -c /data/conf/php/php.ini -y /data/conf/php/php-fpm.conf
chmod 777 /tmp/nginx/php-fpm.sock
