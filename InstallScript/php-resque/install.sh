# 安装pcntl
# tar -xzvf php-5.6.9.tar.gz
cd /data/source/php-5.6.9/ext/pcntl/
/usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install

# 安装compser
cd /data/source/
curl -s http://getcomposer.org/installer | /usr/local/php/bin/php
/usr/local/php/bin/php -c /data/conf/php/php.ini composer.phar -h

# 使用Composer安装php-resque
cd /data/source/
git clone git://github.com/chrisboulton/php-resque.git
cd php-resque 
/usr/local/php/bin/php -c /data/conf/php/php.ini ../composer.phar  install


