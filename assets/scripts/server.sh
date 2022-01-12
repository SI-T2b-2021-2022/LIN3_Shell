#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : NTP Script - LIN3 - Serveur
# Last update   : 07.12.2021
# Version       : V0.1
# Contributor   : Jonas
# =================================================

echo ""
echo "=============================Server.sh======================================="

# Partie installation
if [ $1 == "install" ]; then
    
    # Check if ufw is here for allowing Port 123 UDP
    if ! command -v ufw &>/dev/null; then
        echo "ufw n'est pas installé."
    else
        echo "Modification d'ufw pour ouvrir le port UDP 123..."
        ufw allow from any to any port 123 proto udp
    fi

    # Stop ntp
    echo "Arrêt du service ntp..."
    service ntp stop

    # Rewrite ntp.conf
    echo "Importation de ntp.conf..."
    curl -s https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/LIN3/ntp_server.conf > /etc/ntp.conf

    # Restart ntp service
    echo "Redémarrage du service ntp..."
    service ntp restart
    sleep 10

    # Show Information
    echo "=============================================================================="
    ntpstat
    echo "=============================================================================="
    ntpq -pn
    echo "=============================================================================="
    echo ""
    echo "Vous pouvez désormais lancez le script avec l'argument *check* afin d'avoir plus d'information."
    echo ""
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
    echo ""
    echo "TimeZone :"
    cat /etc/timezone
    echo ""

    exit 1
fi