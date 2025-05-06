echo ""
sudo ./config-ubuntu/config-ubuntu.sh
echo ""

if zenity --question --title="Configuration" --text="Voulez-vous lancer le script de configuration de GNOME (voir README-custom.txt) ?"
then
        echo -e "\033[1;32mConfiguration de GNOME\033[0m"
    	./config-ubuntu/gnome-customization.sh
	    echo ""
	    echo -e "\033[1;32mConfiguration terminée\033[0m"
	    echo ""
else
        echo "Configuration de GNOME non-lancée"
fi
	
echo -e "\033[1;32m==========Configuration terminée==========\033[0m"
echo ""

if zenity --question --title="Redémarrage" --text="Voulez-vous redémarrer le système maintenant ?"
then
        systemctl reboot
else
        echo "Redémarrage annulé"
fi
