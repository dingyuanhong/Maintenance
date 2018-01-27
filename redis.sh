make
make PREFIX=/usr/local/redis  install
cp -R utils /usr/local/redis/
cp *.conf /usr/local/redis/


/usr/local/redis/bin/redis-server /usr/local/redis/redis.conf  &