#wget http://gcc.parentingamerica.com/releases/gcc-5.2.0/gcc-5.2.0.tar.bz2
#wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-5.2.0/gcc-5.2.0.tar.bz2
#tar -xf gcc-5.2.0.tar.bz2
#cd gcc-5.2.0

wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.2.0/gcc-7.2.0.tar.gz
tar -xf gcc-7.2.0.tar.gz
cd gcc-7.2.0

#œ¬‘ÿ“¿¿µ
./contrib/download_prerequisites

#±‡“Î
./configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
make
make install

#…˝º∂gcc
#/usr/sbin/update-alternatives --install  /usr/bin/gcc gcc /usr/local/bin/x86_64-unknown-linux-gnu-gcc-5.2.0 52
#/usr/sbin/update-alternatives --install  /usr/bin/cc cc /usr/local/bin/x86_64-unknown-linux-gnu-gcc 52
#/usr/sbin/update-alternatives --install  /usr/bin/c++ c++ /usr/local/bin/x86_64-unknown-linux-gnu-c++ 52

/usr/sbin/update-alternatives --install  /usr/bin/gcc gcc /usr/local/bin/x86_64-pc-linux-gnu-gcc-7.2.0 72
/usr/sbin/update-alternatives --install  /usr/bin/cc cc /usr/local/bin/x86_64-pc-linux-gnu-gcc 72
/usr/sbin/update-alternatives --install  /usr/bin/c++ c++ /usr/local/bin/x86_64-pc-linux-gnu-c++ 72
/usr/sbin/update-alternatives --install  /usr/bin/g++ g++ /usr/local/bin/x86_64-pc-linux-gnu-g++ 72