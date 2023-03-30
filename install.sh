#!/bin/bash
echo "iniciando..."
sudo apt update
sudo apt upgrade -y
sudo apt install cmake
sudo apt install libusb-1.0-0-dev
echo "instalando osmocom..."
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
echo "fazendo o blacklist"
echo 'blacklist blacklist dvb_usb_rtl28xxu' | sudo tee - append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

echo "instalando gnuradio"
sudo apt install gnuradio libusb-1.0-0 gr-iqbal
sudo apt-get install gqrx-sdr

echo "tudo pronto!"