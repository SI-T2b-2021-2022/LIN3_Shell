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
    apt install apt-utils -y 2>/dev/null
fi


# Clone repo github
if [ ! -f ./LIN3_Shell/LIN3/.cloned ]; then
    if ! command -v git &>/dev/null; then
    echo "git is not installed."
    echo "Installing..."
    apt install git -y 2>/dev/null
    fi
    echo "Cloning repository"
    mkdir /tmp/git/
    git clone https://github.com/SI-T2b-2021-2022/LIN3_Shell /tmp/git/
    mv /tmp/git/* ./
    rm -rf /tmp/git/.git/
fi




# Update repo
apt update > /dev/null

# Check si ntp est installé
if ! command -v ntpd &>/dev/null; then
    echo "ntp is not installed."
    echo "Installing..."
    apt install ntp -y 2>/dev/null
fi

# Check si ntpstat est installé
if ! command -v ntpstat &>/dev/null; then
    echo "ntpstat is not installed."
    echo "Installing..."
    apt install ntpstat -y 2>/dev/null
fi

# Check si curl est installé
if ! command -v curl &>/dev/null; then
    echo "curl is not installed."
    echo "Installing..."
    apt install curl -y 2>/dev/null
fi

# Check si wget est installé
if ! command -v wget &>/dev/null; then
    echo "wget is not installed."
    echo "Installing..."
    apt install wget -y 2>/dev/null
fi

# Check si nano est installé
if ! command -v nano &>/dev/null; then
    echo "nano is not installed."
    echo "Installing..."
    apt install nano -y 2>/dev/null
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