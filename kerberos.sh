#!/bin/bash

# =================================================
# Author        : Yann - SI-T2b
# Usage         : Kerberos Script - LIN3
# Last update   : 26.1.2022
# Version       : V2
# Work on       : Deb based distribution
# =================================================


apt update

echo krb5-config krb5-config/add_servers_realm string krb5.$(hostname -d) | debconf-set-selections
echo krb5-config krb5-config/admin_server string $(hostname -d) | debconf-set-selections
echo krb5-config krb5-config/default_realm string $(hostname -d) | debconf-set-selections
echo krb5-config krb5-config/kerberos_servers string krb5.$(hostname -d) | debconf-set-selections

apt install -y krb5-kdc krb5-admin-server krb5-config