# Instruções Sensoriamento Espectral Projeto 1

#### Projeto testado no dia 09/05/2023

## Preparação do Cartão SD 
* instalar via [raspberry pi imager](https://www.raspberrypi.com/software/)
```Console
sudo apt install rpi-imager
```
* no pi imager selecionar o Raspberry PI OS (32-bit).  
![Exemplo seleção PI OS 32-bit](https://github.com/petruscl/gnuradio-rpi/assets/68358157/0cf5b4d0-3cd5-458f-951b-5cf049492112)

* selecionar o disco onde será salvo o sistema operacional, no caso da raspberry, um SD com pelo menos 8GB de preferência.  
![Exemplo seleção SD para salvamento do PI OS](https://github.com/petruscl/gnuradio-rpi/assets/68358157/d2c52d9a-7add-4bf2-aaaf-23e5283ec2e2)

* definir hostname e habilitar acesso ssh .
```
hosts{
	raspberrypi1
	raspberrypi2
	raspberrypiX
}
```
![Exemplo habilitação ssh e definição do hostname ](https://github.com/petruscl/gnuradio-rpi/assets/68358157/c94aee53-a93d-4b0e-a092-4eaad1558bb9)

* definir nome do usuário e a senha
```
user: pi
pass: engenharia
```
![Exemplo definição de usuário e senha do sistema](https://github.com/petruscl/gnuradio-rpi/assets/68358157/b849d36f-2bad-4448-a214-2defa1960a2a)


* habilitar e configurar wifi para possibilitar o acesso remoto.  
![Exemplo habilitação/definição de usuário e senha da wifi](https://github.com/petruscl/gnuradio-rpi/assets/68358157/a24b31ec-2848-4205-b9cf-d134f838f165)


##  habilitar o VNC
```console
ping NOME-DA-MAQUINA-REMOTA.local
```
Se retornar IP a máquina está disponível para acesso remoto.

```console
ssh pi@NOME-DA-MAQUINA-REMOTA.local
sudo raspi-config
```
Em interfaces habilite o "VNC" e no System Options habilitar o "Desktop Autologin".

Realizar o download do [VNC](https://www.realvnc.com/pt/connect/download/viewer/) para o sistema operacional em questão e instalar o VNC viewer na máquina cliente(onde o X.X.X representa a versão atual):
```console 
chmod +x  VNC-Viewer-X.X.X-Linux-x64.deb 
sudo dpkg -i VNC-Viewer-X.X.X-Linux-x64.deb 
```

##  instalar o RTL-SDR no Raspberry Pi
```console
ssh pi@NOME-DA-MAQUINA-REMOTA.local
git clone https://github.com/petruscl/gnuradio-rpi
cd gnuradio-rpi/
chmod +x install.sh
sudo ./install.sh
```

### conectar o rtl-sdr à raspberry e testar se o mesmo conectou
```console
rtl_test -t
```
Se estiver tudo ok o resultado deve ser algo parecido com o texto abaixo:
```console
Found 1 device(s):
  0:  Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM
Found Rafael Micro R820T tuner
Supported gain values (29): 0.0 0.9 1.4 2.7 3.7 7.7 8.7 12.5 14.4 15.7 16.6 19.7 20.7 22.9 25.4 28.0 29.7 32.8 33.8 36.4 37.2 38.6 40.2 42.1 43.4 43.9 44.5 48.0 49.6 
[R82XX] PLL not locked!
Sampling at 2048000 S/s.
No E4000 tuner found, aborting.
```
