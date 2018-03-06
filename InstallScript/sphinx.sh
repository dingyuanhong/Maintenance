#安装
#http://blog.csdn.net/CleverCode/article/details/52204124




#sphinx 检索引擎安装
wget http://sphinxsearch.com/files/sphinx-2.3.2-beta.tar.gz
tar zxvf sphinx-2.3.2-beta.tar.gz
cd sphinx-2.3.2-beta
./configure --prefix=/usr/local/sphinx2 --with-mysql=/usr/local/mysql
make
sudo make install
cd api/libsphinxclient
./configure --prefix=/usr/local/sphinx2
make
sudo make install
cd ..

wget http://pecl.php.net/get/sphinx-1.3.3.tgz
tar zxvf sphinx-1.3.3.tgz
cd sphinx-1.3.3
/usr/local/php/bin/phpize  && ./configure --with-sphinx=/usr/local/sphinx2/ --with-php-config=/usr/local/php/bin/php-config
make 
sudo make install 
cd ..




#配置
#https://www.cnblogs.com/yjf512/p/3598332.html
#https://www.cnblogs.com/gimin/p/5598651.html
#http://blog.csdn.net/u011146511/article/details/78698402
#https://www.cnblogs.com/mingaixin/p/5085708.html
#实时查询
#http://blog.csdn.net/clevercode/article/details/52231015

#配置mysql库
ln -s /usr/local/mysql/lib/libmysqlclient.so.20 /usr/lib64/libmysqlclient.so.20
rm -f /usr/local/sphinx2/var/data/*
#全量执行
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf --all
#增量执行
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf main --rotate
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf main_delta --rotate
#合并增量索引
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf --merge main main_delta --merge-dst-range deleted 0 0 --rotate
#开启搜索引擎
pkill searchd
/usr/local/sphinx2/bin/searchd --config /data/conf/sphinx.conf



#scws 中文分词安装
wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2
tar xvjf scws-1.2.3.tar.bz2
./configure --prefix=/usr/local/scws/
make
sudo make install

#php扩展安装
cd phpext
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
sudo make install
cd ..
cd ..




#scws 中文分词词库
wget http://www.xunsearch.com/scws/down/scws-dict-chs-utf8.tar.bz2
tar xvjf scws-dict-chs-utf8.tar.bz2 -C /usr/local/scws/etc/
chown www:www /usr/local/scws/etc/dict.utf8.xdb
