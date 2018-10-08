#ssh
#启动
service sshd restart
#开机启动
chkconfig sshd on

#samba
yum install samba
service smb restart
#setenforce 0
#chcon -t public_content_rw_t /data -R
chcon -t samba_share_t /data -R
chown -R nobody:nobody /data
#重点
#global 添加
#map to guest=bad user #启用匿名访问

#ftp
#检查ftp
rpm -qa |grep vsftpd
#安装
yum install vsftpd -y
#启动
service vsftpd restart
#开机启动
chkconfig vsftpd on
#配置文件
#开启passive模式
#/etc/vsftpd/

#激活配置
#getsebool -a|grep ftp
#setsebool -P allow_ftpd_anon_write=0
#setsebool -P ftpd_connect_all_unreserved=0
#setsebool -P ftpd_use_passive_mode=0
#setsebool -P httpd_can_connect_ftp=0
#setsebool -P httpd_enable_ftp_server=0

firewall-cmd --list-all
firewall-cmd --add-service=ftp --permanent
firewall-cmd --add-service=samba --permanent
firewall-cmd --reload

#开发环境
yum install gcc
yum install g++
yum -y install automake autoconf
#lua开发包
yum -y install readline-devel
#nginx需求
yum install libpcre3 libpcre3-dev
yum install openssl openssl-devel

yum -y install mhash-devel libxslt-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel

#lua开发包
#apt-get install libreadline-dev
#nginx需求
#apt-get install libpcre3 libpcre3-dev
#apt-get install openssl libssl-dev
#ln -s /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib
#php需求
#apt-get install libxml2 libxml2-dev
#apt-get install libbz2-dev
#apt-get install curl libcurl3 libcurl3-dev
#apt-get install libjpeg-dev libpng-dev
#apt-get install libfreetype6-dev
#luarocks
#apt-get install unzip