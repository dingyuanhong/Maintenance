tar -xzvf redis-3.0.1.tar.gz
cd redis-3.0.1
make
make PREFIX=/usr/local/redis  install
cp -R utils /usr/local/redis/
cp *.conf /usr/local/redis/
cd ..
rm -rf redis-3.0.1