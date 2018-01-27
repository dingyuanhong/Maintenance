groupadd mysql
useradd -g mysql mysql

#root@localhost: hA-lpd<Ad1lo


cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld



/usr/local/mysql/bin/mysql -u root -p

set Password=PASSWORD('123456');
flush privileges;