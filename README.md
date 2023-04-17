# Instruções Sensoriamento Espectral Projeto 1

## Preparação do Cartão SD 
* instalar via raspberry pi imager
* habilitar ssh e configurar wifi.

```
user: pi
pass: engenharia
hosts{
	raspberrypi1
	raspberrypi2
	raspberrypi3
}
```

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
git clone https://github.com/petruscl/gnuradio-rpi
cd gnuradio-rpi/
chmod +x install.sh
sudo ./install.sh
```

### testar se o rádio conectou
```console
rtl_test -t
```

###  A FAZER
* colocar prints de comentário de cor diferente para acompanhar as etapas mais facilmente no meio do flood de informações que os comandos dão de saída
