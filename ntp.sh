#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : NTP Script - LIN3
# Last update   : 07.12.2021
# Version       : V0.1
# Contributor   : Jonas / Ashraf
# Work on       : Deb based distribution
# =================================================

# Arreter le script en cas d'erreur
set -e

# Check si exec en root ou sudo
if [ "$EUID" -ne 0 ]; then
    echo ""
    echo "Erreur ! Lancez en root ou sudo ❌."
    echo ""
    exit 0
fi

# Check si argument donné
if [[ -z $1 || -z $2 ]]; then
    echo ""
    echo "Argument invalide ! ❌"
    echo "Usage   : $0 <client/server> <install/check>"
    echo "Exemple : $0 client install"
    echo ""
    exit 0
else
    # Check if argument $1 est bon
    if [ $1 != "client" ] && [ $1 != "server" ]; then
        echo ""
        echo "Argument '$1' invalide ! ❌"
        echo "Usage   : $0 <client/server> <install/check>"
        echo "Exemple : $0 client install"
        echo ""
        exit 0
    fi

    # Check if argument $2 est bon
    if [ $2 != "check" ] && [ $2 != "install" ]; then
        echo ""
        echo "Argument '$2' invalide ! ❌"
        echo "Usage   : $0 $1 <install/check>"
        echo "Exemple : $0 $1 install"
        echo ""
        exit 0
    fi
fi

# Update repo
apt update > /dev/null 2>&1

# Check si apt-utils est installé
if ! command -v ntpd &>/dev/null; then
    echo "apt-utils is not installed."
    echo "Installing..."
    apt install apt-utils -qq -y > /dev/null 2>&1
fi

# Clone repo github
if [ ! -f ./LIN3/.cloned ]; then
    # Check if git installed
    if ! command -v git &>/dev/null; then
    echo "git is not installed."
    echo "Installing..."
    apt install git -qq -y > /dev/null 2>&1
    fi
    
    # Clone repo
    echo "=============================================================================="
    echo "Cloning repository"
    echo ""
    mkdir -p /tmp/git/
    git clone https://github.com/SI-T2b-2021-2022/LIN3_Shell /tmp/git/
    cp -r /tmp/git/* ./
    sleep 2
    rm -rf /tmp/git/
    echo ""
    echo "Clone finished"
    echo "=============================================================================="
    echo ""
fi


# Check si ntp est installé
if ! command -v ntpd &>/dev/null; then
    echo "ntp is not installed."
    echo "Installing..."
    apt install ntp -qq -y > /dev/null 2>&1
fi

# Check si ntpstat est installé
if ! command -v ntpstat &>/dev/null; then
    echo "ntpstat is not installed."
    echo "Installing..."
    apt install ntpstat -qq -y > /dev/null 2>&1
fi

# Check si curl est installé
if ! command -v curl &>/dev/null; then
    echo "curl is not installed."
    echo "Installing..."
    apt install curl -qq -y > /dev/null 2>&1
fi

# Check si wget est installé
if ! command -v wget &>/dev/null; then
    echo "wget is not installed."
    echo "Installing..."
    apt install wget -qq -y > /dev/null 2>&1
fi

# Check si nano est installé
if ! command -v nano &>/dev/null; then
    echo "nano is not installed."
    echo "Installing..."
    apt install nano -qq -y > /dev/null 2>&1
fi

if [ $1 == "client" ]; then
    bash ./LIN3/client.sh $2
    exit 1
fi

if [ $1 == "server" ]; then
    bash ./LIN3/server.sh $2
    exit 1
fi