echo "install packet"
#echo "apt-get ..."
#sudo apt-get install build-essential 
#sudo apt-get install libncurses5-dev 
#sudo apt-get install libssl-dev
#sudo apt-get install m4 
#sudo apt-get install unixodbc unixodbc-dev
#sudo apt-get install freeglut3-dev libwxgtk2.8-dev 
#sudo apt-get install xsltproc 
#sudo apt-get install fop 
#sudo apt-get install tk8.5
#sudo apt-get install erlang

#echo "yum ..."
#yum -y install make gcc gcc-c++ kernel-devel m4 ncurses-devel openssl-devel unixODBC-devel
#yum -y install make gcc gcc-c++
yum install gcc-c++
yum -y install kernel-devel ncurses-devel unixODBC-devel
yum install fop
yum install erlang-wx
yum -y install gtk2 gtk2-devel gtk2-devel-docs
yum install libmicrohttpd-dev libgtk2.0-dev
yum install libgnomeui-devel
yum install mesa*
yum install freeglut* 


echo "download wxWidgets"
#wget http://tenet.dl.sourceforge.net/project/wxwindows/2.8.12/wxWidgets-2.8.12.tar.bz2
#tar jxf wxWidgets-2.8.12.tar.bz2
#cd wxWidgets-2.8.12

wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.3/wxWidgets-3.0.3.tar.bz2
tar jxf wxWidgets-3.0.3.tar.bz2
cd wxWidgets-3.0.3
./configure --enable-unicode --enable-debug --with-opengl --with-gtk --disable-shared
make
sudo make install
cd ..


echo "download erlang"
#wget http://erlang.org/download/otp_src_19.0.tar.gz
#tar -xvzf otp_src_19.0.tar.gz
#cd otp_src_19.0

wget http://erlang.org/download/otp_src_20.2.tar.gz
tar -xvzf otp_src_20.2.tar.gz
cd otp_src_20.2

echo "make erlang"
./configure --prefix=/usr/local/erlang --with-ssl -enable-threads -enable-smmp-support -enable-kernel-poll --enable-hipe --without-javac --disable-javac
make
sudo make install
cd ..


echo "config PATH"
echo 'ERLANG_HOME=/usr/local/erlang' >> /etc/profile
echo 'PATH=$PATH:$ERLANG_HOME/bin' >> /etc/profile
source /etc/profile


echo "download rabbitmq"
#wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.3/rabbitmq-server-generic-unix-3.6.3.tar.xz
#xz -d rabbitmq-server-generic-unix-3.6.3.tar.xz
#tar -xvf rabbitmq-server-generic-unix-3.6.3.tar
#mv rabbitmq_server-3.6.3 /usr/local/rabbitmq_server

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.14/rabbitmq-server-generic-unix-3.6.14.tar.xz
xz -d rabbitmq-server-generic-unix-3.6.14.tar.xz
tar -xvf rabbitmq-server-generic-unix-3.6.14.tar
mv rabbitmq_server-3.6.14 /usr/local/rabbitmq_server

cd /usr/local/rabbitmq_server
cd sbin/


echo "service plugins"
./rabbitmq-plugins enable rabbitmq_management rabbitmq_web_stomp rabbitmq_stomp
