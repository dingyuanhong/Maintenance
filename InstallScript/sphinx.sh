#��װ
#http://blog.csdn.net/CleverCode/article/details/52204124




#sphinx �������氲װ
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




#����
#https://www.cnblogs.com/yjf512/p/3598332.html
#https://www.cnblogs.com/gimin/p/5598651.html
#http://blog.csdn.net/u011146511/article/details/78698402
#https://www.cnblogs.com/mingaixin/p/5085708.html
#ʵʱ��ѯ
#http://blog.csdn.net/clevercode/article/details/52231015

#����mysql��
ln -s /usr/local/mysql/lib/libmysqlclient.so.20 /usr/lib64/libmysqlclient.so.20
rm -f /usr/local/sphinx2/var/data/*
#ȫ��ִ��
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf --all
#����ִ��
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf main --rotate
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf main_delta --rotate
#�ϲ���������
/usr/local/sphinx2/bin/indexer --config /data/conf/sphinx.conf --merge main main_delta --merge-dst-range deleted 0 0 --rotate
#������������
pkill searchd
/usr/local/sphinx2/bin/searchd --config /data/conf/sphinx.conf



#scws ���ķִʰ�װ
wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2
tar xvjf scws-1.2.3.tar.bz2
./configure --prefix=/usr/local/scws/
make
sudo make install

#php��չ��װ
cd phpext
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
sudo make install
cd ..
cd ..




#scws ���ķִʴʿ�
wget http://www.xunsearch.com/scws/down/scws-dict-chs-utf8.tar.bz2
tar xvjf scws-dict-chs-utf8.tar.bz2 -C /usr/local/scws/etc/
chown www:www /usr/local/scws/etc/dict.utf8.xdb
