#! /bin/bash

zenity --question --title="Fonds d'écran" --text="Voulez-vous des fonds d'écran supplémentaires ? (peut prendre du temps)"
wallpaper=$?
zenity --question --title="Fonds d'écran dynamiques" --text="Voulez-vous des fonds d'écran dynamiques supplémentaires ?"
dynamic_wallpaper=$?

if [ $wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Wallpapers.git 
    cd Wallpapers
    mv ./wallpapers/ ~/Images/
    cd ..
    rm -fr ./Wallpapers/
fi

if [ $dynamic_wallpaper -eq 0 ]
then
    git clone https://github.com/Loanbrwsk1/Dynamic-wallpapers.git
    cd ./Dynamic-wallpapers/
    sudo mv ./Dynamic_Wallpapers/ /usr/share/backgrounds/
    sudo mv ./xml/* /usr/share/cinnamon-background-properties/
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
cd ./config-lm/
cp ./"Chemin d'accès" ~/.local/share/nemo/scripts/
echo ""

echo -e "\033[1;32m==========Personnalisation de Cinnamon==========\033[0m"

echo "Personnalisation du Bureau"
echo "Modification du format de l'heure"
gsettings set org.cinnamon.desktop.interface clock-show-seconds "true"
gsettings set org.cinnamon.desktop.interface clock-show-date "true"