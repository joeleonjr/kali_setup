#!/bin/bash

echo "##############################################################"
echo "##############################################################"
echo "#                                                            #"
echo "#          _    _                    __ _                    #"
echo "#    ____ | |  (_)                  / _| |                   #"
echo "#   / __ \| | ___ _ __   __ _  ___ | |_| | ___  ___  _ __    #"
echo "#  / / _  | |/ / |  _ \ / _' |/ _ \|  _| |/ _ \/ _ \|  _ \   #"
echo "# | | (_| |   <| | | | | (_| | (_) | | | |  __/ (_) | | | |  #"
echo "#  \ \__,_|_|\_\_|_| |_|\__, |\___/|_| |_|\___|\___/|_| |_|  #"
echo "#   \____/               __/ |                               #"
echo "#                       |___/                                #"
echo "#                                                            #"
echo "#                                                            #"
echo "#   Kali setup script built by github.com/kingofleon         #"
echo "#                                                            #"
echo "#                                                            #"
echo "#   Note: Author makes no claims or warranties. Use at       #"
echo "#         your own risk.                                     #"
echo "#                                                            #"
echo "##############################################################"
echo "##############################################################"  

#1 change password
echo ""
echo ""
echo "[i] Change the default password."
passwd root
while [[ $? == 10 ]]; do
    passwd root
done
echo ""

#2 Update searchsploit
searchsploit -u

#3 Install Node and NPM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node
nvm use node

#4 Install gobuster
apt-get install gobuster

#5 Add Seclists, PLATT, ORTRTA
git clone https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/SecLists
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git /usr/share/wordlists/PayloadsAllTheThings
wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule -P /usr/share/wordlists
wget https://raw.githubusercontent.com/hashcat/hashcat/master/rules/rockyou-30000.rule -P /usr/share/wordlists

#6 Install nmap-parse-output
git clone https://github.com/ernw/nmap-parse-output.git /opt/nmap-parse-output

#7 Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

#8 Other installs (mingw for windows cross compiling, ftp for file transfers, golang, rinetd)
sudo apt-get install mingw-w64
sudo apt-get install python-pyftpdlib
sudo apt-get install cifs-utils
sudo apt-get install golang
sudo apt-get install rinetd

#9 Add in @kingofleon scripts noisy-recon + privesc enumeration scripts
wget https://raw.githubusercontent.com/kingofleon/noisy-recon/master/noisy-recon -P /usr/local/bin
chmod u+x /usr/local/bin/noisy-recon

mkdir /usr/share/privesc
wget https://raw.githubusercontent.com/absolomb/WindowsEnum/master/WindowsEnum.ps1 -P /usr/share/privesc
wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1 -P /usr/share/privesc
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -P /usr/share/privesc
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl -P /usr/share/privesc
wget http://www.securitysift.com/download/linuxprivchecker.py -P /usr/share/privesc
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1 -P /usr/share/privesc

#10 updatedb for locate
updatedb

#11 Add FireFox Extensions
echo "Install FoxyProxy and wappalyzer!"
echo ""

#12 Update aptitude
echo "If you want to update and upgrade apt, use this command:"
echo "sudo apt-get update && apt-get -y full-upgrade && apt-get dist-upgrade"
echo ""
exit 0