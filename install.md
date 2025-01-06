sudo apt install firefox-esr neofetch xfce4-goodies ibus ibus-libpinyin ufw 


sudo ufw allow 5901


tightvncserver :1 -geometry 1440x900
tightvncserver :1 -geometry 2560x1600
tightvncserver -kill :1


nano ~/.vnc/xstartup

export DISPLAY=:1 && export PULSE_SERVER=127.0.0.1 && dbus-launch --exit-with-session startxfce4
