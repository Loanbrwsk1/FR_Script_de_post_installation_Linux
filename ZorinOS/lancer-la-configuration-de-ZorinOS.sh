#!/bin/bash

echo ""
sudo ./config-zorin/config-zorin.sh
echo ""

if zenity --question --title="Configuration" --text="Voulez-vous lancer le script de configuration de GNOME (voir la documentation) ?"
then
    echo -e "\033[1;32m==========Configuration de GNOME==========\033[0m"
    ./config-zorin/gnome-customization.sh
    echo ""
    echo -e "\033[1;32m==========Configuration terminée==========\033[0m"
    echo ""
else
        echo "Configuration de GNOME non-lancée"
fi
	

if zenity --question --title="Redémarrage" --text="Voulez-vous redémarrer le système maintenant ?"
then
    systemctl reboot
else
    echo "Redémarrage annulé"
fi
