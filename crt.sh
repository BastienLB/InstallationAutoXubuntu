echo " ================================= Après chroot ========================================="
chroot squashfs

wget https://github.com/ersplus/solibuntu/archive/Dev.zip
unzip Dev.zip
cp solibuntu-Dev/share/skel_admin.tar.gz /etc/
cp solibuntu-Dev/share/skel_gest.tar.gz /etc/
rm Dev.zip
rm -rf solibuntu-Dev
cd etc/
tar -xvzf skel_admin.tar.gz
tar -xvzf skel_gest.tar.gz
rm skel_admin.tar.gz
rm skel_gest.tar.gz
cd ../

useradd -m administrateur -s /bin/bash -k /etc/skel_admin
echo -e "AdminSolibuntu\nAdminSolibuntu" | passwd administrateur
usermod -c "Administrateur Solibuntu" administrateur
adduser administrateur sudo

useradd -m gestionnaire -s /bin/bash -k /etc/skel_gest
echo -e "AdminAsso\nAdminAsso" | passwd gestionnaire
usermod -c "Gestionnaire Solibuntu" gestionnaire

echo " ================================= Avant install ========================================"
./Solibuntu/install.sh iso
echo " ================================= Après install ========================================"
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev #dans le cas où on a exécuté sudo mount --bind /dev squashfs/dev pour le problème avec apt
rm /etc/resolv.conf
rm /etc/hosts
exit