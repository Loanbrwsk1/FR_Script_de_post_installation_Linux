#!/bin/bash

zenity --question --title="Fonds d'écran" --text="Voulez-vous des fonds d'écran supplémentaires ?"
wallpaper=$?
zenity --question --title="Fonds d'écran dynamiques" --text="Voulez-vous des fonds d'écran dynamiques supplémentaires ?"
dynamic_wallpaper=$?

if [ $wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Wallpapers.git 
    mv ./Wallpapers/* ~/.local/share/backgrounds/
    rm -fr ./Wallpapers/
fi

if [ $dynamic_wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Dynamic-wallpapers.git
    cd ./Dynamic-wallpapers/
    sudo mv ./Dynamic_Wallpapers/ /usr/share/backgrounds/
    sudo mv ./xml/* /usr/share/gnome-background-properties/
    mv ./Screenshots_dynamic_wallpapers/ ~/Images/
    cd ..
    rm -rf ./Dynamic-wallpapers/
fi
echo -e "\033[1;32m==========Copies des fichiers utiles==========\033[0m"
if [[ $(grep -c "fmaj=" ~/.bashrc) -lt 1 ]] ; then
    echo '

alias maj="sudo apt update && sudo apt full-upgrade -y"
alias install="sudo apt install -y"
alias remove="sudo apt remove -y"
alias finstall="flatpak install flathub -y"
alias fremove="flatpak remove -y"
alias fmaj="flatpak update -y"
alias fs="flatpak search"' >> ~/.bashrc
fi
cd ./config-ubuntu/
cp ./"Chemin d'accès" ~/.local/share/nautilus/scripts/
echo ""

echo -e "\033[1;32m==========Configuration générale de GNOME==========\033[0m"
echo " - Suramplification"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo " - Modification du format de la date et heure"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-format "24h"
echo " - Paramétrage Touch Pad"
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"
echo " - Epuration des fichiers temporaires et de la corbeille de plus de 30 jours"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age "30"

echo "Configuration de GNOME Text Editor"
gsettings set org.gnome.TextEditor highlight-current-line false
gsettings set org.gnome.TextEditor show-line-numbers true