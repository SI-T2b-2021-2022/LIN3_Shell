#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : Kerberos Script - LIN3
# Last update   : 12.1.2022
# Version       : V1
# Work on       : Deb based distribution
# =================================================

# Arreter le script en cas d'erreur
set -e

# Check si exec en root ou sudo
if [[ $(id -u) -ne 0 ]]; then
    echo ""
    echo "Erreur ! Lancez en root ou sudo ❌."
    echo ""
    exit 0
fi