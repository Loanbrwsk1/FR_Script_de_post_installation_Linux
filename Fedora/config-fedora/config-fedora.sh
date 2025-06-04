#!/bin/bash

RPMFUSIONCOMP="rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted"
GNOMECOMP="gnome-shell-extension-dash-to-dock"
CODEC="gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-good-extras gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly-free gstreamer1-plugin-libav gstreamer1-plugins-ugly libdvdcss gstreamer1-plugin-openh264"
FLATPAKAPP="org.videolan.VLC com.github.marinm.songrec org.soundconverter.SoundConverter com.mattjakeman.ExtensionManager io.github.flattool.Warehouse com.github.tchx84.Flatseal"
ADDAPP="git aspell-fr amd-ucode-firmware gnome-tweaks file-roller dconf-editor gnome-boxes ShellCheck htop neofetch screenfetch fastfetch inxi nfs-utils sl nyancat ecryptfs-utils cool-retro-term gparted btrfs-assistant"


config_dnf(){
	echo -e "\033[1;32m==========Configuration de DNF==========\033[0m"
	if [[ $(grep -c 'fastestmirror=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "fastestmirror=true" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'max_parallel_downloads=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'countme=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "countme=false" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'deltarpm=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "deltarpm=false" >> /etc/dnf/dnf.conf
	fi
	echo ""
}

maj(){
	echo -e "\033[1;32m==========Mises à jour==========\033[0m"
	echo ""
    dpkg --configure -a
    echo ""
	echo "\033[1;32mMise à jour de Flatpak\033[0m"
	echo ""
	flatpak update -y
	echo ""
	echo "\033[1;32mMise à jour du système\033[0m"
	echo ""
	dnf upgrade -y
	echo ""
	dnf clean packages
    dnf autoremove -y
	echo ""
}

install_app(){
	echo -e "\033[1;32m==========Installation de logiciels==========\033[0m"
	echo ""
	echo -e "\033[1;32mInstallation des composants RPM Fusion\033[0m"
	echo ""
	dnf install --skip-unavailable -y $RPMFUSIONCOMP
	echo ""
	echo -e "\033[1;32mInstallation RPM Fusion Free\033[0m"
	echo ""
	dnf install --skip-unavailable -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
	echo ""
	echo -e "\033[1;32mInstallation RPM Fusion NonFree\033[0m"
	echo ""
	dnf install --skip-unavailable -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
	echo ""
	echo -e "\033[1;32mInstallation des Codecs\033[0m"
	echo ""
	dnf install --skip-unavailable -y $CODEC
	echo ""
	echo -e "\033[1;32mInstallation des logiciels Flatpak\033[0m"
	echo ""
	flatpak install flathub -y $FLATPAKAPP
	echo ""
	echo -e "\033[1;32mInstallation des logiciels\033[0m"
	echo ""
	dnf install --skip-unavailable -y $ADDAPP
	echo ""
	echo -e "\033[1;32mInstallation des composants GNOME\033[0m"
	echo ""
	dnf install --skip-unavailable -y $GNOMECOMP
}

main(){
    config_dnf
    maj
    install_app
}

main
