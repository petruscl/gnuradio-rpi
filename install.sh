#!/bin/bash

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'



echo -e "${blue} ---------fazendo update... --------- ${clear}"
sudo apt update
echo -e "${blue} ---------fazendo upgrade... --------- ${clear}"
sudo apt upgrade -y
echo -e "${blue} --------- instalando cmake... --------- ${clear}"
sudo apt install cmake
echo -e "${blue} --------- instalando libusb... --------- ${clear}"
sudo apt install libusb-1.0-0-dev
echo -e "${blue} --------- instalando osmocom... --------- ${clear}"
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
sudo cmake ../ -DINSTALL_UDEV_RULES=ON
sudo make
sudo make install
sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
cd /etc
ls
echo -e "${blue} --------- fazendo o blacklist --------- ${clear}"
echo 'blacklist blacklist dvb_usb_rtl28xxu' | sudo tee - append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
echo -e "${blue} --------- instalando gnuradio... --------- ${clear}"
sudo apt install gnuradio libusb-1.0-0 gr-iqbal
sudo apt-get install gqrx-sdr
echo -e "${blue} --------- tudo pronto! --------- ${clear}"