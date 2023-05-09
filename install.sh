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
sudo apt update -y
echo -e "${blue} ---------fazendo upgrade... --------- ${clear}"
sudo apt upgrade -y
echo -e "${blue} --------- instalando cmake... --------- ${clear}"
sudo apt install cmake -y
echo -e "${blue} --------- instalando libusb... --------- ${clear}"
sudo apt install libusb-1.0-0-dev -y
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
echo -e'blacklist dvb_core\nblacklist dvb_usb_rtl2832u\nblacklist dvb_usb_rtl28xxu\nblacklist dvb_usb_v2\nblacklist r820t\nblacklist rtl2830\nblacklist rtl2832\nblacklist rtl2832_sdr\nblacklist rtl2838\nblacklist rtl8192cu\nblacklist rtl8xxxu\ninstall dvb_core /bin/false\ninstall dvb_usb_rtl2832u /bin/false\ninstall dvb_usb_rtl28xxu /bin/false\ninstall dvb_usb_v2 /bin/false\ninstall r820t /bin/false\ninstall rtl2830 /bin/false\ninstall rtl2832 /bin/false\ninstall rtl2832_sdr /bin/false\ninstall rtl2838 /bin/false\ninstall rtl8192cu /bin/false\ninstall rtl8xxxu /bin/false' | sudo tee - append /etc/modprobe.d/blacklist-rtlsdr.conf 
echo -e "${blue} --------- instalando gnuradio... --------- ${clear}"
sudo apt install gnuradio libusb-1.0-0 gr-iqbal -y
sudo apt install gqrx-sdr -y
echo -e "${blue} --------- tudo pronto! --------- ${clear}"
