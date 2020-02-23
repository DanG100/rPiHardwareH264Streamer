#!/bin/bash

sudo apt-get update
sudo apt-get install socat
sudo rpi-update
sudo raspi-config nonint do_camera 0
sudo usermod -aG netdev $user

chmod a+x ./camServer.sh

crontab -l > cronlocal
echo -n "@reboot " >> cronlocal
find "$(pwd)" -name camServer.sh >> cronlocal
crontab cronlocal

sudo reboot
