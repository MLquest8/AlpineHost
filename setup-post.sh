#!/bin/bash

# NO ROOT ALLOWED!
if [ "$EUID" -ne 0 ]
then

# Install xorg, base-devel files/tools, and everything concerning virtualization
setup-xorg-base
sudo apk add zsh htop \
	g++ make ncurses \
	libx11-dev libxft-dev libxinerama-dev \
	qemu qemu-img qemu-modules qemu-system-x86_64 \
	libvirt virt-viewer virt-install libvirt-daemon
rc-update libvirtd

# Fix unicode defaults, install oh-my-zsh, set zsh as the default shell
sed -i s/#unicode="NO"\n\n#/#unicode="NO"\n\nunicode="YES"\n\n#/ /etc/rc.conf
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

#Compile Executables
mkdir Executables
cd Executables

#dwm-orange
git clone https://github.com/MLquest8/dwm-orange.git
cd dwm-orange
sudo make install
cd ..

#st-plum
git clone https://github.com/MLquest8/st-plum.git
cd st-plum
sudo make install
cd ..

#dmenu-persimmon
git clone https://github.com/MLquest8/dmenu-persimmon.git
cd dmenu-persimmon
sudo make install
cd ..

#tulizu
git clone https://github.com/loh-tar/tulizu.git
cd tulizu
sudo make install
sudo tulizu install arch-rson451.issue
cd ..

#Back to Archer
cd ..
