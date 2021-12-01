#!/bin/bash

# =================================================
# Author        : Yann Solliard - SI-T2b
# Usage         : NTP Script - LIN3
# Last update   : 01.06.2021
# Version       : V0.1
# Contributor   : Jonas Aeschbacher
# =================================================

set -e

# Check si exec en root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if argument $1 est là
if [ -z "$1" ]; then
    echo "Usage   : $0 <client/serveur>"
    echo "Example : $0 client"
    echo ""
    exit 1
fi

# Check if argument $2 est là
if [ -z "$1" ]; then
    echo "Usage   : $0 <client/serveur> <install/check>"
    echo "Example : $0 client install"
    echo ""
    exit 1
fi

# Check si ntp est installé
if ! command -v ntpd &>/dev/null; then
    echo "ntp is not installed."
    echo "Installing..."
    apt install ntp -y > /dev/null
fi

# Check si ntpstat est installé
if ! command -v ntpstat &>/dev/null; then
    echo "ntpstat is not installed."
    echo "Installing..."
    apt install ntpstat -y > /dev/null
fi

# Check si curl est installé
if ! command -v curl &>/dev/null; then
    echo "curl is not installed."
    echo "Installing..."
    apt install curl -y > /dev/null
fi

# Check si wget est installé
if ! command -v wget &>/dev/null; then
    echo "wget is not installed."
    echo "Installing..."
    apt install wget -y > /dev/null
fi

# Check si nano est installé
if ! command -v nano &>/dev/null; then
    echo "nano is not installed."
    echo "Installing..."
    apt install nano -y > /dev/null
fi

if [ $1 == "client" ]; then
    bash ./Sources/client.sh $2
    exit 1
fi

if [ $1 == "serveur" ]; then
    bash ./Sources/serveur.sh $2
    exit 1
fi