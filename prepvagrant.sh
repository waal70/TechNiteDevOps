#!/bin/bash


# Remove APT cache
yum clean all

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=4M
rm -f /EMPTY

# Remove bash history
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

# Cleanup log files
rm -rf /var/log/*

# REMOVE VIRTUALBOX SPECIFIC FILES
rm -rf /usr/src/vboxguest* 

# REMOVE UNUSED LOCALES:
localedef --list-archive | grep -v -i en_US | xargs localedef --delete-from-archive
rm -rf /usr/lib/locale/locale-archive.tmpl
mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
build-locale-archive


# Whiteout root
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`; 
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1M count=$count;
rm /tmp/whitespace;
 
# Whiteout /boot
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
let count--
dd if=/dev/zero of=/boot/whitespace bs=1M count=$count;
rm /boot/whitespace;

swappart=$(cat /proc/swaps | grep -v Filename | tail -n1 | awk -F ' ' '{print $1}')
if [ "$swappart" != "" ]; then
  swapoff $swappart;
  dd if=/dev/zero of=$swappart;
  mkswap $swappart;
  swapon $swappart;
fi 
