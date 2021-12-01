#!/bin/bash

# =================================================
# Author        : Yann Solliard - SI-T2b
# Usage         : NTP Script - LIN3 - Serveur
# Last update   : 01.06.2021
# Version       : V0.1
# Contributor   : Jonas Aeschbacher
# =================================================

set -e
echo "======================================================"

# Partie installation
if [ $1 == "install" ]; then
    
    # Check if ufw is here for allowing Port 123
    if ! command -v uwf &>/dev/null; then
    echo "ufw is not installed. Bypassing..."
    else
    echo "Allowing UDP 123"
    ufw allow from any to any port 123 proto udp
    fi

    echo "Importing ntp.conf"
    curl -L 

    service ntp restart

    exit 1
fi

# Partie Check
if [ $1 == "check" ]; then
    


    exit 1
fi