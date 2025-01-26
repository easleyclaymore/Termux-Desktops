#!/bin/sh

#Path of DEBIAN rootfs
DEBIANPATH="/data/SubSystem/chrootDebian"

# Fix setuid issue
busybox mount -o remount,dev,suid /data

busybox mount --bind /dev $DEBIANPATH/dev
busybox mount --bind /sys $DEBIANPATH/sys
busybox mount --bind /proc $DEBIANPATH/proc
busybox mount -t devpts devpts $DEBIANPATH/dev/pts

# /dev/shm for Electron apps
mkdir $DEBIANPATH/dev/shm
busybox mount -t tmpfs -o size=256M tmpfs $DEBIANPATH/dev/shm

# Mount sdcard
mkdir $DEBIANPATH/sdcard
busybox mount --bind /sdcard $DEBIANPATH/sdcard

# chroot into DEBIAN
busybox chroot $DEBIANPATH /bin/su - root -c 'sudo apt install firefox-esr neofetch xfce4-goodies ibus ibus-libpinyin ufw locales libatomic1 libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-render-util0 libxcb-keysyms1 tigervnc-standalone-server tigervnc-common tigervnc-xorg-extension tigervnc-viewer'
#busybox chroot $DEBIANPATH /bin/su - root -c 'export XDG_RUNTIME_DIR=${TMPDIR} && export PULSE_SERVER=tcp:127.0.0.1:4713 && sudo service dbus start && su - droidmaster -c "env DISPLAY=:0 startxfce4"'
#busybox chroot $DEBIANPATH /bin/su - alin -c 'export DISPLAY=:0 && export PULSE_SERVER=127.0.0.1 && dbus-launch --exit-with-session startxfce4'
#busybox chroot $DEBIANPATH /bin/su - alin -c 'export DISPLAY=:1 && export PULSE_SERVER=127.0.0.1 && vncserver'
