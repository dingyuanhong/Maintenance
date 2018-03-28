#wget http://gcc.parentingamerica.com/releases/gcc-5.2.0/gcc-5.2.0.tar.bz2
wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-5.2.0/gcc-5.2.0.tar.bz2

tar -xf gcc-5.2.0.tar.bz2
cd gcc-5.2.0
#ÏÂÔØÒÀÀµ
./contrib/download_prerequisites

#±àÒë
./configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
make
make install

#Éı¼¶gcc
/usr/sbin/update-alternatives --install  /usr/bin/gcc gcc /usr/local/bin/x86_64-unknown-linux-gnu-gcc-5.2.0 52
/usr/sbin/update-alternatives --install  /usr/bin/cc cc /usr/local/bin/x86_64-unknown-linux-gnu-gcc 52
/usr/sbin/update-alternatives --install  /usr/bin/c++ c++ /usr/local/bin/x86_64-unknown-linux-gnu-c++ 52