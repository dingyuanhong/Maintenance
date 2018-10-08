sudo apt-get install libaio-dev

groupadd mysql
useradd -g mysql mysql
chown -R mysql:mysql mysql

sudo cp /usr/local/mysql/support-files/mysql.server /etc/init.d/
sudo cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql

sudo rm -r /data/mysql/data/
sudo /usr/local/mysql/bin/mysqld --initialize --basedir=/usr/local/mysql/ --datadir=/data/mysql/data/ --user=mysql

#*i?ffG2K*k:j

sudo chown -R mysql:mysql /data/mysql/data/
sudo chmod -R 777 /data/mysql/data/

#sudo /etc/init.d/mysql start
sudo service mysql start
#/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf --user=mysql

/usr/local/mysql/bin/mysql -u root -p

show plugins;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ilooyo2014fz';

create database wordpress;

flush privileges;

#https://www.cnblogs.com/JiangLe/p/6625901.html
#http://www.bubuko.com/infodetail-1504268.html