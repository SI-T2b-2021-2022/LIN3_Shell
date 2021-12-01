#!/bin/bash

# =================================================
# Author        : Yann Solliard - SI-T2b
# Usage         : NTP Script - LIN3
# Last update   : 01.06.2021
# Version       : V0.1
# Contributor   : Jonas Aeschbacher
# Work on       : Debian 11
# Run first time: curl -L https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | bash -s -- client install
# =================================================

set -e
clear

# Check si exec en root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if argument $1 est là
if [ -z "$1" ]; then
    echo "Usage   : $0 <client/serveur> <install/check>"
    echo "Example : $0 client install"
    echo ""
    exit 1
fi

# Check if argument $2 est là
if [ -z "$2" ]; then
    echo "Usage   : $0 $1 <install/check>"
    echo "Example : $0 $1 install"
    echo ""
    exit 1
fi

# Check si apt-utils est installé
if ! command -v ntpd &>/dev/null; then
    echo "ntp is not installed."
    echo "Installing..."
    apt install apt-utils -qq -qq -y > /dev/null /dev/null 2>&1
fi


# Clone repo github
if [ ! -f ./LIN3_Shell/LIN3/.cloned ]; then
    if ! command -v git &>/dev/null; then
    echo "git is not installed."
    echo "Installing..."
    apt install git -qq -qq -y > /dev/null /dev/null 2>&1
    fi
    echo "Cloning repository"
    mkdir -p /tmp/git/
    git clone https://github.com/SI-T2b-2021-2022/LIN3_Shell /tmp/git/
    cp -r /tmp/git/* ./
    sleep 2
    rm -rf /tmp/git/
fi




# Update repo
apt update > /dev/null /dev/null 2>&1

# Check si ntp est installé
if ! command -v ntpd &>/dev/null; then
    echo "ntp is not installed."
    echo "Installing..."
    apt install ntp -qq -y > /dev/null /dev/null 2>&1
fi

# Check si ntpstat est installé
if ! command -v ntpstat &>/dev/null; then
    echo "ntpstat is not installed."
    echo "Installing..."
    apt install ntpstat -qq -y > /dev/null /dev/null 2>&1
fi

# Check si curl est installé
if ! command -v curl &>/dev/null; then
    echo "curl is not installed."
    echo "Installing..."
    apt install curl -qq -y > /dev/null /dev/null 2>&1
fi

# Check si wget est installé
if ! command -v wget &>/dev/null; then
    echo "wget is not installed."
    echo "Installing..."
    apt install wget -qq -y > /dev/null /dev/null 2>&1
fi

# Check si nano est installé
if ! command -v nano &>/dev/null; then
    echo "nano is not installed."
    echo "Installing..."
    apt install nano -qq -y > /dev/null /dev/null 2>&1
fi

if [ $1 == "client" ]; then
    bash ./LIN3/client.sh $2
    exit 1
fi

if [ $1 == "serveur" ]; then
    bash ./LIN3/serveur.sh $2
    exit 1
fi

exit 0