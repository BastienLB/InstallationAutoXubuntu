sudo chroot squashfs
cd Solibuntu
xterm
./install.sh iso
apt-get clean
nohup xterm
rm -r /var/crash/*
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev
rm /etc/resolv.conf
rm /etc/hosts
exit