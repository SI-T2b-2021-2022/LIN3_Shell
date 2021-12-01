#!/bin/bash

# =================================================
# Author        : Yann Solliard - SI-T2b
# Usage         : NTP Script - LIN3 - Serveur
# Last update   : 01.06.2021
# Version       : V0.1
# Contributor   : Jonas Aeschbacher
# =================================================

set -e
echo "=============================================================================="

# Partie installation
if [ $1 == "install" ]; then
    
    # Check if ufw is here for allowing Port 123 UDP
    if ! command -v uwf &>/dev/null; then
    echo "ufw is not installed. Bypassing..."
    else
    echo "Allowing UDP 123..."
    ufw allow from any to any port 123 proto udp
    fi

    # Rewrite ntp.conf
    echo "Importing ntp.conf..."
    curl https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/LIN3/ntp_serveur.conf > /etc/ntp.conf

    # Restart ntp service
    echo "Restarting ntp service..."
    service ntp restart
    sleep 5

    # Show Information
    echo "=============================================================================="
    ntpstat
    echo "=============================================================================="
    ntpq -pn
    echo "=============================================================================="

    exit 1
fi

# Partie Check
if [ $1 == "check" ]; then
    


    exit 1
fi