tar -xzvf redis-3.0.1.tar.gz
cd redis-3.0.1
make
make PREFIX=/usr/local/redis  install
cp -R utils /usr/local/redis/
cp *.conf /usr/local/redis/
cd ..
rm -rf redis-3.0.1

#php-redis
wget http://pecl.php.net/get/redis-4.0.2.tgz

#php-redis
tar -zxvf redis-4.0.2.tgz
cd redis-4.0.2
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
sudo make install
make clean
cd ..
rm -rf redis-4.0.2