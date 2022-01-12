# Script Shell NTP LIN3

## NTP
Dernière modification : 12/01/2022
### Commande pour lancer le script

Lire entièrement le readme avant de lancer la commande.

```Shell
curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- arg1 arg2 arg3 arg4
```

Voir ci dessous explication des arguments possibles

### arg1

L'argument 1 permet de définir si nous voulons demander au script d'être en mode serveur ou client

Exemple : 
```Shell
curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- server

curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- client
```

### arg2

L'argument 2 permet de définir si nous voulons installer ou checker le serveur / client (<- Dépend de l'argument 1)

Exemple : 
```Shell
curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- server install

curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- client check
```

### arg3

L'argument 3 n'est utilisable qu'en mode client install, il permet de définir le serveur ntp primaire du client

Exemple : 
```Shell
curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- client install 10.0.1.10
```

### arg4

L'argument 4 n'est utilisable qu'en mode client install, il permet de définir le serveur ntp de secours du client

Exemple : 
```Shell
curl -sL https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | sudo bash -s -- client install 10.0.1.10 time.euro.apple.com
```

## Kerberos