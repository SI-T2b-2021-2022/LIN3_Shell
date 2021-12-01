###### NTP SERVER
sudo apt-get update
sudo apt-get install ntp
sntp --version
#### Push fichier ntp.conf du ntp server
sudo service ntp restart
sudo ufw allow from any to any port 123 proto udp

#### NTP CLIENT
sudo apt-get update
sudo apt-get install ntp
sudo timedatectl set-ntp off
#### Push fichier ntp.conf du ntp server
sudo service ntp restart
