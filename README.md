# Instruções Sensoriamento Espectral Projeto 1

## Preparação do Cartão SD 
* instalar via raspberry pi imager
* habilitar ssh e configurar wifi.

user: pi
pass: engenharia
hosts{
	raspberrypi1
	raspberrypi2
	raspberrypi3
}

##  habilitar o VNC
 ping raspberrypi1.local
 ssh raspberrypi1.local
 sudo raspi-config

em interfaces

* instalar o VNC viewer na máquina cliente:
```console 
sudo dpkg -i VNC-Viewer-7.0.1-Linux-x64.deb 
```

##  instalar o RTL-SDR no Raspberry Pi
```console
sudo apt update
sudo apt upgrade -y
sudo apt install cmake
sudo apt install cmake
sudo apt install libusb-1.0-0-dev
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
echo 'blacklist blacklist dvb_usb_rtl28xxu' | sudo tee - append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
sudo apt install gnuradio libusb-1.0-0 gr-iqbal
sudo apt-get install gqrx-sdr
```

### testar
```console
git clone git://git.osmocom.org/rtl-sdr.git
```

###  A FAZER
* colocar prints de comentário de cor diferente para acompanhar as etapas mais facilmente no meio do flood de informações que os comandos dão de saída