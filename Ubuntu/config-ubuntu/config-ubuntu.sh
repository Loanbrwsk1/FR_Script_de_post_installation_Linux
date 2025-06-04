#!/bin/bash

FLATPAKAPP="org.videolan.VLC com.github.marinm.songrec org.soundconverter.SoundConverter com.mattjakeman.ExtensionManager io.github.flattool.Warehouse com.github.tchx84.Flatseal"
ADDAPP="git aspell-fr gnome-tweaks file-roller dconf-editor gnome-boxes shellcheck htop neofetch screenfetch inxi sl nyancat ecryptfs-utils virtualbox cool-retro-term gparted"

maj(){
	echo -e "\033[1;32m==========Mises à Jour==========\033[0m"
    echo ""
    dpkg --configure -a
    echo ""
	echo -e "\033[1;32mMise à jour de flatpak\033[0m"
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
	echo -e "\033[1;32mInstallation des Flatpak\033[0m"
	echo ""
	flatpak install flathub -y $FLATPAKAPP
	echo ""
	echo -e "\033[1;32mInstallation des logiciels\033[0m"
	echo ""
	apt install --skip-unavailable -y $ADDAPP
	echo ""
}

main(){
    maj
    install_app
}

main
