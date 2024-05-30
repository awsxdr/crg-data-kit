#! /bin/bash

readonly CRG_VERSION=v2023.7

sudo raspi-config nonint do_boot_behaviour B4
sudo raspi-config nonint do_wayland W1

sudo apt-get update
sudo apt-get install unclutter xdotool

cat > run-scoredisplay.sh <<EOF
#!/bin/bash

xset s noblank
xset s off
zset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type": "Crashed"/"exit_type": "Normal"/' /home/pi/.config/chromium/Default/Preferences

DISPLAY=:0.0 /usr/bin/chromium-browser --noerrdialogs --disable-infobars --no-sandbox --kiosk http://scoreboard/views/standard/
EOF
chmod +x ./run-scoredisplay.sh

mkdir -p /home/pi/.config/lxsession/LXDE-pi/
echo "/home/pi/run-scoredisplay.sh" >> /home/pi/.config/lxsession/LXDE-pi/autostart

sudo reboot