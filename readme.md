# Script Shell NTP LIN3

Dernière modification : 07/12/2021


## Utilisation

lancez la commande en modifiant "arg1" par "server" ou "client" et remplacez "arg2" par "install" ou "check"

```Shell
curl -L https://raw.githubusercontent.com/SI-T2b-2021-2022/LIN3_Shell/main/ntp.sh | bash -s -- arg1 arg2
```

### server install
Permet d'installer le serveur ntp utilisant time.euro.apple.com comme serveur de temps et time.windows.com comme serveur de secours.

### server check
Permet d'afficher des informations lier à la synchronisation du ntp avec le serveur de stratum supérieur

### client install
Permet d'installer le client ntp et utiliser le serveur de stratum supérieur choisit par vos soins (IP demandé durant l'execution du script)

### client check
Permet d'afficher les informations lier à la synchronisation du ntp avec le serveur ntp local