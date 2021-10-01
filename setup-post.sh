#!/bin/sh

# Install xorg, base-devel files/tools, and everything concerning virtualization
sudo setup-xorg-base
sudo apk add htop \
	g++ make ncurses \
	libx11-dev libxft-dev libxinerama-dev \
	qemu qemu-img qemu-modules qemu-system-x86_64 \
	libvirt virt-viewer virt-install libvirt-daemon
sudo rc-update add libvirtd

# Compile executables
mkdir Executables
cd Executables

	# DWM
	git clone https://github.com/MLquest8/dwm-orange.git
	cd dwm-orange
	sudo make install
	cd ..

	# DMENU
	git clone https://github.com/MLquest8/dmenu-persimmon.git
	cd dmenu-persimmon
	sudo make install
	cd ..

	# ST
	git clone https://github.com/MLquest8/st-plum.git
	cd st-plum
	sudo make install
	cd ..

# Back to AlpineHost
cd ..

# Fix unicode defaults, edit minor configs
sed -i s/#unicode="NO"\n\n#/#unicode="NO"\n\nunicode="YES"\n\n#/ /etc/rc.conf
echo "exec dwm" > ~/.xinitrc
echo "startx" > ~/.profile

# Install zsh and oh-my-zsh
#sudo apk add zsh
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
