#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : NTP Script - LIN3 - Client
# Last update   : 07.12.2021
# Version       : V0.1
# Contributor   : Jonas
# =================================================

echo "==============================Client.sh======================================="

# Partie installation
if [ $1 == "install" ]; then
    
    # Stop ntp
    echo "Arrêt du service ntp..."
    service ntp stop

    # Rewrite ntp.conf
    echo "Importation de ntp.conf..."
    curl -s https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/LIN3/ntp_client.conf > /etc/ntp.conf

    # Demande l'ip / url du serveur de stratum supérieur
    echo ""
    read -p "Écrivez l'ip du serveur ntp que vous voulez utiliser : " answer < /dev/tty

    # Modifiez changeme par ${answer}
    sed -i "s/changeme/${answer}/" /etc/ntp.conf


    # Restart ntp service
    echo "Redémarrage du service ntp..."
    service ntp restart
    sleep 12

    # Show Information
    echo "=============================================================================="
    ntpstat
    echo "=============================================================================="
    ntpq -pn
    echo "=============================================================================="
    echo ""
    echo "Vous pouvez désormais lancez le script avec l'argument *check* afin d'avoir plus d'information."

    exit 1
fi

# Partie Check
if [ $1 == "check" ]; then
    # Show Information
    echo ""
    echo "================================ntpstat======================================="
    ntpstat
    echo ""
    echo "================================ntpq -pn======================================"
    ntpq -pn
    echo ""
    echo "================================ntpq -c rv===================================="
    ntpq -c rv
    echo ""
    echo "=================================ntptime======================================"
    ntptime
    echo ""
    echo "=================================date========================================="
    date
    cat /etc/timezone
    echo ""

    exit 1
fi