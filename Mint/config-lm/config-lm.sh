#!/bin/bash

FLATPAKAPP="org.videolan.VLC com.github.marinm.songrec org.soundconverter.SoundConverter io.github.flattool.Warehouse com.github.tchx84.Flatseal"
ADDAPP="git aspell-fr amd-ucode-firmware gnome-tweaks file-roller dconf-editor gnome-boxes shellcheck htop neofetch screenfetch fastfetch inxi nfs-utils sl nyancat ecryptfs-utils virtualbox cool-retro-term gparted numlockx"

maj(){
	echo -e "\033[1;32m==========Mises à jour==========\033[0m"
	echo ""
    dpkg --configure -a
    echo ""
	echo -e "\033[1;32mMise à jour de Flatpak\033[0m"
	echo ""
	flatpak update -y
	echo ""
	echo -e "\033[1;32mMise à jour du système\033[0m"
	echo ""
	apt update
	echo ""
	apt full-upgrade -y
	echo ""
	apt autoremove -y
	echo ""
}

install_app(){
	echo -e "\033[1;32m==========Installation des logiciels==========\033[0m"
	echo ""
	echo -e "\033[1;32mInstallation des logiciels Flatpak\033[0m"
	echo ""
	flatpak install flathub -y $FLATPAKAPP
	echo ""
	echo -e "\033[1;32mInstallation des logiciels\033[0m"
	echo ""
	apt install -y $ADDAPP
	echo ""
}

main(){
    maj
    install_app
}

main
