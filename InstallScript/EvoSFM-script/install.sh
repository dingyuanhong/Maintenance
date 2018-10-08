cat /etc/os-release
uname -r
#sudo add-apt-repository ppa:graphics-drivers/ppa 
#sudo apt-get update
#sudo service lightdm stop
#sudo apt-get install nvidia-375 nvidia-settings nvidia-prime

#https://docs.nvidia.com/cuda/pdf/CUDA_Installation_Guide_Linux.pdf (官方安装文档)

#cuda-8.0
#https://developer.nvidia.com/cuda-80-ga2-download-archive
sudo sh cuda_8.0.61_375.26_linux.run
#(opengl option no)

# Ubuntu 14.04 gcc g++ 4.9.4.2 cmake --version 3.10.2
lspci | grep -i nvidia
#删除NVIDIA
#sudo apt-get remove --purge nvidia*
#sudo sh ./NVIDIA-Linux-x86_64-390.87.run --uninstall
#关闭渲染
service lightdm stop
#开启渲染
#service lightdm start

#Blacklist the "nouveau" driver
 lsmod | grep nouveau
sudo touch /etc/modprobe.d/blacklist-nouveau.conf
sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

#Install build-essential package
sudo apt-get install build-essential
#Install linux kernel modules
apt-get install linux-image-extra-virtual
#Install linux source and headers
apt-get install linux-source
apt-get source linux-image-$(uname -r)
apt-get install linux-headers-$(uname -r)

#disable Secure Boot 
#sudo modprobe nvidia 
#sudo apt install mokutil
#sudo mokutil --disable-validation
#sudo reboot

# install Opencv
sudo apt-get install -y build-essential cmake
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
sudo apt-get install -y libtbb-dev
wget https://github.com/opencv/opencv/archive/3.1.0.zip
unzip 3.1.0.zip
cd opencv-3.1.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j
sudo make install
sudo ldconfig

# install eigen3
sudo apt-get install libeigen3-dev
sudo cp -r /usr/local/include/eigen3/Eigen /usr/local/include

# install Ceres
sudo apt-get install -y liblapack-dev libsuitesparse-dev libcxsparse3.1.2 libgflags-dev libgoogle-glog-dev libgtest-dev
git clone -b 1.12.0 https://github.com/ceres-solver/ceres-solver.git
cd ceres-solver/
sudo mkdir build
cd build
sudo cmake ..
sudo make -j
sudo make install

# install BOOST
sudo apt-get install cmake libblkid-dev e2fslibs-dev libboost-all-dev libaudit-dev

# openGL
sudo apt-get install build-essential
sudo apt-get install libgl1-mesa-dev
sudo apt-get install libglu1-mesa-dev
sudo apt-get install libglut-dev
sudo apt-get install freeglut3-dev
sudo apt-get install libglm-dev

# install glew
sudo apt-cache search glew
sudo apt-get install libglew-dbg libglew-dev libglew1.10 libglewmx-dbg libglewmx-dev libglewmx1.10 glew-utils

# install glfw
sudo apt-get build-dep glfw
sudo apt-get install xorg-dev libglu1-mesa-dev
git clone -b 3.2.1 https://github.com/glfw/glfw.git
cd glfw-3.2.1/
sudo mkdir build
sudo cmake ..
sudo make && sudo make install