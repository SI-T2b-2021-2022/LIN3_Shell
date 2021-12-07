#!/bin/bash

# =================================================
# Author        : Yann Solliard - SI-T2b
# Usage         : NTP Script - LIN3 - Serveur
# Last update   : 01.06.2021
# Version       : V0.1
# Contributor   : Jonas Aeschbacher
# =================================================

set -e
echo "=============================Server.sh======================================="

# Partie installation
if [ $1 == "install" ]; then
    
    # Check if ufw is here for allowing Port 123 UDP
    if ! command -v ufw &>/dev/null; then
        echo "ufw is not installed. Bypassing..."
    else
        echo "Allowing UDP 123..."
        ufw allow from any to any port 123 proto udp
    fi

    # Stop ntp
    echo "Stopping ntp..."
    service ntp stop

    # Rewrite ntp.conf
    echo "Importing ntp.conf..."
    curl -s https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/LIN3/ntp_serveur.conf > /etc/ntp.conf

    # Restart ntp service
    echo "Restarting ntp service..."
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