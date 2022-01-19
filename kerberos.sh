#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : Kerberos Script - LIN3
# Last update   : 19.1.2022
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

# Check si argument donné
if [[ -z $1 || -z $2 ]]; then
    echo ""
    echo "Argument invalide ! ❌"
    echo "Usage   : $0 <client/server> <install/check>"
    echo "Exemple : $0 client install"
    echo ""
    exit 0
else
    Check if argument $1 est bon
    if [ $1 != "client" ] && [ $1 != "server" ]; then
        echo ""
        echo "Argument '$1' invalide ! ❌"
        echo "Usage   : $0 <client/server> <install/check>"
        echo "Exemple : $0 client install"
        echo ""
        exit 0
    fi

    Check if argument $2 est bon
    if [ $2 != "check" ] && [ $2 != "install" ]; then
        echo ""
        echo "Argument '$2' invalide ! ❌"
        echo "Usage   : $0 $1 <install/check>"
        echo "Exemple : $0 $1 install"
        echo ""
        exit 0
    fi

    Check si argument pour serveur kerberos personnalisé présent
    if [[ $1 == "client" && $2 == "install"  ]]; then
        if [ -z $3 ]; then
            echo ""
            echo "Serveur keberos manquant ! ❌"
            echo "Usage   : $0 $1 $2"
            echo "Exemple : $0 client install 10.0.1.11"
            echo ""
            exit 0
        fi
    fi
fi

apt update

echo krb5-config krb5-config/add_servers_realm string krb5.int.slyinc.ch | debconf-set-selections
echo krb5-config krb5-config/admin_server string int.slyinc.ch | debconf-set-selections
echo krb5-config krb5-config/default_realm string int.slyinc.ch | debconf-set-selections
echo krb5-config krb5-config/kerberos_servers string krb5.int.slyinc.ch | debconf-set-selections

apt install -y krb5-kdc krb5-admin-server krb5-config